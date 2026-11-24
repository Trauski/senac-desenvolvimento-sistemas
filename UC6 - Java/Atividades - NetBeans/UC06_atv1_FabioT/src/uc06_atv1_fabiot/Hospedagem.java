
package uc06_atv1_fabiot;

public class Hospedagem {
    
    String descricao;
    double valorDiaria;
    
    public Hospedagem(String descricao, double valorDiaria) {
        this.descricao = descricao;
        this.valorDiaria = valorDiaria;
    }
    
    public String getDescricao(){
        return descricao;
    }
    
    public double getValorDiaria(){
        return valorDiaria;
    }
    
    public void exibir(){
        System.out.println("Hospedagem: " + descricao);
        System.out.println("Valor da diária: $" + String.format("%.2f", valorDiaria));
    }
    
}
