
package uc06_atv3_fabiot;

import java.util.Scanner;

public class UC06_atv3_FabioT {

    public static void main(String[] args) {
  
    Scanner scanner = new Scanner(System.in);
        
        // Criando o objeto Pagamentos
        System.out.print("Nome da empresa: ");
        String nomeEmpresa = scanner.nextLine();
        Pagamentos pagamentos = new Pagamentos(nomeEmpresa);
        
        // Cadastrando impostos
        System.out.println("\nTipos de imposto disponiveis: PIS, IPI");
        System.out.println("Digite 'pare' para encerrar o cadastro.");
        
        while (true) {
            System.out.print("\nTipo de imposto: ");
            String tipo = scanner.nextLine().toUpperCase();
            
            if (tipo.equals("PARE")) break;
            
            if (tipo.equals("PIS")) {
                double debito = lerDouble(scanner, "Valor total de debito: R$");
                double credito = lerDouble(scanner, "Valor total de credito: R$");
                pagamentos.adicionarImposto(new PIS(debito, credito));
                System.out.println("PIS cadastrado com sucesso!");
                
            } else if (tipo.equals("IPI")) {
                double aliquota = lerDouble(scanner, "Aliquota (%): ");
                double valor = lerDouble(scanner, "Valor do produto: R$");
                double frete = lerDouble(scanner, "Frete: R$");
                double seguro = lerDouble(scanner, "Seguro: R$");
                double outrasDespesas = lerDouble(scanner, "Outras despesas: R$");
                pagamentos.adicionarImposto(new IPI(aliquota, valor, frete, seguro, outrasDespesas));
                System.out.println("IPI cadastrado com sucesso!");
                
            } else {
                System.out.println("Tipo invalido! Digite PIS, IPI ou 'pare' para encerrar.");
            }
        }
        
        // Exibindo todos os impostos cadastrados
        pagamentos.exibirImpostos();
        
        scanner.close();
    }
    
    static double lerDouble(Scanner scanner, String mensagem) {
        while (true) {
            System.out.print(mensagem);
            String texto = scanner.nextLine().replace(",", ".");
            try {
                return Double.parseDouble(texto);
            } catch (Exception e) {
                System.out.println("Valor invalido! Digite apenas numeros.");
            }
        }
    }
}