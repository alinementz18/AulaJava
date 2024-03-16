
package exercicio3;


public class Empregado extends Usuario {
    private String funcao;

    public Empregado(String nome, String cpf, String funcao) {
        super(nome, cpf);
        this.funcao = funcao;
    }

    public String getFuncao() {
        return funcao;
    }

    public void setFuncao(String funcao) {
        this.funcao = funcao;
    }
}

