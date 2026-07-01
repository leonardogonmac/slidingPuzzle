# Sliding Puzzle

Esse repositório contém o algoritmo de A* paralelo que encontra a solução para o Sliding Puzzle. Esse algoritmo faz parte do Trabalho de Conclusão de Curso de Leonardo Gonçalves Machado, da graduação em Engenharia de Software pela Universidade de Brasília. O algoritmo está inteiramente no arquivo [slidingPuzzle.cpp](https://github.com/leonardogonmac/slidingPuzzle/blob/main/slidingPuzzle.cpp). 

Para executar o algoritmo, é necessário ter o g++ instalado, juntaamente com a biblioteca Boost e a ferramenta make. Para gerar um executável, basta executar:

```
  make main
```

Dessa forma será gerado um executável bin/bin.

Para gerar dez casos de teste aleatórios, basta executar 

```
  make samples DIST=<d>
```

Em que \<d\> é a escala dos puzzles. Os casos de teste serão salvos em arquivos em samples/\<d\>/.

Para executar um caso de teste, basta executar

```
  ./bin/bin <thread_num> < samples/<d>/<num>
```

Em que \<thread_num\> é o número de threads desejado para solucionar o quebra-cabeça, \<d\> é a escala, e \<num\> é o número do caso de teste.

Para executar todos os casos de teste de uma escala \<d\> e gerar um relatório de execução, execute:

```
  make tests THREAD_NUM=<thread_num> DIST=<d>
```

Por fim, para executar todos os casos de teste, basta executar:

```
  make all_tests THREAD_NUM=<thread_num>
```

Os relatórios de teste estarão localizados em test_reports/t<thread_num>/
