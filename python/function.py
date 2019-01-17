# -*- coding: utf-8 -*-
"""
Created on Sun Jan 13 00:58:08 2019

@author: Jelly
"""

from db_connect import DB_CONN
import setting
import math
import pandas as pd
import matplotlib.pyplot as plt

class FUNC_CLASS(DB_CONN):

    def __init__(self):
        super().__init__()

    # 取得user的id
    def get_user_id(self,user_unid):
        user_id = 0
        user_sql = "SELECT `id` FROM `ex_user` WHERE `unid` = %s"

        try:
            self.execute(user_sql,[user_unid])
            user_id_arr = self.fetchone()
            user_id = str(user_id_arr['id']) if int(user_id_arr['id']) != 0 else ''
        except:
            user_id = 0

        return user_id

    # 取得user的搜尋紀錄
    def get_this_user_search(self,user_id):
        user_record = {}

        if user_id != '':
            # 取得user 最後搜尋的條件
            user_last_sql = """
                SELECT `area`,`price`,`ping`,`style`,`type`
                FROM `ex_user_record_view`
                WHERE `user_id` = %s 
                ORDER BY `last_time` DESC LIMIT 1
                """
            # 取得user 經常搜尋的條件 (以價格跟坪數篩選)
            user_often_sql = """
                SELECT `area`,`price`,`ping`,`style`,`type`
                FROM `ex_record`
                WHERE `user_id` = %s
                ORDER BY `times` DESC,`price`,`ping` DESC LIMIT 2
                """

            try:
                # 取得user [最後]搜尋的條件
                self.execute(user_last_sql,[user_id])
                user_last_arr = self.fetchone()
                if(user_last_arr != None):
                    user_record['last_record'] = [user_last_arr['area'],user_last_arr['price'],user_last_arr['ping'],user_last_arr['style'],user_last_arr['type']]
                
                # 取得user [經常]搜尋的條件
                self.execute(user_often_sql,[user_id])
                user_often_arr = self.fetchone()

                if user_often_arr != None:
                    user_record['often_record'] = [user_often_arr['area'],user_often_arr['price'],user_often_arr['ping'],user_often_arr['style'],user_often_arr['type']]
            except:
                user_record = {}

        return user_record

    # 取得非user的相同的紀錄
    def get_same_record(self,user_id,record):
        record_arr = {}

        # 取得user record
        record_sql = """
            SELECT  user.`id`
            FROM    `ex_user` user,`ex_record` record
            WHERE   user.`id` = record.`user_id` AND
                    record.`user_id` != %s AND
                    record.`area`    = %s AND
                    record.`price`   = %s AND
                    record.`ping`    = %s AND
                    record.`style`   = %s AND
                    record.`type`    = %s AND
                    user.`login_time` >= (NOW() - INTERVAL %s DAY)
            """
        
        record_vals = [
                user_id,
                record[0],record[1],record[2],
                record[3],record[4],
                setting.search_house_seconds
        ]

        try:
            if(record):
                self.execute(record_sql,record_vals)
                record_arr = self.fetchall()

        except:
            record_arr = {}

        return record_arr

    # 取得瀏覽物件的時間區間(單位:秒)
    def get_times_range(self,user_id,record):
        record_arr = {}
        new_arr = {
                    'user_id':[],
                    'record_times':[],
                    'main_id':[],
                    'items_times':[],
                    'click_map':[],
                    'add_favorite':[],
                    'item_stay_time':[],
                    'map_stay_time':[]
                }

        # 取得user record
        record_sql = """
            SELECT  `user_id`,`record_times`,`main_id`,`items_times`,`click_map`,
                    `add_favorite`,`item_stay_time`,`map_stay_time`
            FROM    `ex_user_record_view` 
            WHERE   `user_id` = %s AND
                    `area`    = %s AND
                    `price`   = %s AND
                    `ping`    = %s AND
                    `style`   = %s AND
                    `type`    = %s 
            ORDER BY `item_stay_time`
            """
        
        record_vals = [
                user_id['id'],record[0],
                record[1],record[2],record[3],
                record[4]]

        #try:
        if(record):
            self.execute(record_sql,record_vals)
            record_arr = self.fetchall()

            if record_arr:
                for record in record_arr:
                    for x in record:
                        new_arr[x].append(record[x])

            # 刪除離群值
            outlier = self.get_outlier(new_arr,'item_stay_time')
            print(outlier['Outlier'])
            # 某user喜歡物件的時間圓餅圖
            if new_arr['item_stay_time']:
                self.plt_pie(new_arr)
            
            #df = self.del_outlier(record_arr,'item_stay_time')
            #df = self.df_groupby(record_arr,'add_favorite')
            #df = pd.DataFrame(record_arr, columns=['main_id','add_favorite'])
            #print(df)
          
        #except:
            #record_arr = {}

        return record_arr
    """
    def get_times_range(self,user_id,record):
        range_arr = {}

        record_sql = '''
            SELECT  items.click_map,items.add_favorite,items.main_id,
                    IFNULL(
                        (SELECT SUM(`stay_time`) 
                        FROM    `ex_record_items_stay` items_stay
                        WHERE   items_stay.`record_items_id` = items.`id` AND
                                `stay_time` > %s
                    ),0) AS 'all_seconds'
            FROM `ex_record` record,`ex_record_items` items 
            WHERE items.`record_id` = record.`id` AND
                  items.`user_id` = record.`user_id` AND
                  record.`user_id` = %s AND
                  record.`area`    = %s AND
                  record.`price`   = %s AND
                  record.`ping`    = %s AND
                  record.`style`   = %s AND
                  record.`type`    = %s AND
                  record.`times`   > %s
            '''
        record_vals = [
                setting.view_seconds,user_id,record[0],
                record[1],record[2],record[3],
                record[4],setting.search_times
        ]
        try:
            self.execute(record_sql,record_vals)
            record_arr = self.fetchall()
            
            times_arr = []
            if record_arr:
                for record in record_arr:
                    times_arr.append(record['all_seconds'])
                    times_arr.sort()
                
                if times_arr:
                    # 取得中位數的前後值
                    range_arr = self.get_median_range(times_arr)   
        except:
            range_arr = {}

        return range_arr
    """
    # 取得中位數的前後值
    def get_median_range(self,times_arr):
        range_arr = {}
        times_arr_len = len(times_arr)
        
        if times_arr_len == 1:
            range_arr['seconds_start'] = times_arr[0]
            range_arr['seconds_end'] = times_arr[0]
        elif times_arr_len == 2:
            range_arr['seconds_start'] = times_arr[0]
            range_arr['seconds_end'] = times_arr[1]
        elif times_arr_len%2 == 0:
            median_index = (times_arr_len / 2)
            range_arr['seconds_start'] = times_arr[median_index - 1]
            range_arr['seconds_end'] = times_arr[median_index + 1]
        elif times_arr_len%2 != 0:
            median_index = math.floor(times_arr_len / 2)
            range_arr['seconds_start'] = times_arr[median_index - 1]
            
            median_index = math.ceil(times_arr_len / 2)
            range_arr['seconds_end'] = times_arr[median_index]
        
        return range_arr
    
    # 取得分位數
    def quantile(data,percent):
        p_index = int(percent * len(data))
        return sorted(data)[p_index]
    
    # 某user喜歡物件的時間圓餅圖
    def plt_pie(self,data):
        explode = []
        df      = pd.DataFrame(data)
        labels  = df['main_id']
        sizes   = df['item_stay_time']
        
        median_num = round(len(data['item_stay_time']))
        
        for zero in range(len(data['item_stay_time'])):
            explode.append(0.1 if (zero + 1) == median_num else 0)
            
        #explode = (0,0,0,0.1,0,0)  
        
        fig1, ax1 = plt.subplots()
        ax1.pie(sizes, explode=explode, labels=labels, autopct='%1.1f%%',
                shadow=True)
        ax1.axis('equal')    
        plt.show()
        
    # 取得離群值
    def get_outlier(self,data,field):
        df = pd.DataFrame(data, columns=[field])

        # abs:絕對值;  abs(X - 平均值)
        df['x-Mean'] = abs(df[field] - df[field].mean())
        # std:標準差，有 95% 信心估計母群體平均數，在樣本平均數 ± 1.96 * (母群體標準差 / 樣本數 n 的平方根) 的範圍內。
        df['1.96*std'] = 1.96*df[field].std()  
        df['Outlier'] = abs(df[field] - df[field].mean()) > 1.96*df[field].std()
        
        return df
    
    # 取得該User是否有加入最愛的習慣
    def get_is_favorite(self,user_id):
        return ''
'''
import function
x = function.DB_CONN()

AA = x.execute("SELECT `id` FROM `ex_user` WHERE `unid` = 'm199cdc39ee6e65811960a187ccf1fcb9'")
rows = x.fetchall()    # get all selected rows, as Barmar mentioned
for r in rows:
    print(r)
'''