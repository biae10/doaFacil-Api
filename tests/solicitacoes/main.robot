*** Settings ***
Resource  ../../main.robot
Resource  keywords/get_keywords.robot
Resource  keywords/post_keywords.robot
Resource  ../anuncio/main.robot

*** Variables ***
${SEND_REQUEST}       /solicitacao
${GET_AD_REQUESTS}    /solicitacao/ad-requests/{id}
${GET_REQUEST}        /solicitacao/{id}
${APPROVE_REQUEST}    /solicitacao/user/{personId}/approve/{requestId}

${JSON_PATH_REQUESTS}   tests/solicitacoes/json