*** Settings ***
Documentation    Suites de testes referente a aplicacao Todomvc
Resource         Todomvc_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***
Test Case 01 - Cenário 1
    Acessar a aplicação e verificar o titulo da home
    Adicionar três atividades no campo input cadastro e verificar se o cadastro ocorreu com sucesso
    Clicar no Checkbox da Segunda Atividade e Verificar marcação
    Filtrar pelas atividades Concluídas
    Verificar que apenas o segundo cadastro está como Concluida


Test Case 02 - Cenário 2
    Acessar a aplicação e verificar o titulo da home
    Adicionar quatro atividades no campo input cadastro e verificar se o cadastro ocorreu com sucesso
    Clicar no Checkbox da Terceira Atividade e Verificar marcação
    Passar Mouse Sobre Botao Excluir da Terceira Atividade
    Filtrar pelas atividades Concluídas


Test Case 03 - Cenário 3
    Acessar a aplicação e verificar o titulo da home
    Adicionar quatro atividades no campo input cadastro e verificar se o cadastro ocorreu com sucesso
    Clicar no Checkbox da Quarta Atividade e Verificar marcação
    Limpar as atividades Concluídas
