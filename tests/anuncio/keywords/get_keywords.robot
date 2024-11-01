*** Settings ***
Resource  ../main.robot

*** Keywords ***
Consultar anúncio por ID
  [Arguments]  ${id}

  Criar sessão

  ${headers}  Create Dictionary
  ...  Content-Type=application/json

  ${response}  Get On Session  doaFacil-session
  ...  url=${GET_AD_BY_ID.format(id="${id}")}
  ...  headers=${headers}  
  ...  expected_status=200

  [Return]  ${response}

Consultar imagens do anúncio de id ${id}
  Criar sessão

  ${headers}  Create Dictionary
  ...  Content-Type=application/json

  ${response}  Get On Session  doaFacil-session
  ...  url=${GET_AD_IMAGES.format(id="${id}")}
  ...  headers=${headers}  
  ...  expected_status=200

  [Return]  ${response}

Consultar todos os anúncios
  Criar sessão

  ${headers}  Create Dictionary
  ...  Content-Type=application/json

  ${response}  Get On Session  doaFacil-session
  ...  url=${GET_ALL_ADS}
  ...  headers=${headers}  
  ...  expected_status=200

  [Return]  ${response}