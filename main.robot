*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  FakerLibrary  locale=pt_BR
Library  String

Resource  general_keywords.robot

*** Variables ***
${LOCAL_HOST}  http://localhost:8080  