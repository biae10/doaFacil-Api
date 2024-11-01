*** Settings ***
Resource  main.robot 
Test Tags  usuario 

*** Test Cases ***
TC01 - Criar novo usuário
  [Tags]  TC01

  ${Nome}                 FakerLibrary.Name
  ${Email}                FakerLibrary.Email

  ${CPF}                  FakerLibrary.cpf
  ${CPF}  Remove String  ${CPF}  .  -   

  Criar novo usuário  ${CPF}  ${Nome}  ${Email}
  ${response}  Consultar usuário por CPF  ${CPF}  

  Should Be Equal As Strings  ${response.json()["cpf"]}    ${CPF}  
  Should Be Equal As Strings  ${response.json()["nome"]}   ${Nome}
  Should Be Equal As Strings  ${response.json()["email"]}  ${Email}