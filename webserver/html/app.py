#!/usr/bin/python

''' Bottle app skeleton '''
import sys
import bottle

PATH='.'
if len(sys.argv) > 1:
    PATH=sys.argv[1]
app = application = bottle.Bottle()
bottle.TEMPLATE_PATH.insert(0, PATH+'/views')

sys.path.append(PATH)
from task_vitual import Task

@app.route('/static/<filename:path>')
def static(filename):
    ''' serve static files '''
    return bottle.static_file(filename, root=PATH+'/static')


@app.route('/')
def show_index():
    ''' The front "index" page'''
    return bottle.template('front')


@app.route('/page/task1')
def show_page():
    ''' return a page that has been rendered using a template '''
    return bottle.template('task1')

@app.route('/page/task2')
def show_page():
    ''' return a page that has been rendered using a template '''
    return bottle.template('task2')

@app.route('/page/task3')
def show_page():
    ''' return a page that has been rendered using a template '''
    return bottle.template('task3')

@app.route('/page/task4')
def show_page():
    ''' return a page that has been rendered using a template '''
    return bottle.template('taskr4')

@app.route('/page/taskr5')
def show_page():
    ''' return a page that has been rendered using a template '''
    return bottle.template('taskr5')

@app.route('/<page_name>')
def show(page_name):
    return bottle.template(page_name)


class StripPathMiddleware(object):
    ''' get that slash out of the request '''
    
    def __init__(self, a):
        self.a = a
    
    def __call__(self, e, h):
        e['PATH_INFO'] = e['PATH_INFO'].rstrip('/')
        return self.a(e, h)


if __name__ == '__main__':
    bottle.run(app=StripPathMiddleware(app),
                server='wsgiref',
                host='115.146.89.128',
                port=80)

