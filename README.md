# PrimeiroDesafioLinxAutomacaoBasico

# Projeto de Automação de Testes - TodoMVC com Robot Framework

Este repositório contém scripts de automação de testes para o aplicativo TodoMVC (versão React), utilizando o Robot Framework com a biblioteca SeleniumLibrary. Os testes verificam funcionalidades como adicionar atividades, marcar como concluídas, excluir tarefas e filtrar itens.

## Pré-requisitos
- Python 3.8 ou superior
- Robot Framework
- SeleniumLibrary
- Chrome WebDriver (compatível com a versão do Chrome instalada)
- Chrome instalado na máquina

## Instruções de Instalação
1. Instale o Python[](https://www.python.org/downloads/) e adicione ao PATH.
   - Verifique com: `python --version`
2. Instale as dependências:
   pip install robotframework
   pip install robotframework-seleniumlibrary

   - Para rodar um caso de teste específico:
     robot -t "Test Case 01 - Cenário 1" Todomvc_teste.robot


     - Relatórios e logs serão gerados (ex.: `log.html`, `report.html`).

## Estrutura do Projeto
- `Todomvc_resources.robot`: Keywords e variáveis reutilizáveis.
- `Todomvc_teste.robot`: Casos de teste.
- Sugestão: Crie uma pasta `results` para salvar os arquivos gerados.

## Considerações
- Certifique-se de que o Chrome está instalado.
- Screenshots são gerados (ex.: `lista.png`) na pasta do projeto.
- O script usa `Sleep` em alguns pontos; otimizar com waits dinâmicos pode melhorar a execução.

## Contribuições
Sinta-se à vontade para abrir issues ou pull requests!
