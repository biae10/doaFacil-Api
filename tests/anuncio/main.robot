*** Settings ***
Resource  ../../main.robot
Resource  keywords/get_keywords.robot
Resource  keywords/post_keywords.robot

*** Variables ***
${CREATE_ADVERTISING}  /anuncio
${GET_AD_BY_ID}        /anuncio/{id}
${ADD_IMAGE}           /advertising-image
${GET_AD_IMAGES}       /advertising-image/{id}
${GET_ALL_ADS}         /anuncio/all

${JSON_PATH_ADVERTISING}   tests/anuncio/json