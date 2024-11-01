*** Settings ***
Resource  ../main.robot

*** Keywords ***
Solicitar anúncio de id ${id} para o usuário de person igual a ${personId}
  Criar sessão

  ${headers}  Create Dictionary
  ...  Content-Type=application/json

  ${body}  Load Json From File   ${JSON_PATH_REQUESTS}/request.json
  ${body}  Update Value To Json  ${body}  $..personId    ${personId}
  ${body}  Update Value To Json  ${body}  $..anuncio_id  ${id}

  ${response}  POST On Session  doaFacil-session
  ...  url=${SEND_REQUEST}
  ...  headers=${headers}  
  ...  json=${body}
  ...  expected_status=200 

  [Return]  ${response}

Aprovar solicitação de id ${id} através do autor de personId ${personId}
  Criar sessão

  ${headers}  Create Dictionary
  ...  Content-Type=application/json

  ${response}  POST On Session  doaFacil-session
  ...  url=${APPROVE_REQUEST.format(personId="${personId}",requestId="${id}")}
  ...  headers=${headers}
  ...  expected_status=200 

  [Return]  ${response}




  



