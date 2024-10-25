#!/bin/bash

line=$(dmenu -p "Search:" < /dev/null)
librewolf "https://duckduckgo.com/$line"
