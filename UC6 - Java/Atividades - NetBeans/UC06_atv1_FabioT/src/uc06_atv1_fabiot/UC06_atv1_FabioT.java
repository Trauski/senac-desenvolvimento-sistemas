
package uc06_atv1_fabiot;

import java.util.Scanner;

public class UC06_atv1_FabioT {
    public static void main(String[] args) {
        
        Scanner scanner = new Scanner(System.in);
        
    // Dados do Transporte
    System.out.println("=== Cadastro de Transporte ===");
    System.out.print("Tipo de transporte (aéreo, rodoviário, marítimo): ");
    String tipoTransporte = scanner.nextLine();
    System.out.print("Valor do transporte em dólar: ");
    double valorTransporte = scanner.nextDouble();
    scanner.nextLine(); // limpa o buffer

    Transporte transporte = new Transporte(tipoTransporte, valorTransporte);
      
    // Dados da Hospedagem
    System.out.println("\n=== Cadastro de Hospedagem ===");
    System.out.print("Descrição da hospedagem: ");
    String descricaoHospedagem = scanner.nextLine();
    System.out.print("Valor da diária em dólar: ");
    double valorDiaria = scanner.nextDouble();
    scanner.nextLine(); // limpa o buffer

    Hospedagem hospedagem = new Hospedagem(descricaoHospedagem, valorDiaria);
    
    // Dados do Pacote de Viagem
    System.out.println("\n=== Cadastro de Pacote de Viagem ===");
    System.out.print("Destino: ");
    String destino = scanner.nextLine();
    System.out.print("Quantidade de dias: ");
    int quantidadeDias = scanner.nextInt();
    scanner.nextLine(); // limpa o buffer
    System.out.print("Margem de lucro (%): ");
    double margem = scanner.nextDouble();
    scanner.nextLine(); // limpa o buffer
    System.out.print("Taxas adicionais em dólar: ");
    double taxasAdicionais = scanner.nextDouble();
    scanner.nextLine(); // limpa o buffer

    PacoteViagem pacote = new PacoteViagem(transporte, hospedagem, destino, quantidadeDias);
    
    // Exibindo informações do pacote
    System.out.println("\n=== Informações do Pacote ===");
    pacote.exibir(margem, taxasAdicionais);
    
    // Dados da Venda
    System.out.println("\n=== Cadastro de Venda ===");
    System.out.print("Nome do cliente: ");
    String nomeCliente = scanner.nextLine();
    System.out.print("Forma de pagamento: ");
    String formaPagamento = scanner.nextLine();
    System.out.print("Cotação do dólar (em reais): ");
    double cotacao = scanner.nextDouble();
    scanner.nextLine(); // limpa o buffer

    Venda venda = new Venda(nomeCliente, formaPagamento, pacote);
    
    // Exibindo informações da venda
    System.out.println("\n=== Informações da Venda ===");
    venda.exibir(margem, taxasAdicionais, cotacao);

    scanner.close();
    
    
    }
    
}
