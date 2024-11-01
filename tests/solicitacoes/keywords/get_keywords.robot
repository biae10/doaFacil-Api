*** Settings ***
Resource  ../main.robot

*** Keywords ***
Consultar solicitações do anúncio de id ${id}
  Criar sessão

  ${headers}  Create Dictionary
  ...  Content-Type=application/json

  ${response}  Get On Session  doaFacil-session
  ...  url=${GET_AD_REQUESTS.format(id="${id}")}
  ...  headers=${headers}  
  ...  expected_status=200

  [Return]  ${response}

Consultar solicitação de id igual a ${id}
   Criar sessão

  ${headers}  Create Dictionary
  ...  Content-Type=application/json

  ${response}  Get On Session  doaFacil-session
  ...  url=${GET_REQUEST.format(id="${id}")}
  ...  headers=${headers}  
  ...  expected_status=200

  [Return]  ${response}