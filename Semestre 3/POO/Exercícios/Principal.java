import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

class Pessoa {

    //Atributos são privados (encapsulamento)
    private String nome;
    private int anoNasc;
    private double peso;
    private int altura;

    // Construtor
    public Pessoa(String nome, int anoNasc, double peso, int altura) {

        this.nome = nome;
        this.anoNasc = anoNasc;
        this.peso = peso;
        this.altura = altura;
    }

    // Getters e Setters
    public String getNome() { return nome; }
    public void setNome(String nome) { this.nome = nome; }

    public int getAnoNasc() { return anoNasc; }
    public void seteAnoNasc(int anoNasc) { this.anoNasc = anoNasc; }    

    // Cálculo da idade
    public int calculaIdade() {

        int anoAtual = LocalDate.now().getYear();
        return anoAtual - this.anoNasc;
    }
}

class Agenda {

    private final int maxPessoas = 100;
    private List<Pessoa> pessoas;

    // Construtor
    public Agenda() {

        this.pessoas = new ArrayList<>();
    }

    public void armazenarPessoa(Pessoa p) {

        if (pessoas.size() < maxPessoas) {
            
            pessoas.add(p);
        }
        else {
            System.out.println("Agenda lotada!");
        }
    }

    public String achaPeloNome(String nome) {

        for (Pessoa p : pessoas) {
            if (p.getNome().equals(nome)) {
                return p.getNome() + " está na agenda.";
            }
        }

        return nome + " não encontrado.";
    }
    
}

public class Principal {
    public static void main(String[] args) {

        Pessoa eu = new Pessoa("Fausto", 2004, 90.0, 183);
        Agenda minhaAgenda = new Agenda();

        minhaAgenda.armazenarPessoa(eu);
        
        System.out.println(minhaAgenda.achaPeloNome("Fausto"));

    }
}