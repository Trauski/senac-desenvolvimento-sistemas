package uc06_atv1_fabiot;

public class Venda {
    
    String nomeCliente, formaPgto;
    PacoteViagem pacote;
    
    // Construtor
    public Venda(String nomeCliente, String formaPgto, PacoteViagem pacote){
        this.nomeCliente = nomeCliente;
        this.formaPgto = formaPgto;
        this.pacote = pacote;
    }
    
    // Método 1 - Conversão de valor informado em dólar para reais (USD -> BRL)
    public double converterParaReais(double valorDolar, double cotacao) {
        return valorDolar * cotacao;
    }
    
    public void exibir(double margem, double taxasAdicionais, double cotacao) {
        System.out.println("=== Dados da Venda ===");
        System.out.println("Cliente: " + nomeCliente);
        System.out.println("Forma de pagamento: " + formaPgto);
        pacote.exibir(margem, taxasAdicionais);
        double totalDolar = pacote.calcularTotalPacote(margem, taxasAdicionais);
        double totalReais = converterParaReais(totalDolar, cotacao);
        System.out.println("Total em dólar: $" + String.format("%.2f", totalDolar));
        System.out.println("Total em reais: R$" + String.format("%.2f", totalReais));
        
    }
}
