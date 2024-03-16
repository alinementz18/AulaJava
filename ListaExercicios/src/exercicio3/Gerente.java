/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package exercicio3;

/**
 *
 * @author Aline Mentz
 */
// Arquivo: Gerente.java
public class Gerente extends Usuario {
    private String setor;

    public Gerente(String nome, String cpf, String setor) {
        super(nome, cpf);
        this.setor = setor;
    }

    public String getSetor() {
        return setor;
    }

    public void setSetor(String setor) {
        this.setor = setor;
    }
}

