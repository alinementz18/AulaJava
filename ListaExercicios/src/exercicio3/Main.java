
package exercicio3;


public class Main {
    public static void main(String[] args) {
        // Exemplo de utilização das classes
        Gerente gerenteFinanceiro = new Gerente("João", "123456789", "Financeiro");
        Empregado empregadoProducao = new Empregado("Maria", "987654321", "Operador de Máquinas");
        EmpregadoTerceirizado empregadoLimpeza = new EmpregadoTerceirizado("Carlos", "456789123");

        Produto banner = new Produto("Banner", 50.0);
        Produto livro = new Produto("Livro", 20.0);

        Pedido pedido1 = new Pedido("2024-03-12 10:00", 100.0, empregadoProducao);
        pedido1.adicionarProduto(banner);
        pedido1.adicionarProduto(livro);

      
        System.out.println("Nome do gerente: " + gerenteFinanceiro.getNome());
        System.out.println("Setor do gerente financeiro: " + gerenteFinanceiro.getSetor());
        System.out.println("Função do empregado de produção: " + empregadoProducao.getFuncao());
        System.out.println("CPF do empregado terceirizado: " + empregadoLimpeza.getCpf());
        System.out.println("Tipo do primeiro produto do pedido: " + pedido1.getProdutos().get(0).getTipo());
        System.out.println("Preço do primeiro produto do pedido: " + pedido1.getProdutos().get(0).getPreco());
    }
}

