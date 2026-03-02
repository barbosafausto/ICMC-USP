# Disciplina

> Prof. Cristina Aguiar

> Esta é uma disciplina de algoritmos e estruturas de dados para discos. Assim veremos **disco** (HDD): tudo sobre armazenar e recuperar dados eficientemente.

> <span style="color: RED; font-weight: bold;"> Os trabalhos dela são enormes. </span>

* Modularização é importante nesta disciplina. Se tiver dificuldades, procurar os monitores.

## Características do Disco  

* <u>Complexidade</u>: número de acessos a disco (**<span style="color:GREEN;"> ***Seek***</span>** )
    * Mais lento que a RAM devido ao acesso não-aleatório e magnético.

* Um dispositivo de armazenamento morre após um certo número de _writes_.
    * HDDs tolera mais _writes_ que SSDs.


### Organização

#### Físico

* **Disco**: conjunto de pratos empilhados

* **Superfícies**: são organizadas em trilhas
    * Onde passa a cabeça de leitora

* <span style="color:ORANGE;"> **Trilhas**</span>: são organizadas em <span style="color:ORANGE;"> **Setores**</span> (menor porção endereçável do disco)

* **Cilindro**: conjunto de trilhas na mesma posição

#### Lógico

* <span style="color:ORANGE;"> **Página de Disco**</span>: conjunto de setores **logicamente** contíguos (4KB)
    * O sistema vê um arquivo como um conjunto de páginas de disco
    * <span style="color:GREEN;" > **Unidade de transferência de dados entre a RAM e o disco** </span>

### Custos

* Tempo de acesso (_Seek_)
    * Posicionar cabeça de leitora e gravação no cilindro correto
    * <span style="color:ORANGE;"> Movimento mais lento; mais custoso. </span>
    * <span style="color:ORANGE;"> **O seek cresce em função do número de páginas de disco lidas** </span>

* Delay de rotação (_Rotational Delay_)

* Tempo de transferência (_Transfer Time_)
    * Transferência para a memória primária

## Sistema de Arquivos

> Faz parte do sistema operacional e fornece o recursos para a manipulação de arquivos em memória secundária.

* Formatação Física (Disco Físico)
    * Organização de fábrica do disco em setores/trilhas/cilindros
    * Pode ser mudada por meio de partições

* Formatação Lógica (Disco Lógico)
    * "Instala" o sistema de arquivos no disco
    * Subdivide o disco em regiões endereçáveis

## Revisão da Aula

```
se a página de disco está em RAM
    então usa a página sem acessos a disco
senão
    então acessa o disco para transferir 1 página p/ RAM
        se existe espaço na RAM
            então escreve a página na RAM
        senão, falha de páginas
            aplico políticas de subst. de páginas (LRU)
            se a página foi alterada
            escreve no disco 
            escreve a nova página na RAM
```

## Posição Corrente no Arquivo 

> Abstração que permite ao sistema indicar onde um arquivo deve ser lido ou escrito


## Arquivo

### Conteúdo

* Um registro de cabeçalho
* Registros de dados

### Descritor do Arquivo

* Estrutura usada pelo sistema de arquivos para gerenciar arquivos


## Organização em Campos/Registros

Registro (Disco) $\implies$ *Struct* (RAM)

### Byte Offset

O *byte offset* zero é a posição inicial absoluta de um arquivo.

### Métodos

Tamanho fixo
 * Mais rápido, porém despediça mais memória

Tamanho variável
 * Struct começa cada campo com um **indicador** de tamanho ou (exclusivo) possui **delimitador** após cada campo.

 #### Tamanho Fixo

 Permite pular registros/campos rapidamente, via multiplicação do tamanho do registro/campo pelo $RRN$.

 <span style="color:RED">**Falta falar sobre RRN.**</span>









