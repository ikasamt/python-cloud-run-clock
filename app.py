import os
from datetime import datetime

def application(env, start_response):
    start_response('200 OK', [('Content-type', 'text/plain; charset=utf-8')])
    now = datetime.now()
    return [now.strftime("%Y-%m-%d-%H:%M:%S")]
