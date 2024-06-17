#!/usr/bin/env bash

# Requirements:
# * check if in a valid jekyll project
#   is there a gemfile
#   then proceed
# * get the date (year month date)
# * ask user for a title
#   makes it only lower case
#   sanity check so that title is alphanumerical,
#   and only has _ and - for special characters
# * create the file with the basic frontmatter
# * open the file :)

is_jekyll_proj=$(find . -name 'Gemfile' -maxdepth 1)

if [[ -z $is_jekyll_proj ]]; then
    echo "no gemfile -- could not determine if current directory is a jekyll project"
    exit 1
fi

read -p "Blog title (only alphanumberical, spaces, and periods pretty please): " title

if [[ -z $title ]]; then
    echo "title cannot be empty"
    exit 2
fi

# TODO: create a regex pattern that checks if the input is valid
#  and even parse away all problamatic characters
lowercase_title=$(tr "[:upper:]" "[:lower:]" <<< $title)
title_filename=$(tr " " "-" <<< $lowercase_title)

if [[ -z $title_filename ]]; then
    echo "sanitised filename is empty"
    exit 3
fi

mkdir -p _posts

post_filepath="_posts/$(date -I)-$title_filename.md"

cat >> $post_filepath << EOF
---
layout: post
title:  $title
date:   $(date "+%Y-%m-%d %H:%M:%S")
categories: category1 categorty2
---
Blog content goes here!
EOF

echo "$post_filepath created"

nvim $post_filepath
