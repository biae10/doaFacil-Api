*** Settings ***
Resource  ../main.robot

*** Keywords ***
Consultar usuário por CPF
  [Arguments]  ${cpf}

  Criar sessão

  ${headers}  Create Dictionary
  ...  Content-Type=application/json

  ${response}  GET On Session  doaFacil-session
  ...  url=${GET_USER.format(cpf="${cpf}")}
  ...  headers=&{headers}
  ...  expected_status=200

  [Return]  ${response}