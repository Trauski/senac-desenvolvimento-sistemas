
package uc06_atv2_fabiot;


public class Assalariado extends Funcionario {
    
    private double salario;
    
    public Assalariado(String nome, String cpf, String endereco, String telefone, String setor, double salario){
        super(nome, cpf, endereco, telefone, setor); // Herança
        this.salario = salario;
    }
    
    @Override // Usando métodos abstratos da superclasse Funcionario (Polimorfismo)
    public double calcularPagamento() {
        return salario;
    }
    
    @Override
    public void aplicarAumento(double percentual) {
        salario = salario + (salario * percentual / 100);
    }
    
    @Override
    public void exibir() {
        System.out.println("-- Assalariado --");
        super.exibir();
    }
}
