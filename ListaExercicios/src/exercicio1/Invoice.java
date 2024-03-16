
package exercicio1;

public class Invoice {
    

    private String numeroItem;
    private String descricaoItem;
    private int quantidadeItem;
    private double precoUnitarioItem;

 
    public Invoice(String numeroItem, String descricaoItem, int quantidadeItem, double precoUnitarioItem) {
        this.numeroItem = numeroItem;
        this.descricaoItem = descricaoItem;
        // Verifica se a quantidade é positiva
        if (quantidadeItem > 0)
            this.quantidadeItem = quantidadeItem;
        else
            this.quantidadeItem = 0;

        
        if (precoUnitarioItem > 0)
            this.precoUnitarioItem = precoUnitarioItem;
        else
            this.precoUnitarioItem = 0.0;
    }

    public String getNumeroItem() {
        return numeroItem;
    }

    public void setNumeroItem(String numeroItem) {
        this.numeroItem = numeroItem;
    }

    public String getDescricaoItem() {
        return descricaoItem;
    }

    public void setDescricaoItem(String descricaoItem) {
        this.descricaoItem = descricaoItem;
    }

    public int getQuantidadeItem() {
        return quantidadeItem;
    }

    public void setQuantidadeItem(int quantidadeItem) {
        if (quantidadeItem > 0)
            this.quantidadeItem = quantidadeItem;
        else
            this.quantidadeItem = 0;
    }

    public double getPrecoUnitarioItem() {
        return precoUnitarioItem;
    }

    public void setPrecoUnitarioItem(double precoUnitarioItem) {
        if (precoUnitarioItem > 0)
            this.precoUnitarioItem = precoUnitarioItem;
        else
            this.precoUnitarioItem = 0.0;
    }

    // Método para calcular o valor da fatura
    public double getValorFatura() {
        return quantidadeItem * precoUnitarioItem;
    }
}


