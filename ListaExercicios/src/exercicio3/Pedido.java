/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package exercicio3;


import java.util.ArrayList;
import java.util.List;

public class Pedido {
    private String dataHoraEmissao;
    private double preco;
    private Usuario responsavelVendas;
    private List<Produto> produtos;

    public Pedido(String dataHoraEmissao, double preco, Usuario responsavelVendas) {
        this.dataHoraEmissao = dataHoraEmissao;
        this.preco = preco;
        this.responsavelVendas = responsavelVendas;
        this.produtos = new ArrayList<>();
    }

    public String getDataHoraEmissao() {
        return dataHoraEmissao;
    }

    public void setDataHoraEmissao(String dataHoraEmissao) {
        this.dataHoraEmissao = dataHoraEmissao;
    }

    public double getPreco() {
        return preco;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }

    public Usuario getResponsavelVendas() {
        return responsavelVendas;
    }

    public void setResponsavelVendas(Usuario responsavelVendas) {
        this.responsavelVendas = responsavelVendas;
    }

    public List<Produto> getProdutos() {
        return produtos;
    }

    public void setProdutos(List<Produto> produtos) {
        this.produtos = produtos;
    }

    public void adicionarProduto(Produto produto) {
        produtos.add(produto);
    }
}

