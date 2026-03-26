# Introdução 

## Organização *x* Arquitetura

> Arquitetura de um computador é o que o programador ver, enquanto a organização é como essa arquitetura é organizada.

### Exemplo

É possível visualizar uma arquitetura de 32 bits, a qual é organizada por meio de barramentos, registradores, memória RAM, entre outros.

## Arquitetura de Von Neumann

> A arquitetura de Von Neumann consiste em 3 peças principais:

1. CPU
    * Unidade de Controle
    *  Unidade Lógica e Aritmética
2. Memória Principal
3. Entrada e Saída

Nesse contexto, existe uma <u>conversa</u> constante entre a CPU e a Memória.

### CPU $\longleftrightarrow$ RAM

#### Registradores

* PC - Program Counter

* MAR - Memory Adress Register

* MBR - Memory Buffer Register

* IR - Instruction Register

* AC - Accumulator

* UC - Unidade de Controle

#### Ciclo de Busca

1. O PC contém o endereço da próxima instrução a ser executada.
2. O PC envia o endereço para o MAR.
3. O MAR envia o endereço à RAM via barramento de endereço, 
    * Ocorre após a UC emitir um sinal de leitura
4. O conteúdo do endereço é enviado para o MBR via barramento de dados.
5. O MBR envia o conteúdo para o IR.
6. O PC é incrementado
7. O IR envia o dado para a UC processar.


#### Ciclo de (Decodificação e) Execução

1. A UC irá decidir o que fazer.
    * Exemplos de ações: guardar valor em AC, acumular AC, guardar valor de AC na memória.

2. Se alguma ação é necessária, faz-se novas buscas: o IR envia o endereço para o MAR.

3. Caso seja necessário guardar um valor de AC na memória, o endereço vai para MAR, enquanto o valor vai para o MBR, ambos antes de chegar à memória.
    * Ocorre após emissão de sinal de escrita da UC.




