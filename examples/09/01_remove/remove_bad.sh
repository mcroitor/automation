#!/bin/bash
# ALERT: direct usage of user input without validation can be dangerous.

rm -rf /tmp/$1/*
echo "Deleted files in $1"