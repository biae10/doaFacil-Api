*** Settings ***
Resource  main.robot

*** Test Cases ***
TC04 - Solicitar anúncio
  [Tags]  TC04
  ${titulo}   FakerLibrary.Name
  ${descricao}  FakerLibrary.word

  ${ad_response}  Criar novo anúncio  ${titulo}  ${descricao}  663dc647-7808-46ae-8760-a8a701fa9c06  71999999999
  
  ${request_response}  Solicitar anúncio de id ${ad_response.json()["Anuncioid"]} para o usuário de person igual a 9fa47749-4de0-4ad8-b95d-e4fbded9088c
  ${final_response}  Consultar solicitação de id igual a ${request_response.json()["SolicitacaoId"]} 
  Should Not Be Empty  ${final_response.json()}

TC05 - Aprovar solicitação de um anúncio
  [Tags]  TC05
  ${titulo}   FakerLibrary.Name
  ${descricao}  FakerLibrary.word

  ${ad_response}  Criar novo anúncio  ${titulo}  ${descricao}  663dc647-7808-46ae-8760-a8a701fa9c06  71999999999
  ${request_response}  Solicitar anúncio de id ${ad_response.json()["Anuncioid"]} para o usuário de person igual a 9fa47749-4de0-4ad8-b95d-e4fbded9088c
  Aprovar solicitação de id ${request_response.json()["SolicitacaoId"]} através do autor de personId 663dc647-7808-46ae-8760-a8a701fa9c06  
  ${final_response}  Consultar solicitação de id igual a ${request_response.json()["SolicitacaoId"]}

  Should Be Equal As Strings  ${final_response.json()["status"]}  APROVADO

TC07 - Consultar solicitações de um anúncio
  [Tags]  TC07
  ${response}  Consultar solicitações do anúncio de id 39
  Should Not Be Empty  ${response.json()}