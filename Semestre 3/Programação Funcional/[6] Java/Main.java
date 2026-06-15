import java.util.*;
import java.util.function.*;

// ========================================================
// 1. CLASSES PARA HERANÇA E POLIMORFISMO (Baseado em j1 e j2)
// ========================================================
class ClasseA {
    public void f() {
        System.out.println("f na ClasseA");
    }
    public void h() {
        System.out.println("h na ClasseA");
    }
}

class ClasseB extends ClasseA {
    public void f() {
        System.out.println("f na ClasseB");
    }
    public void g() {
        System.out.println("g na ClasseB");
    }
}

// ========================================================
// 2. CLASSES PARA GENERICS (Baseado em j3)
// ========================================================
class Venda {}

class CaixaGenerica<T> {
    private T val;
    public T getVal() {
        return val;
    }
    public void setVal(T v) {
        val = v;
    }
}

// ========================================================
// 3. INTERFACES FUNCIONAIS E LAMBDAS (Baseado em j4)
// ========================================================
interface OperacaoMatematica {
    int f(int x);
}

class SomaUm implements OperacaoMatematica {
    public int f(int x) {
        return x + 1;
    }
}

class SubtraiUm implements OperacaoMatematica {
    public int f(int x) {
        return x - 1;
    }
}

// ========================================================
// 4. DOMÍNIO PARA STREAMS API (Baseado em j5)
// ========================================================
enum TipoProduto {
    ALIMENTO,
    LIMPEZA,
    OUTROS
}

class Produto {
    private final String nome;
    private int quantidade;
    private final TipoProduto tipoProduto;
 
    public Produto(String nome, int quantidade, TipoProduto tipoProduto) {
        this.nome = nome;
        this.quantidade = quantidade;
        this.tipoProduto = tipoProduto;
    }
 
    public String getNome() { return nome; }
    public int getQuantidade() { return quantidade; }
    public TipoProduto getTipoProduto() { return tipoProduto; }
}

// ========================================================
// CLASSE PRINCIPAL UNIFICADA
// ========================================================
public class Main {
    public static void main(String[] args) {
        
        System.out.println("=== 1. TESTE DE POLIMORFISMO ===");
        ClasseA a = new ClasseA();
        a.f();
        
        ClasseB b = new ClasseB();
        b.f();
        b.g();
        
        ClasseA a1 = new ClasseB(); // Polimorfismo
        a1.f();
        a1.h();
        // ClasseB b1 = new ClasseA(); // Isso gera erro de compilação
        
        
        System.out.println("\n=== 2. TESTE DE GENERICS ===");
        CaixaGenerica<String> texto = new CaixaGenerica<String>();
        texto.setVal("Funciona com String");
        CaixaGenerica<Venda> vendaObj = new CaixaGenerica<Venda>();
        CaixaGenerica<Integer> numeroObj = new CaixaGenerica<Integer>();
        System.out.println("Generics instanciados com sucesso.");

        
        System.out.println("\n=== 3. TESTE DE LAMBDAS E INTERFACES ===");
        OperacaoMatematica op1 = new SomaUm();
        System.out.println("Resultado interface implementada por classe: " + op1.f(5));
        
        // Passando comportamento via Expressão Lambda
        OperacaoMatematica opLambda = x -> (x * 3);
        System.out.println("Resultado da interface via Lambda: " + opLambda.f(6));
        
        OperacaoMatematica vetorOperacoes[] = { x -> (x + 1), x -> (x - 1), new SomaUm() };
        int resultadoAgregado = processaFuncoes(10, vetorOperacoes);
        System.out.println("Resultado agregado iterando lambdas: " + resultadoAgregado);

        
        System.out.println("\n=== 4. TESTE DE IMPERATIVO VS DECLARATIVO (STREAMS) ===");
        List<Produto> produtos = new ArrayList<>();
        produtos.add(new Produto("Sabao", 10, TipoProduto.LIMPEZA));
        produtos.add(new Produto("Macarrao", 20, TipoProduto.ALIMENTO));
        produtos.add(new Produto("Panela", 5, TipoProduto.OUTROS));
        produtos.add(new Produto("Rodo", 11, TipoProduto.LIMPEZA));
        produtos.add(new Produto("Feijao", 15, TipoProduto.ALIMENTO));
        produtos.add(new Produto("Batata", 2, TipoProduto.ALIMENTO));
        produtos.add(new Produto("Toalha", 10, TipoProduto.OUTROS));
        produtos.add(new Produto("Arroz", 4, TipoProduto.ALIMENTO));

        System.out.println("-- Abordagem Imperativa (For/If) --");
        int cnt = 0;
        for (Produto p : produtos) {
            if (p.getTipoProduto() == TipoProduto.LIMPEZA && p.getQuantidade() > 5) {
                cnt += 1;
                System.out.println(p.getNome());
                if (cnt >= 2) { // Adaptei o limitador lógico
                    break;
                }
            }
        }

        System.out.println("-- Abordagem Declarativa (Stream) --");
        produtos.stream()
                .filter(p -> p.getQuantidade() > 5)
                .limit(2)
                .filter(p -> p.getTipoProduto() == TipoProduto.LIMPEZA)
                .map(p -> p.getNome())
                .forEach(n -> System.out.println(n));
    }
    
    // Função auxiliar utilizada no bloco 3
    static int processaFuncoes(int x, OperacaoMatematica v[]) {
        int s = 0;
        for (OperacaoMatematica i : v) {
            s += i.f(x);
        }
        return s;
    }
}