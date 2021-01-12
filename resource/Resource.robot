*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${URL}      http://automationpractice.com
${BROWSER}  chrome  

*** Keywords ***
#   Setup e Teardown
Abrir Navegador
	Open Browser	${URL} 	${BROWSER}
Fechar Navegador
	Close Browser

#	Casos/Cenários
Acessar a página home do site
	Title Should Be		My Store

Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
	Input Text	id=search_query_top	${PRODUTO}

Clicar no botão pesquisar
	Click Element	name=submit_search

Conferir se o produto "${PRODUTO}" foi listado no site
	Wait Until Element Is Visible	css=#center_column > h1
	Title Should Be					Search - My Store
	Page Should Contain Image		xpath=//*[@id="center_column"]//*[@src='http://automationpractice.com/img/p/7/7-home_default.jpg']
	Page Should Contain	Link		xpath=//*[@id="center_column"]/ul/li/div/div[2]/h5/a

Conferir mensagem de erro "${MENSAGEM_ERRO}"
	Wait Until Element Is Visible		xpath=//*[@id="center_column"]/p[@class='alert alert-warning']
	Element Text Should Be				xpath=//*[@id="center_column"]/p[@class='alert alert-warning']		${MENSAGEM_ERRO}