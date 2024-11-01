*** Settings ***
Resource  ../../main.robot
Resource  keywords/post_keywords.robot

*** Variables ***
${CREATE_CATEGORY}  /categoria/author/{personId}  

${JSON_PATH_CATEGORIA}  tests/categoria/json