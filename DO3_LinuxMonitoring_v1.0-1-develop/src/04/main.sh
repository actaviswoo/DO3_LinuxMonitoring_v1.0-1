#!/bin/bash

column1_background=$(grep -i "column1_background=" color.config | sed -E 's/column1_background=//')
column1_font_color=$(grep -i "column1_font_color=" color.config | sed -E 's/column1_font_color=//')
column2_background=$(grep -i "column2_background=" color.config | sed -E 's/column2_background=//')
column2_font_color=$(grep -i "column2_font_color=" color.config | sed -E 's/column2_font_color=//')

./check.sh $column1_background $column1_font_color $column2_background $column2_font_color
