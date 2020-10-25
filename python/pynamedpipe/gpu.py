#!/usr/bin/python

import os, sys
print 'Number of arguments:', len(sys.argv), 'arguments.'
print 'Argument List:', str(sys.argv)

if len(sys.argv) < 1:
    exit(-1)

reqpath = "/tmp/crescom_gpu_req_" + sys.argv[1]

if os.path.exists(reqpath):
    os.unlink(reqpath)
try:
    os.mkfifo(reqpath)
except OSError, e:
    print "Failed to create FIFO: %s" % e
else:
    print reqpath + " created"

respath = "/tmp/crescom_gpu_res_" + sys.argv[1]
if os.path.exists(respath):
    os.unlink(respath)

try:
    os.mkfifo(respath)
except OSError, e:
    print "Failed to create FIFO: %s" % e
else:
    print respath + " created"

print "Making request socket"
reqpipe = open(reqpath, 'r')
while True:
    print "Waiting for command..."
    filename = reqpipe.readline()
    print "Procesing filename  " + filename
    #echo for now
    print "Sending response"
    respipe = open(respath, 'w')
    respipe.write(filename)
    respipe.flush()
    print "Complete processing"

respipe.close()
reqpipe.close()
print "Finished GPU process"