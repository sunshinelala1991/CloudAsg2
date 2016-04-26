#!/usr/bin/python

'''
Base class for task, each task implementer can extends it to fulfill
one's function 
'''

import sys
import bottle

class Task(object):
    
    def __init__(self, js_dir='./static/js', 
                       css_dir='./static/css',
                       img_dir='./static/file',
                       plugin_dir='./plugin'):
        ''' dir is necessary when you want to add your own js 
            or css or image to your header'''
        self.js = js_dir
        self.css = css_dir
        self.img = img_dir
        self.plugin = plugin_dir
        self.header = ''
        self.body = ''


    def get_header(self,):
        ''' app.py call this function 
            Do:
                you should return html string of header of '/page/task?',
                which should include the js or css or image that will be used in your body html
            Do not:
                add argument of this function, i.e get_header(), just leave it empty
                but do not include the html header tag, i.e. '<header></header>'
        '''
        pass


    def get_body(self,):
        ''' app.py call this function
            Do: 
                html string that will present your analysis
            Do not:
                add argument
                contain body tag '<body></body>'
        '''
        pass
