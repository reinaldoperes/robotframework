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
  Escrever na descrição "Falta comprar plaquetas"
  Clicar no botão confirmar do parecer
  Verificar se foi gravado corretamente
  Ver

# Caso de Teste 03: Rejeitar Pedido Como Gestor do C.C 
#   Logar no sistema com o usuário pirlo e senha 1qa2ws3ed4rf
#   Aguardar os pedidos serem carregados
#   Clicar no botão de Ações
#   Aguardar o pop up aparecer
#   Clicar na opção Rejeitar
#   Aguardar o modal da rejeição aparecer
#   Escrever no motivo "Pedido rejeitado porque o paciente sarou"
#   Clicar no botão confirmar da Rejeição
#   Verificar se o status mudou para rejeitado

# Caso de Teste 04: Favoritar pedido
#   Logar no sistema com o usuário admin e senha 123456
#   Aguardar os pedidos serem carregados
#   Clicar no botão de Favoritar na coluna de ações
#   Aguardar o modal de favoritar aparecer
#   Conferir se botão Favoritar está desabilitado
#   Escrever na descrição do favorito "Favorito do Robot"
#   Selecionar a opção Para mim
#   Conferir se botão Favoritar está habilitado
#   Clicar no botão Favoritar
#   Esperar modal fechar
#   Verificar se o favorito "Favorito do Robot" foi gravado e está na lista de favoritos

*** Keywords ***