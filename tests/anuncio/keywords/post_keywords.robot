*** Settings ***
Resource  ../main.robot

*** Keywords ***
Criar novo anúncio
  [Arguments]  ${titulo}  ${descricao}  ${personId}  ${telefone}

  Criar sessão

  ${headers}  Create Dictionary
  ...  Content-Type=application/json

  ${body}  Load Json From File  ${JSON_PATH_ADVERTISING}/advertising.json
  ${body}  Update Value To Json  ${body}  $..titulo      ${titulo}
  ${body}  Update Value To Json  ${body}  $..descricao   ${descricao}
  ${body}  Update Value To Json  ${body}  $..personId    ${personId}
  ${body}  Update Value To Json  ${body}  $..telefone    ${telefone}

  ${response}  POST On Session  doaFacil-session
  ...  url=${CREATE_ADVERTISING}
  ...  headers=${headers}  
  ...  json=${body}
  ...  expected_status=201

  [Return]  ${response}

Cadastrar imagem para o anuncio de id ${id}
    Criar sessão

  ${headers}  Create Dictionary
  ...  Content-Type=application/json

  ${body}  Load Json From File   ${JSON_PATH_ADVERTISING}/image.json
  ${body}  Update Value To Json  ${body}  $..anuncio_id  ${id}   

  POST On Session  doaFacil-session
  ...  url=${ADD_IMAGE}
  ...  headers=${headers}  
  ...  json=${body}
  ...  expected_status=201


