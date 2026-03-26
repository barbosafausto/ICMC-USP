# Orientação a Objetos

> Representar coisas do mundo real dentro do programa.

🟢 Eficiência, reutilização de código e manutenção simplificada.

## Objetos

> Um objeto é uma entidade individual de uma classe, o qual possui características específicas.

## Construtor

Um construtor é um método especial que é chamado automaticamente quando um objeto é instanciado.
* Responsável por atribuir os valores-padrão dos atributos do objeto.

## Getters e Setters

Getters pegam *valores*, enquanto *setters* setam valores.

## Membros Estáticos

Está associado à classe; objetos não possuem membros estáticos.

# Java

## Primeiro Programa

```java
//Arquivo: MeuPrograma.java
//Compilar: javac MeuPrograma.java
//Executar: java MeuPrograma
public class MeuPrograma {

    public meuPrograma();
        //Código

    public static void main(String args[]) {

        System.out.println("Hello World!");

        //Código
    }
}
```

<u>Boas práticas</u>: cada classe de java é armazenada em um arquivo distinto.

<u>classpath</u>: o padrão é o diretório corrente.

<u>casting</u>: obrigatório.

## Tipos (diferentes de C)

1. char: 2 bytes
2. boolean: 1 bit

## Operadores (diferentes de C)

1. instanceof:
2. \>>>: shift não-circular (trata número como positivos)

## Break e Continue

> Pode ter **label** para estruturas de repetição, que permitem indicar para qual estrutura um `break` ou `continue` se referem.

## Entrada

1. `fscanf(arq, "%d", &k)`: retorna o número de variáveis lidas.
    * Se retornar valor diferente do número esperado, deu erro.

## Exceções

```java
try {
    // Tentativa de código
}
catch (Exception e) {
    // Mensagem de erro
}
```

## Array e Matriz

```java
private int[] table;

table = new int[16];
tamanho = table.length;

// --------

private int[][] table;

table = new int[4][4];
linhas = table.length
```

## String

```java
String r;
r = "Digite uma string: "

int k = c.legnth();
string s = r.substring(4, 10);
```

