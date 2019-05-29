# -*- coding: utf-8 -*-
"""
Created on Sat Jan 12 20:23:18 2019

@author: Jelly
"""
from function import FUNC_CLASS
import sys
import setting
import random

#user_unid = sys.argv[1]
user_unid = 'm1b414f0be20777c30e0423f441b09db8'

func = FUNC_CLASS()

user_items_dict = []
others_user_items_dict = []
times_range_items = []
re_val = []
users_items = []
# 取得A的搜尋紀錄
record_data = func.get_this_user_search(user_unid)
print('record_data',record_data)
if len(record_data['often_record']) > 1:
    for key,record in record_data.items():
        if record and key == 'last_record' and record[0] in record_data['often_record']:
            continue
        elif record:
            for record_val in record:
                # 取得A(喜愛)的物件(瀏覽時間大於5秒,瀏覽次數大於1or有加入最愛)
                times_range_items       = func.get_times_range_items(user_unid,record_val)

                if times_range_items:
                    user_items_dict.append(times_range_items)
                print(record_val,'user_items_dict',user_items_dict)
                # 取得非user的相同紀錄
                same_records_user_id    = func.get_same_record(user_unid,record_val)
                #print(record_val,same_records_user_id)
                if same_records_user_id:
                    times_range_items   = {}
                    for other_user_id in same_records_user_id:
                        # 取得某位User瀏覽物件的資料
                        times_range_items   = func.get_times_range_items(other_user_id['user_id'],record_val)
                        print(record_val,'others user',times_range_items)
                        if times_range_items:
                            others_user_items_dict.append(times_range_items)

            #將所有User都加起來(有興趣的物件)
            print('user_items_dict_ALL',user_items_dict)
            #print('others_user_items_dict',others_user_items_dict)
            users_items = user_items_dict + others_user_items_dict
            #print('users_items',users_items)
            # 全部可能喜歡的物件
            unique_items = sorted(list({ like_item
                                for user_items in users_items
                                for like_item in user_items }))

        # 使用者可能對某個物件喜歡1,否:0
        user_items_matrix = list(map(make_user_items_matrix, users_items))
        #print('user_items_matrix',user_items_matrix)
        # 在某個物件那一列元素中，1代表每個對此可能喜歡的使用者,0標示，代表可能不喜歡
        items_user_matrix = [[user_items_vector[j]
                            for user_items_vector in user_items_matrix]
                            for j, _ in enumerate(unique_items)]
        #print('items_user_matrix',items_user_matrix)
        # 使用餘弦相似度
        items_similarities = [[func.cosine_similarity(user_vector_i, user_vector_j)
                            for user_vector_j in items_user_matrix]
                            for user_vector_i in items_user_matrix]
        #print('items_similarities',items_similarities)
        # 找出與某物件最類似的
        #print(func.most_similar_items_to(0,items_similarities[0],unique_items))



# 如果筆數等於1，則推薦(該搜尋條件)熱門的
elif len(record_data['often_record']) == 1:
    hot_house  = func.get_hot_house(record_data['last_record'][0])
    if len(hot_house) == 0:
        hot_house   = func.get_hot_house(record_data['last_record'][0],1)
    unique_items = [(val['id']) for key, val in enumerate(hot_house)]
    users_items = [unique_items]
# 如果筆數等於0，則推薦(User所在區域)熱門的
else:
    hot_house   = func.get_hot_house([],2,user_unid)
    unique_items = [(val['id']) for key, val in enumerate(hot_house)]
    users_items = [unique_items]
print('unique_items',unique_items)

####### 取得A(不喜愛)的物件，找到相同記錄、相同在意項目的人 #######
times_range_items_not = func.get_this_user_no_search(user_unid)
print('times_range_items_not',times_range_items_not)
# 對於該物件是否有興趣，是:1,否:0
def make_user_items_matrix(others_user_items_dict):
    return [1 if items in others_user_items_dict else 0
            for items in unique_items]



# 推薦相似者喜歡的物件給他
recommand_items     = func.item_based_to_user(0,user_items_matrix,items_similarities,unique_items,users_items)
print('recommand_items1',recommand_items)
# 找到相似記錄相似者喜歡的物件給他
recommand_items.extend(times_range_items_not)
recommand_items = list(set(recommand_items))
#print('recommand_items',recommand_items)
# 檢查是否有已經close的物件，若有則取相似的物件替換  461,470
if recommand_items:
    recommand_items     = func.check_close(user_unid,recommand_items)
#print('recommand_items',recommand_items)
# 當推薦物件少於5筆時，加入User所在區域熱門的物件
if len(recommand_items) < setting.less_how_num:
    recommand_items.extend(unique_items)

    if len(recommand_items) < setting.less_how_num:
        if len(record_data['last_record']) == 0:
            hot_house   = func.get_hot_house([],2,user_unid)
        else:
            print(record_data['last_record'])
            hot_house   = func.get_hot_house(record_data['last_record'][0],0,'',recommand_items)
        print('hot_house',hot_house)
        hot_house_arr = []
        for key, val in enumerate(hot_house):
            hot_house_arr.append(val['id'])
        recommand_items.extend(hot_house_arr)
        recommand_items = list(set(recommand_items))
        print('recommand_items2',recommand_items)
print('recommand_items3',recommand_items)
# 隨機取5個物件出來
if len(recommand_items) > 0 and len(recommand_items) < setting.random_num:
    print(recommand_items)
elif len(recommand_items) > 0:
    print(random.sample(recommand_items, setting.random_num))
else:
    print(unique_items)