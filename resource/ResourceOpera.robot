*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${URL}      http://localhost:3000/
${BROWSER}  chrome  

*** Keywords ***
#   Setup e Teardown
Abrir Navegador
	Open Browser	${URL} 	${BROWSER}
Fechar Navegador
	Close Browser

#	Casos/Cenários
Acessar a página de login do site
	Page Should Contain Element   xpath=//*[@id="root"]/div/div/div[1]/div/main/div/h1

Digitar o usuário ${USUARIO} no campo Usuário
	Input Text	id=username	${USUARIO}

Digitar a senha ${SENHA} no campo Senha
	Input Text	id=password	${SENHA}  

Clicar no botão entrar
	Click Element 	xpath=//*[@id="root"]/div/div/div[1]/div/main/div/form/button

Conferir se foi efetuado corretamente o login
  Wait Until Element Is Visible	  xpath=//*[@id="goku"]/div/div[1]/a
	Page Should Contain	Link		    xpath=//*[@id="centroMeusPedidos"]/div/div[1]/p/strong

Estar logado no sistema
  Page Should Contain Element   xpath=//*[@id="barra-superior"]/div[2]/button/span[1]/svg

Logar no sistema com o usuário ${USUARIO} e senha ${SENHA}
  Input Text	                    id=username	${USUARIO}
  Input Text	                    id=password	${SENHA} 
  Click Element 	                xpath=//*[@id="root"]/div/div/div[1]/div/main/div/form/button
  Wait Until Element Is Visible	  xpath=//*[@id="goku"]/div/div[1]/a
  Page Should Contain	Link		    xpath=//*[@id="centroMeusPedidos"]/div/div[1]/p/strong

Clicar na primeira bolinha respectiva à área técnica do usuário
  Wait Until Element Is Visible   xpath=//*[@id="laranja"]/div[3]/div/div/div[2]/div/div/div/div[2]/table/tbody/tr[1]/td[6]/div/a/span
  Click Element 	                xpath=//*[@id="laranja"]/div[3]/div/div/div[2]/div/div/div/div[2]/table/tbody/tr[1]/td[6]/div/a/span

Conferir se o modal do parecer apareceu
  Page Should Contain Element     xpath=//*[@id="filtroPrioridade"]

Selecionar parecer ${PARECER}
  Click Element                   xpath=//*[@id="filtroPrioridade"]
  Wait Until Element Is Visible   xpath=//*[@id="filtroPrioridade-listbox"]
  Click Element                   xpath=//*[@id="filtroPrioridade-listbox"]/li[text() = '${PARECER}']

Escrever na descrição "${DESCRICAO}"
  Input Text	                    id=descricaoParecer	${DESCRICAO}

Clicar no botão confirmar do parecer
  Click Element                   xpath=//*[@id="pr_id_3"]/div[2]/div[2]/div[2]/button[2]

Verificar se foi gravado corretamente
  Wait Until Element Is Visible   xpath=//*[@id="laranja"]/div[3]/div/div/div[2]/div/div/div/div[2]/table/tbody/tr[1]/td[6]/div/a/span[contains(@style,'background-color: rgb(46, 255, 54)')]

Aguardar os pedidos serem carregados
  Wait Until Element Is Visible   xpath=//*[@id="laranja"]/div/div/div/div[2]/div/div/div/div[2]/table/tbody/tr

Clicar no botão de Ações
  Click Element                   xpath=//*[@id="laranja"]/div/div/div/div[2]/div/div/div/div[2]/table/tbody/tr[1]/td[12]/span[2]/button

Aguardar o pop up aparecer
  Wait Until Element Is Visible   xpath=//*[@id="menu-favoritos"]/div[3]/ul

Clicar na opção Rejeitar          
  Click Element                   xpath=//*[@id="menu-favoritos"]/div[3]/ul/li[3]

Aguardar o modal da rejeição aparecer
  Wait Until Element Is Visible   xpath=//*[@id="pr_id_2"]

Escrever no motivo "${DESCRICAO}"
  Input Text	                    xpath=//*[@id="pr_id_2"]/div[2]/div/div[1]/div/textarea	${DESCRICAO}

Clicar no botão confirmar da Rejeição
  Click Element                   xpath=//*[@id="pr_id_2"]/div[2]/div/div[2]/button

Verificar se o status mudou para rejeitado
  Wait Until Element Is Visible   xpath=//*[@id="laranja"]/div/div/div/div[2]/div/div/div/div[2]/table/tbody/tr[1]/td[11]/div/span[text() = 'FINALIZADO']

Clicar no botão de Favoritar na coluna de ações
  Click Element                   xpath=//*[@id="laranja"]/div[11]/div/div/div[2]/div/div/div/div[2]/table/tbody/tr[1]/td[7]/div/button[2]

Aguardar o modal de favoritar aparecer
  Wait Until Element Is Visible   xpath=//*[@id="pr_id_4_header"]

Conferir se botão Favoritar está desabilitado
  Element Should Be Disabled      xpath=//*[@id="pr_id_4"]/div[2]/div/div[3]/button

Escrever na descrição do favorito "${DESCRICAO}"
  Input Text	                    id=descFavoritar	${DESCRICAO}

Selecionar a opção Para mim
  Select Checkbox                 name=checkedA

Conferir se botão Favoritar está habilitado
  Element Should Be Enabled       xpath=//*[@id="pr_id_4"]/div[2]/div/div[3]/button

Clicar no botão Favoritar
  Click Element                   xpath=//*[@id="pr_id_4"]/div[2]/div/div[3]/button

Esperar modal fechar
  Wait Until Page Does Not Contain  xpath=//*[@id="pr_id_4_header"]

Verificar se o favorito "${DESCRICAO}" foi gravado e está na lista de favoritos
  Click Element                   xpath=//*[@id="centroMeusPedidos"]/div/div[2]/button[1]
  Wait Until Element Is Visible   xpath=//*[@id="menu-favoritos"]/div[3]/ul/div/span
  Wait Until Element Is Visible   xpath=//*[@id="menu-favoritos"]/div[3]/ul/div/li[text() = '${DESCRICAO}']