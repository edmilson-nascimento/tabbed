[![N|Solid](https://wiki.scn.sap.com/wiki/download/attachments/1710/ABAP%20Development.png?version=1&modificationDate=1446673897000&api=v2)](https://www.sap.com/brazil/developer.html)

# Tab Selection Screen - tabbed
Criação e alteração de abas para tela de seleção

Afim de atender a necessidade de uma tela de seleção `abap selection-screen` que suporte abas, foi feito esse desenvolvimenento.

# Implementação #
O layout basico consiste em criar duas (ou mais) subtelas, que são as abas, e essas serão incluidas dentro de uma tela principal onde será informado que que sera recebido duas ou mais subtelas. As abas são botões e de acordo com o `sy-ucomm` são alteradas as subtelas de filtro.

[![N|Solid](https://uploaddeimagens.com.br/images/002/523/886/original/Screen_Shot_2019-12-02_at_5.33.06_pm.png)](https://www.sap.com/brazil/developer.html)

## Criação de abas ##
As abas são criadas separadamente, como sub-telas. Neste exemplo são duas mas poderiam ser mais de acordo com a solução proposta.

```abap

selection-screen begin of screen 100 as subscreen .
parameters:
  p100 type char10 .
selection-screen end of screen 100 .

selection-screen begin of screen 200 as subscreen .
parameters:
  p200 type char10 .
selection-screen end of screen 200 .

```

## Criação da seleção ##
A tela de seleção

```abap

selection-screen: begin of tabbed block tabs for 10 lines,
  tab (20) button1 user-command push1,
  tab (20) button2 user-command push2,
end of block tabs .

```


## Alternar entre abas ## 

## Eventos ##

## Tratar retorno ## 

Ao informar dois tipos de relatórios, quando clica em _voltar_ no segundo relatorio, a tela de seleção deveria estar na segunda aba tambem.
