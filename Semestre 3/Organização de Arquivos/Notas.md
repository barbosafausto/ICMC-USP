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

* **Disco**: conjunto de pratos empilhados

* **Superfícies**: são organizadas em trilhas
    * Onde passa a cabeça de leitora

* <span style="color:ORANGE;"> **Trilhas**</span>: são organizadas em <span style="color:ORANGE;"> **Setores**</span> (menor porção endereçável do disco)

* **Cilindro**: conjunto de trilhas na mesma posição

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


## Posição Corrente no Arquivo (prox. aula)

> Abstração que permite ao sistema indicar onde um arquivo deve ser lido ou escrito


## Arquivo

### Conteúdo

* Um registro de cabeçalho
* Registros de dados

### Descritor do Arquivo

* Estrutura usada pelo sistema de arquivos para gerenciar arquivos




