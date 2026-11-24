
package uc06_atv3_fabiot;

// Implementar a interface Imposto ("contrato")
public class PIS implements Imposto { 
    
    // Atributos privados (encapsulamento). Não acessados por outras classes
    private double debito; 
    private double credito; 
    
    //Construtor
    public PIS(double debito, double credito) {
        this.debito = debito;
        this.credito = credito;
    }

    public double getDebito() {
        return debito;
    }

    public void setDebito(double debito) {
        this.debito = debito;
    }

    public double getCredito() {
        return credito;
    }

    public void setCredito(double credito) {
        this.credito = credito;
    }
     
    @Override
    public String getDescricao() {
        return "PIS";
    }
    
    @Override
    public double calcularImposto() {
        return (debito - credito) * 1.65 / 100;
    }
    
}
