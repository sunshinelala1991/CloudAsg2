#!/user/bin/python

import sys
import couchdb
from uuid import uuid4

class TaskV(object):

    def __init__(self, conn_str, db):
        try:
            self._conn = couchdb.Server(conn_str)
            self._db = self._conn[db]
        except couchdb.http.ResourceNotFound:
            sys.stderr.write('No specified database in couchdb\n')
        except Exception:
            sys.stderr.write('Connection timeout\n')


    def day_tweet_stat(self, ):
        pass


    def hour_tweet_stat(self, ):
        pass


    def day_user_stat(self, ):
        pass


    def hour_user_stat(self, ):
        pass


    def day_sent_stat(self, ):
        pass


    def hour_sent_stat(self, ):
        pass


    def save(self, doc, dest_db):
        try:
            dest_db = self._conn[dest_db]
            dest_db.save(doc)
        except couchdb.http.ResourceNotFound:
            sys.stderr.write('No specified database in couchdb\n')
        except Exception:
            sys.stderr.write(ex)
        
        

