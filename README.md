# Damas 3D

## Introdução
Este repositório abriga o código fonte do jogo de [DAMAS](https://pt.wikipedia.org/wiki/Damas) implementado pelo Grupo 1 da disciplina de OAC<sup>[1](#fn1)</sup> como sendo o [trabalho final](https://github.com/jpssousa/damas3d-oac/blob/master/OAC_Projeto.pdf) da disciplina. A proposta é utilizar o Assembly RISC-V como linguagem de programação e o código em si deverá ser compatível com o Simulador [RARS 1.0](https://github.com/TheThirdOne/rars) e o [processador](https://github.com/bernas1104/OAC-Labs/tree/nightly) implementado em Verilog para DE1-SOC.

## Especificações
- Memória
  + 08 KiB de memória de dados, ou seja, 2048 words declaráveis no RARS. Exemplo: DADO1: .word 0xf0caf0fa
  + 16 KiB de memória de programa
  + Supondo que o tabuleiro seja uma matriz M de 8x8 peças, e cada peça ocupe 1 byte, então serão necessários 64 bytes ou 16 words de memória. Isto corresponde a 0.7% da memória disponível.
  + A imagem de fundo _não_ ocupa espaço na memória, somente os sprites das casas do tabuleiro: vazio e com as peças.

## Regras
- Jogada Inválida
  + ` if ( i < 0 || j < 0 || i >= n || j >= n )` => Coordenada (i,j) está fora do tabuleiro
  + ` if M(i,j) != 0` => Coordenada (i,j) da matriz possui uma peça
  

## TODO
- Relatório
  + [ ] Adicionar relatório no overleaf utilizando o template da SBGames
  + [ ] Tópicos
    * [ ] Cabeçalho e Resumo
    * [ ] Introdução
    * [ ] Fundamentação Teórica e Técnica
    * [ ] Metodologia e Resultados Obtidos
    * [ ] Conclusão e Trabalhos Futuros
- Gráfico
  + [ ] Adicionar _assets_ na resolução 320x240 pixels: Tabuleiro e Peças
  + [ ] Escrever como será o processo de adicionar/remover as peças na tela de forma eficiente
- Rotinas
  + [ ] Menu Principal para selecionar a dificuldade
  + [ ] Rotina para realização de movimentos do Jogador 1
  + [ ] Rotina para realização de movimentos para máquina
    * [ ] Explorar níveis de dificuldade 1, 2 e 3

<a name="fn1">[1]</a>: Organização e Arquitetura de Computadores 2018/1