#!/usr/bin/python3

import re
import sys
import csv

err_dict = {}
per_user = {}
error_keys = []

with open('syslog.log', 'r') as f:
    for line in f.readlines():
        realline = line.strip()
        err_str = re.search(r'INFO|ERROR', realline)
        usr_str = re.search(r'(\(\w+\))$', realline)
        if err_str is not None and usr_str is not None:
            #print(err_str.group(0), usr_str.group(0))
            usr = re.sub('[()]', '', usr_str.group(0))
            err = err_str.group(0)
            values = per_user.get(usr)
            if values is None:
                values = [0, 0]
                per_user[usr] = values
            if err == "INFO":
                values[0] = values[0] + 1
            else:
                values[1] = values[1] + 1
            err_dict[err] = err_dict.get(err, 0) + 1
    f.close()
    per_user_sorted = sorted(per_user.items(), key=lambda x: x[0], reverse=False)
    err_sort = sorted(err_dict.items(), key=lambda x: x[1], reverse=True)
    #print(per_user_sorted)

    with open('error_message.csv', 'w') as f:
        f.write("%s,%s\n"%("Error", "Count"))
        for value in err_sort:
            f.write("%s,%s\n"%(value[0],value[1]))
    f.close()

    with open('user_statistics.csv', 'w') as f:
        f.write("%s,%s,%s\n"%("Username", "INFO", "ERROR"))
        for value in per_user_sorted:
            f.write("%s,%s,%s\n"%(value[0],value[1][0], value[1][0]))
    f.close()
