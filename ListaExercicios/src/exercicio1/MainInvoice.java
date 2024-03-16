
package exercicio1;


public class MainInvoice {


    public static void main(String[] args) {
     
        Invoice fatura = new Invoice("001", "Teclado", 2, 50.0);

        // Exibindo informações sobre a fatura
        System.out.println("Número do item: " + fatura.getNumeroItem());
        System.out.println("Descrição do item: " + fatura.getDescricaoItem());
        System.out.println("Quantidade do item: " + fatura.getQuantidadeItem());
        System.out.println("Preço unitário do item: " + fatura.getPrecoUnitarioItem());
        System.out.println("Valor da fatura: " + fatura.getValorFatura());
    }
}
