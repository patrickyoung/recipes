#!/bin/sh

DIST_DIR="/var/www/html"
INDEX_FILE="./data/index.yaml"

function add_to_index() {
    echo "  - name: ${1}" >> $INDEX_FILE
    echo "    loc: ${2}" >> $INDEX_FILE
}

function create_recipe_page() {
    gomplate -d "recipe=${1}" \
             -f ./templates/recipe.template \
             -o "$DIST_DIR/recipes/$(basename ${1} .yaml).html"

    add_to_index "$(basename ${1} .yaml)" "$(basename ${1} .yaml).html"
}

function build_index_page() {
    gomplate -d 'recipes=./data/index.yaml' \
         -f ./templates/recipe_list.template \
         -o "$DIST_DIR/index.html"
}

# Build recipe pages
for recipe in ./data/recipes/*
do
    create_recipe_page "$recipe"
done

# Build index page
build_index_page