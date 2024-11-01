*** Settings ***
Resource  ../main.robot

*** Keywords ***
Criar nova categoria de nome ${nome} do autor ${personId}
  Criar sessão

  ${headers}  Create Dictionary
  ...  Content-Type=application/json

  ${body}  Load Json From File  ${JSON_PATH_CATEGORIA}/categoria.json
  ${body}  Update Value To Json  ${body}  $..nome    ${nome}
    
  ${response}  Post On Session  doaFacil-session
  ...  url=${CREATE_CATEGORY.format(personId="${personId}")}
  ...  headers=${headers}
  ...  json=${body}
  ...  expected_status=201  

  [Return]  ${response}
