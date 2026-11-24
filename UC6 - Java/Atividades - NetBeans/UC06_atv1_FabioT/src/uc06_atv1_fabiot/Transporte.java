
package uc06_atv1_fabiot;

public class Transporte {
    
    String tipo;
    double valor;
    
    //Construtor
    public Transporte(String tipo, double valor) {
        this.tipo = tipo;
        this.valor = valor;
    }
    
    public String getTipo(){
        return tipo;
    }
    
    public double getValor(){
        return valor;
    }
    
    public void exibir(){
        System.out.println("Transporte: " + tipo);
        System.out.println("Valor: $" + String.format("%.2f", valor));
    }
    
}
