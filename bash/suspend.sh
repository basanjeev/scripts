#!/bin/bash
echo "Sleeping for $1 seconds before suspend."
sleep $1
pm-suspend
