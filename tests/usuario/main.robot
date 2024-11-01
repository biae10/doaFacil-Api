*** Settings ***
Resource  ../../main.robot
Resource  keywords/get_keywords.robot
Resource  keywords/post_keywords.robot

*** Variables ***
${CREATE_USER}  /usuario
${GET_USER}     /usuario/by-cpf/{cpf}

${JSON_PATH_USUARIO}   tests/usuario/json