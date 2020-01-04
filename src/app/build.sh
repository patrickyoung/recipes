#!/bin/sh

DIST_DIR="/var/www/html"

# Build recipe pages
for recipe in ./data/recipes/*
do
    gomplate -d "recipe=./$recipe" \
             -f ./templates/recipe.template \
             -o "$DIST_DIR/recipes/$(basename $recipe .yaml).html"
done

# Build the index page
gomplate -d 'recipes=./data/recipes/' \
         -d 'recipe=./data/recipes/' \
         -f ./templates/recipe_list.template \
         -o "$DIST_DIR/index.html"
