
package uc06_atv3_fabiot;

public class IPI implements Imposto {
    
    private double aliquota;
    private double valor;
    private double frete;
    private double seguro;
    private double outrasDespesas;
    
    public IPI(double aliquota, double valor, double frete, double seguro, double outrasDespesas) {
        this.aliquota = aliquota;
        this.valor = valor;
        this.frete = frete;
        this.seguro = seguro;
        this.outrasDespesas = outrasDespesas;
    }

    public double getAliquota() {
        return aliquota;
    }

    public void setAliquota(double aliquota) {
        this.aliquota = aliquota;
    }

    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

    public double getFrete() {
        return frete;
    }

    public void setFrete(double frete) {
        this.frete = frete;
    }

    public double getSeguro() {
        return seguro;
    }

    public void setSeguro(double seguro) {
        this.seguro = seguro;
    }

    public double getOutrasDespesas() {
        return outrasDespesas;
    }

    public void setOutrasDespesas(double outrasDespesas) {
        this.outrasDespesas = outrasDespesas;
    }

    
    @Override
    public String getDescricao() {
        return "IPI";
    }
    
    @Override
    public double calcularImposto() {
        double baseCalculo = valor + frete + seguro + outrasDespesas;
        return baseCalculo * aliquota / 100;
    }
    
}
