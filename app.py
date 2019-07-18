import os
from datetime import datetime
import uuid
import json

INSTANCE_ID = str(uuid.uuid4())[0:8]
counter = 0

def application(env, start_response):
    start_response('200 OK', [('Content-type', 'text/plain; charset=utf-8')])
    if env['PATH_INFO'] == "/":
        global counter
        counter += 1
    payload = {"INSTANCE_ID": INSTANCE_ID, "pid": os.getpid(), "counter": counter,}
    return json.dumps(payload)
