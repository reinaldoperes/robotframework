*** Settings ***
Resource   			../resource/ResourceOpera.robot
Test Setup			Abrir Navegador
# Test Teardown		Fechar Navegador

#	SETUP roda keyword antes da suite ou antes de um teste
#	TEARDOWN roda keyword depois de um suite ou um teste

*** Test Cases ***
# Caso de Teste 01: Logar no sistema
# 	Acessar a página de login do site
# 	Digitar o usuário ribamar no campo Usuário
# 	Digitar a senha 1qa2ws3ed4rf no campo Senha
#   Clicar no botão entrar
# 	Conferir se foi efetuado corretamente o login

Caso de Teste 02: Parecer Técnico
  Logar no sistema com o usuário ribamar e senha 1qa2ws3ed4rf
  Clicar na primeira bolinha respectiva à área técnica do usuário
  Conferir se o modal do parecer apareceu
  Selecionar parecer APROVADO
  Escrever na descrição "descrição do meu parecer"
  Clicar no botão confirmar do parecer
  Verificar se foi gravado corretamente

*** Keywords ***