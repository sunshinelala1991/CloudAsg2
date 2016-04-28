#!/usr/bin/evn python

import TaskV
import sys
import couchdb
from uuid import uuid4
import json

class Task(TaskV):
    
    def __init__(self, conn_str, db):
        super(Task, self).__init__()

    
    def save(self, doc, dest_db):
        super(Task, self).save(doc, dest_db)


    def day_tweet_stat(self,):
        ''' calculate the count of tweet per weekday '''

        map_fun = '''function(doc) {
            var date = new Date(doc.created_at);
            var day = date.getDay();

            emit(day, 1);
        }'''

        reduce_fun = '''function(keys, values) {
            return sum(values)
        }'''

        day_tweet_rs = db.query(map_fun, reduce_fun, group_level=1)

        doc = {'_id':uuid4().hex, 'day_of_week': '', 'day_of_week_count': ''}
        for row in day_tweet_rs.rows:
            doc['day_of_week'] = row.values[0]
            doc['day_of_week_count'] = row.values[1]
            self.save(json.dumps(doc), 'task5_day_tweet')

    
