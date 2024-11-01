*** Settings ***
Resource  main.robot

*** Keywords ***
Criar sessão
  Create Session  doaFacil-session
  ...  ${LOCAL_HOST} 