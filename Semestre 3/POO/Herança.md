# Herança

Classes (subclasses) podem herdar características de outras classes (superclasses).

Útil para reutilizar código.

Toda classe herda da superclasse `Object()`.

## Sintaxe Java

```java
//Abstract para impedir instanciação
public abstract class Animal { 

    public Animal(String nome) {
        this.nome = nome;
    }

    public void fazerSom() {
        System.out.println("Indefinido.");
    }
}

// ------

public class Gato extends Animal {

    private String sobrenome;

    public Gato(String nome, String sobrenome) {
        super(nome); // Usa o construtor da superclasse
        this.sobrenome = sobrenome;
    }

    @Override // decorador (opcional)
    public void fazerSom() {
        System.out.println("O gato mia.");
    }

    @Override
    public String getNome() {
        return super.getNome() + " " + sobrenome;
    }
}
```

## Sintaxe Python

```Python
from abc import ABC, abstractmethod

class Animal(ABC):
        def __init__(self, nome):
            self.nome = nome
        
        @abstractmethod
        def fazer_som(self):
            pass

        def get_nome(self):
            return self.nome

class Gato(Animal):

    # Desnecessário se não houvesse sobrenome
    def __init__(self, nome, sobre):
        super().__init__(nome)
        self.sobrenome = sobre

    def fazer_som(self):
        print("O gato mia.")

    def get_nome(self):
        return self.nome + ' ' + self.sobrenome

```