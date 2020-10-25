#!/usr/bin/python

import os, sys
print 'Number of arguments:', len(sys.argv), 'arguments.'
print 'Argument List:', str(sys.argv)

if len(sys.argv) < 1:
    exit(-1)

reqpath = "/tmp/crescom_gpu_req_" + sys.argv[1]
respath = "/tmp/crescom_gpu_res_" + sys.argv[1]

filename = "/var/crescom/patient/detail_image.jpg\n"
reqpipe = open(reqpath, 'w')
reqpipe.write(filename)
reqpipe.flush()
print "Request filename  " + filename

respipe = open(respath, 'r')
filename = respipe.readline()
print "Reply filename  " + filename

print "Finished Client process"