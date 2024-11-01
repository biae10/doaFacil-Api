*** Settings ***
Resource  main.robot

*** Test Cases ***
TC02 - Cadastrar anúncio
  [Tags]  TC02
  ${titulo}   FakerLibrary.Name
  ${descricao}  FakerLibrary.word

  ${ad_response}  Criar novo anúncio  ${titulo}  ${descricao}  663dc647-7808-46ae-8760-a8a701fa9c06  71999999999
  ${response}  Consultar anúncio por ID  ${ad_response.json()["Anuncioid"]}

  Should Be Equal As Strings  ${response.json()["titulo"]}  ${titulo}   
  Should Be Equal As Strings  ${response.json()["descricao"]}  ${descricao} 

TC03 - Cadastrar imagem do anúncio
  [Tags]  TC03
  ${titulo}   FakerLibrary.Name
  ${descricao}  FakerLibrary.word

  ${ad_response}  Criar novo anúncio  ${titulo}  ${descricao}  663dc647-7808-46ae-8760-a8a701fa9c06  71999999999
  Cadastrar imagem para o anuncio de id ${ad_response.json()["Anuncioid"]}
  ${ad_images}  Consultar imagens do anúncio de id ${ad_response.json()["Anuncioid"]}

  Should Not Be Empty  ${ad_images.json()}  

TC06 - Consultar todos os anúncios
  [Tags]  TC06
  ${response}  Consultar todos os anúncios
  Should Not Be Empty  ${response.json()}  