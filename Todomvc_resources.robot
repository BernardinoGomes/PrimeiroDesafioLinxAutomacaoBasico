*** Settings ***
Documentation        Declaração das Librarys que serão implementadas no arquivo Resource
...                  1 - Library - https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html
...                  2 - Collections - https://robotframework.org/robotframework/latest/libraries/Collections.html
Library              SeleniumLibrary
Library              Collections


*** Variables ***
${URL}                                https://todomvc.com/examples/react/dist/   # URL do site a ser validado                                  
                                      # Possíveis palavras que foram mapeadas no título da home
${Title_Home}                         TodoMVC: React  
                                      # Campo de input para realizar o cadastros das atividades                                                                      
${INPUT_CADASTRO}                     //input[@id='todo-input']  
${PRIMEIRO_CADASTRO}                  Primeira atividade
${SEGUNDO_CADASTRO}                   Segunda atividade                    
${TERCEIRO_CADASTRO}                  Terceira atividade
${QUARTO_CADASTRO}                    Quarta atividade

${CHECKBOX_SEGUNDO_REGISTRO}          xpath=(//input[contains(@data-testid,'todo-item-toggle')])[2]
${BTT_CLEAR_COMPLETED}                //button[@class='clear-completed'][contains(.,'Clear completed')]

*** Keywords ***
Abrir o navegador
    [Documentation]    Abre o navegador Chrome e maximiza a janela.
    Open Browser                      browser=chrome  options=add_experimental_option("detach", True)
    Maximize Browser Window

Fechar o navegador
    [Documentation]    Captura uma captura de tela antes de fechar o navegador
    Capture Page Screenshot
    Close Browser
  
Acessar a aplicação e verificar o titulo da home
    [Documentation]    Acessa o site da  e valida o título da página inicial de acordo com as palavras descritas nas variáveis
   
    Go To                            url=${URL}
    ${Titulo}                        Get Title
    Should Contain                   ${Titulo}     ${Title_Home}
    Wait Until Element Is Visible    locator=${INPUT_CADASTRO}

Adicionar três atividades no campo input cadastro e verificar se o cadastro ocorreu com sucesso
    [Documentation]    Adiciona três atividades no campo de input.
    Input Text                       ${INPUT_CADASTRO}    ${PRIMEIRO_CADASTRO}
    Press Keys                       ${INPUT_CADASTRO}    ENTER
    Wait Until Page Contains         ${PRIMEIRO_CADASTRO}    timeout=15s
    Log To Console                   Adicionada: ${PRIMEIRO_CADASTRO}
    Input Text                       ${INPUT_CADASTRO}    ${SEGUNDO_CADASTRO}
    Press Keys                       ${INPUT_CADASTRO}    ENTER
    Wait Until Page Contains         ${SEGUNDO_CADASTRO}    timeout=15s
    Log To Console                   Adicionada: ${SEGUNDO_CADASTRO}
    Input Text                       ${INPUT_CADASTRO}    ${TERCEIRO_CADASTRO}
    Press Keys                       ${INPUT_CADASTRO}    ENTER
    Wait Until Page Contains         ${TERCEIRO_CADASTRO}    timeout=15s
    Log To Console                   Adicionada: ${TERCEIRO_CADASTRO}


Adicionar quatro atividades no campo input cadastro e verificar se o cadastro ocorreu com sucesso
    [Documentation]    Adiciona três atividades no campo de input.
    Input Text                       ${INPUT_CADASTRO}    ${PRIMEIRO_CADASTRO}
    Press Keys                       ${INPUT_CADASTRO}    ENTER
    Wait Until Page Contains         ${PRIMEIRO_CADASTRO}    timeout=15s
    Log To Console                   Adicionada: ${PRIMEIRO_CADASTRO}
    Input Text                       ${INPUT_CADASTRO}    ${SEGUNDO_CADASTRO}
    Press Keys                       ${INPUT_CADASTRO}    ENTER
    Wait Until Page Contains         ${SEGUNDO_CADASTRO}    timeout=15s
    Log To Console                   Adicionada: ${SEGUNDO_CADASTRO}
    Input Text                       ${INPUT_CADASTRO}    ${TERCEIRO_CADASTRO}
    Press Keys                       ${INPUT_CADASTRO}    ENTER
    Wait Until Page Contains         ${TERCEIRO_CADASTRO}    timeout=15s
    Log To Console                   Adicionada: ${TERCEIRO_CADASTRO}
    Input Text                       ${INPUT_CADASTRO}    ${QUARTO_CADASTRO}
    Press Keys                       ${INPUT_CADASTRO}    ENTER
    Wait Until Page Contains         ${QUARTO_CADASTRO}    timeout=15s
    Log To Console                   Adicionada: ${QUARTO_CADASTRO}
Clicar no Checkbox da Segunda Atividade e Verificar marcação
    [Documentation]    Clica no checkbox associado à atividade ${SEGUNDO_CADASTRO}.
    Wait Until Page Contains         ${SEGUNDO_CADASTRO}    timeout=15s
    Capture Page Screenshot          Clicar no Checkbox da Segunda Atividade e Verificar marcação.png
    Click Element                    xpath=(//input[contains(@data-testid,'todo-item-toggle')])[2]
    Sleep                            10s
    # Verifica se o checkbox foi marcado
    Element Attribute Value Should Be    xpath=(//input[contains(@data-testid,'todo-item-toggle')])[2]    checked    true


Clicar no Checkbox da Terceira Atividade e Verificar marcação
    [Documentation]    Clica no checkbox associado à atividade ${TERCEIRO_CADASTRO}
    Wait Until Page Contains         ${TERCEIRO_CADASTRO}    timeout=15s
    Capture Page Screenshot          Clicar no Checkbox da Terceira Atividade e Verificar marcação.png
    Click Element                    xpath=(//input[contains(@data-testid,'todo-item-toggle')])[3]
    Sleep                            10s
    # Verifica se o checkbox foi marcado
    Element Attribute Value Should Be    xpath=(//input[contains(@data-testid,'todo-item-toggle')])[3]    checked    true

Clicar no Checkbox da Quarta Atividade e Verificar marcação
    [Documentation]    Clica no checkbox associado à atividade ${QUARTO_CADASTRO}
    Wait Until Page Contains         ${QUARTO_CADASTRO}    timeout=15s
    Capture Page Screenshot          Clicar no Checkbox da Quarta Atividade e Verificar marcação.png
    Click Element                    xpath=(//input[contains(@data-testid,'todo-item-toggle')])[4]
    Sleep                            10s
    # Verifica se o checkbox foi marcado
    Element Attribute Value Should Be    xpath=(//input[contains(@data-testid,'todo-item-toggle')])[4]    checked    true

Passar Mouse Sobre Botao Excluir da Terceira Atividade
    [Documentation]    Passa o mouse sobre o botão 'Excluir' da tarefa ${TERCEIRO_CADASTRO}.
    Wait Until Element Is Visible    xpath=//li[.//label[contains(normalize-space(.),'${TERCEIRO_CADASTRO}')]]    timeout=15s
    Mouse Over                       xpath=//li[.//label[contains(normalize-space(.),'${TERCEIRO_CADASTRO}')]]
    Wait Until Element Is Visible    xpath=//li[.//label[contains(normalize-space(.),'${TERCEIRO_CADASTRO}')]]//button[@class='destroy']    timeout=15s
    Click Element                    xpath=//li[.//label[contains(normalize-space(.),'${TERCEIRO_CADASTRO}')]]//button[@class='destroy']
    Capture Page Screenshot          Passar Mouse Sobre Botao Excluir da Terceira Atividade.png

Remover a Terceira Atividade e verificar a remoção 
    Mouse Over                       xpath=(//button[@data-testid='todo-item-button'])[3]
    Wait Until Element Is Visible    xpath=(//button[@data-testid='todo-item-button'])[3]    timeout=15s
    Click Element                    xpath=(//button[contains(@data-testid,'todo-item-button')])[3]
    Sleep    20s
Filtrar pelas atividades Concluídas
    Wait Until Element Is Visible    xpath=//a[@href='#/completed']    timeout=15s
    Click Element                    xpath=//a[@href='#/completed']
    Capture Page Screenshot          apos_clique_completed.png 
    Sleep                            10s

Verificar que apenas o segundo cadastro está como Concluida
    [Documentation]    Verifica que apenas a tarefa ${SEGUNDO_CADASTRO} aparece na lista de tarefas concluídas.
    Wait Until Page Contains         ${SEGUNDO_CADASTRO}    timeout=15s
    Page Should Contain Element       xpath=//li[.//label[contains(normalize-space(.),'${SEGUNDO_CADASTRO}')]]
    Page Should Not Contain Element   xpath=//li[.//label[contains(normalize-space(.),'${PRIMEIRO_CADASTRO}')]]
    Page Should Not Contain Element   xpath=//li[.//label[contains(normalize-space(.),'${TERCEIRO_CADASTRO}')]]
    
    # Opcional: Verificar que apenas um item está na lista
    ${count}=    Get Element Count    xpath=//ul[@class='todo-list']/li
    Should Be Equal As Integers       ${count}    1
    Capture Page Screenshot           lista.png

Limpar as atividades Concluídas
    [Documentation]    Verificar os elementos e limpar as atividades
    Wait Until Element Is Visible    xpath=${BTT_CLEAR_COMPLETED}     timeout=15s
    Click Element                    xpath=${BTT_CLEAR_COMPLETED} 
    Capture Page Screenshot          apos_clique_completed.png 

*** Keywords ***
Verificar que as 3 atividades inseridas estão em tela
    [Documentation]    Verifica se exatamente as três atividades estão na lista e a quarta não está.
    Wait Until Element Is Visible     xpath=//ul[@class='todo-list']    timeout=5s
    ${count}=    Get Element Count    xpath=//ul[@class='todo-list']/li
    Should Be Equal As Integers       ${count}    3
    @{tarefas_presentes}=    Create List    ${PRIMEIRO_CADASTRO}    ${SEGUNDO_CADASTRO}    ${TERCEIRO_CADASTRO}
    FOR    ${tarefa}    IN    @{tarefas_presentes}
        Wait Until Element Is Visible    xpath=//li[.//label[contains(normalize-space(.),'${tarefa}')]]    timeout=5s
    END
    Page Should Not Contain Element    xpath=//li[.//label[contains(normalize-space(.),'${QUARTO_CADASTRO}')]]
    Capture Page Screenshot    verificacao_atividades.png