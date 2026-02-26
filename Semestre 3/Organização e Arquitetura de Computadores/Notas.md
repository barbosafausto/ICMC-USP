# Disciplina

Profa. Sarita Mazzini Bruschi - sarita@icmc.usp.br

😃 Vamos estudar a arquitetura RISC-V de processadores! (e assembly)

## Introdução

### Sistema Computacional

> Conjunto de Hardware e Software usado como ferramenta na solução de problemas.


### Arquitetura

> Conjunto de atributos visíveis ao programador.
* Conjunto de instruções, número de bits usados para representação, etc.

### Organização

> Como os atributos supracitados são implementados.
* Sinais de controle, interfaces, tecnologia de memória, etc.



## Revisão de Lógica e Sistemas Digitais

### Decodificador
 
> Bloco lógico que contém uma entrada de $n$ bits e $2^n$ saídas, onde <u>somente uma</u> saída é ativada para cada combinação de entradas.
$$
\boxed{n \implies 2^n}
$$

#### Exemplo de Uso

Um barramento entre CPU e RAM transmite endereço, dado e controle.

Se uma memória tem 32 GB, são necessários $2^3 \cdot 2^{30}$ bits para endereçar cada bloco de 8 GB dessa memória. Os 2 bits restantes entram em um <u>decodificador</u> para endereçar o bloco.

### Multiplexador

> Seleciona o único bit que irá passar em um determinado ponto do circuito. São necessários $n$ seletores para cada $2^n$ entradas.

#### Exemplo de Uso

* **UC**: Control Unit

* **PC**: Program Counter

* **MAR**: Memory Address Register (Endereço)

* **MBR**: Memory Buffer Register (Dados)

* **IR**: Instruction Register

Busca da instrução:
$$
PC \implies MAR \implies MUX \implies RAM
$$

Decodifição e execução da instrução:
$$
RAM \implies MBR \implies IR \implies MUX \implies MAR
$$

O $MUX$ seleciona qual bit entra no $MAR$ entre o $PC$ e o $IR$.

### ULA

> A ULA, além das suas operações usuais, possui <u>flags</u>. As flags indicam alguma característica do resultado da operação.

#### Flags
* Zero (Z)
* Negativo (N)
* Overflow (V)
* Carry Out (C)

É possível detectar overflow fazendo um $XOR$ entre os dois últimos carry outs de um Ripple Carry: se forem iguais, não há overflow, mas se forem diferentes, então há. <span style="color:RED"> **(preciso confirmar isso)**</span>

### Flip Flops

Menção dos FFs tipo D e JK.

$$
FFs \implies \text{Registers, Cache, Counters}
$$


## Arquitetura RISC

> Exige uso de **load** e **store** para lidar com dados. As instruções possuem tamanho fixo de 32 bits.




