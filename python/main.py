# -*- coding: utf-8 -*-
"""
Created on Sat Jan 12 20:23:18 2019

@author: Jelly
"""
from function import FUNC_CLASS
from scipy import sparse
import sys
import os
import setting
import functools
import numpy as np
from sklearn.metrics import pairwise_distances
from scipy.spatial.distance import cosine
#user_unid = sys.argv[1]
#user_unid = 'm199cdc39ee6e65811960a187ccf1fcb9'
#user_unid = '7f16a3540e74b904ed3ee626c79af314'
user_unid = 'm185ccab81019a39cba16f666f070bb83'
func = FUNC_CLASS()

user_items_dict = []
others_user_items_dict = []
times_range_items = []
re_val = []
# 取得A的搜尋紀錄
record_data = func.get_this_user_search(user_unid)

if len(record_data['often_record']) > 1:
    for key,record in record_data.items():
        if record and key == 'last_record' and record[0] in record_data['often_record']:
            continue
        elif record:
            for record_val in record:
                # 取得A(喜愛)的物件(瀏覽時間大於5秒,瀏覽次數大於1or有加入最愛)
                times_range_items = func.get_times_range_items(user_unid,record_val)
                #print(record_val,times_range_items)
                if times_range_items:
                    user_items_dict.append(times_range_items)

                # 取得非user的相同紀錄
                same_records_user_id = func.get_same_record(user_unid,record_val)

                if same_records_user_id:
                    times_range_items = {}
                    for other_user_id in same_records_user_id:
                        # 取得某位User瀏覽物件的資料
                        times_range_items = func.get_times_range_items(other_user_id['unid'],record_val)

                        if times_range_items:
                            others_user_items_dict.append(times_range_items)
    #將所有User都加起來(有興趣的物件)
    users_items = user_items_dict + others_user_items_dict
    #print('user_items_dict',user_items_dict)
    #print('others_user_items_dict',others_user_items_dict)



    #取得相似的使用者，獲得該使用者喜歡的物件
    #如果users_items的項目不足5項該怎麼處理

    #print('user_items_dict',user_items_dict)
# 如果筆數等於1，則推薦(該搜尋條件)熱門的
elif len(record_data['often_record']) == 1:
    hot_house  = func.get_hot_house(record_data['often_record'][0])
    if len(hot_house) == 0:
        hot_house   = func.get_hot_house(record_data['often_record'][0],1)
    unique_items = [(val['id']) for key, val in enumerate(hot_house)]

# 如果筆數等於0，則推薦(User所在區域)熱門的
else:
    hot_house   = func.get_hot_house([],2,user_unid)
    unique_items = [(val['id']) for key, val in enumerate(hot_house)]

# 取得A(不喜愛)的物件，找到相同記錄、相同在意項目的人
times_range_items_not = func.get_this_user_no_search(user_unid)
print('(不喜愛)的物件',times_range_items_not)

#print(times_range_items_not,users_items)
#print('相似使用者的物件',users_items)
# m199cdc39ee6e65811960a187ccf1fcb9全部可能喜歡的物件:[8, 10, 19]
unique_items = sorted(list({ like_item
                        for user_items in users_items
                        for like_item in user_items }))
#print('全部喜歡的物件',unique_items)

# m199cdc39ee6e65811960a187ccf1fcb9對於該物件是否有興趣，是:1,否:0
def make_user_items_matrix(others_user_items_dict):
    return [1 if items in others_user_items_dict else 0
            for items in unique_items]

if unique_items:
    # 使用者可能對某個物件喜歡1,否:0
    user_items_matrix = list(map(make_user_items_matrix, users_items))
    #print('使用者有興趣的',user_items_matrix)
    # 在某個物件那一列元素中，1代表每個對此可能喜歡的使用者,0標示，代表可能不喜歡
    items_user_matrix = [[user_items_vector[j]
                        for user_items_vector in user_items_matrix]
                        for j, _ in enumerate(unique_items)]
    #print('興趣對使用者',items_user_matrix)
    # 使用餘弦相似度
    items_similarities = [[func.cosine_similarity(user_vector_i, user_vector_j)
                        for user_vector_j in items_user_matrix]
                        for user_vector_i in items_user_matrix]

    #print('items_similarities',items_similarities)
    #print("Item based similarity")
    #print("most similar to 'Big Data'")
    # 找出與某物件最類似的
    #print(func.most_similar_items_to(0,items_similarities[0],unique_items))


    #print("相似的而m199cdc39ee6e65811960a187ccf1fcb9沒有的物件，推薦給他")
    #print(func.item_based_to_user(0,user_items_matrix[0],items_similarities[0],unique_items,users_items))