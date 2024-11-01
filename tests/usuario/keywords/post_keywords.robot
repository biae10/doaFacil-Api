*** Settings ***
Resource  ../main.robot

*** Keywords ***
Criar novo usuário 
  [Arguments]  ${cpf}  ${nome}  ${email}

  Criar sessão

  ${headers}  Create Dictionary
  ...  Content-Type=application/json

  ${body}  Load Json From File  ${JSON_PATH_USUARIO}/user_body.json
  ${body}  Update Value To Json  ${body}  $..cpf    ${cpf}
  ${body}  Update Value To Json  ${body}  $..nome   ${nome}
  ${body}  Update Value To Json  ${body}  $..email  ${email} 

  ${response}  POST On Session  doaFacil-session
  ...  url=${CREATE_USER}
  ...  headers=${headers}  
  ...  json=${body}
  ...  expected_status=201

  [Return]  ${response}