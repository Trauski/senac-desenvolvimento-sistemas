
package uc06_atv2_fabiot;


public class Horista extends Funcionario {
    
    private double horasTrabalhadas;
    private double valorHora;
    
    public Horista(String nome, String cpf, String endereco, String telefone, String setor, double horasTrabalhadas, double valorHora) {
        super(nome, cpf, endereco, telefone, setor); // Herança
        this.horasTrabalhadas = horasTrabalhadas;
        this.valorHora = valorHora;
        
    }
    
    @Override // Usando métodos abstratos da superclasse Funcionario (Polimorfismo)
    public double calcularPagamento() {
        return  horasTrabalhadas * valorHora;
    }
    
    @Override
    public void aplicarAumento(double percentual) {
        valorHora = valorHora + (valorHora * percentual / 100);
    }
    
    @Override
    public void exibir() {
        System.out.println("-- Horista --");
        System.out.println("Horas trabalhadas: " + horasTrabalhadas);
        System.out.println("Valor por hora: R$" + String.format("%.2f", valorHora));
        super.exibir();
    }
}
