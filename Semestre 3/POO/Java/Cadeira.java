// Necessária ser pública para usá-la em outros arquivos
public class Cadeira {

    // private: encapsulamento
    private String posicao;
    private boolean ocupado;

    //Pode haver mais de um construtor
    public Cadeira() {
        
        ocupado = false;
        posicao = "Em pé";
    }
    //c1 = new Cadeira();

    public Cadeira(String p, boolean oc) {
        
        posicao = p;
        ocupado = oc;
    }
    //c2 = new Cadeira("Em pé", false);

    public void sentar() {

        if (posicao.equals("Em pé")) {
            ocupado = true;
        }
    }

    public void levantar() {

        ocupado = false;
    }

    public void virar() {
        
        if (posicao.equals("Em pé")) {
            posicao = "Invertido";
            ocupado = false;
        }
        else {
            posicao = "Em pé";
        }
    }

    public String getPosicao() {
        
        return posicao;
    }
}