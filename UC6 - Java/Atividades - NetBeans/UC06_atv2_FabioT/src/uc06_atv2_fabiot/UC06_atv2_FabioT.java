
package uc06_atv2_fabiot;

import java.util.ArrayList;
import java.util.Scanner;

public class UC06_atv2_FabioT {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        // Lista guarda objetos de Funcionario, incluindo Assalariado e Horista (polimorfismo)
        ArrayList<Funcionario> funcionarios = new ArrayList<>();
        
        // Cadastro de funcionarios
        System.out.print("Quantos funcionarios deseja cadastrar? (max 10) ");
        int quantidade = scanner.nextInt();
        scanner.nextLine();
        
        if (quantidade > 10) quantidade = 10; // Limitando a 10 cadastros
        
        for (int i = 0; i < quantidade; i++) {
            System.out.println("\n=== Funcionario " + (i + 1) + " ===");
            System.out.print("Tipo (assalariado/horista): ");
            String tipo = scanner.nextLine().toLowerCase();
            
            if (!tipo.equals("assalariado") && !tipo.equals("horista")) {
                System.out.println("Tipo invalido! Insira 'assalariado' ou 'horista'");
                i--;
                continue; // Reinicia o loop
            }
            
            System.out.print("Nome: ");
            String nome = scanner.nextLine();
            System.out.print("CPF: ");
            String cpf = scanner.nextLine();
            System.out.print("Endereco: ");
            String endereco = scanner.nextLine();
            System.out.print("Telefone: ");
            String telefone = scanner.nextLine();
            System.out.print("Setor: ");
            String setor = scanner.nextLine();
            
            if (tipo.equals("assalariado")) {
                System.out.print("Salario mensal: R$");
                double salario = scanner.nextDouble();
                scanner.nextLine();
                funcionarios.add(new Assalariado(nome, cpf, endereco, telefone, setor, salario));
                
            } else if (tipo.equals("horista")) {
                System.out.print("Horas trabalhadas: ");
                double horas = scanner.nextDouble();
                scanner.nextLine();
                System.out.print("Valor por hora: R$");
                double valorHora = scanner.nextDouble();
                scanner.nextLine();
                funcionarios.add(new Horista(nome, cpf, endereco, telefone, setor, horas, valorHora));
            } 
        }
        
        // Exibindo dados de todos os funcionários
        System.out.println("\n=== DADOS DOS FUNCIONARIOS ===");
        for (Funcionario f : funcionarios) {
            f.exibir();
            System.out.println("---------------------------");
        }
        
        // Aplicando aumento geral
        System.out.println("\nInforme o percentual de aumento geral (%): ");
        double aumento = scanner.nextDouble();
        scanner.nextLine();
        
        for (Funcionario f : funcionarios) {
            f.aplicarAumento(aumento);
        }
        
        // Exibindo pagamentos após aumento
        System.out.println("\n=== PAGAMENTOS APOS AUMENTO DE " + aumento + "% ===");
        for (Funcionario f : funcionarios) {
            System.out.println(f.getNome() + " - R$" + String.format("%.2f", f.calcularPagamento()));
        }
        
        scanner.close();
    }
    
}
