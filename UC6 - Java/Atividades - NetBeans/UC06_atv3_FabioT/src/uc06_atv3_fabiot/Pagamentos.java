
package uc06_atv3_fabiot;

import java.util.ArrayList;

public class Pagamentos {
    
    //Lista que aceita objetos que estejam implementando a interface Imposto
    private String nomeEmpresa;
    private ArrayList<Imposto> impostos;
    
    //Construtor inicializa lista vazia, impostos serão adicionados pelo método()
    public Pagamentos(String nomeEmpresa) {
        this.nomeEmpresa = nomeEmpresa;
        this.impostos = new ArrayList<>();
    }
    
    public String getNomeEmpresa() { 
        return nomeEmpresa; 
    }
    public void setNomeEmpresa(String nomeEmpresa) {
        this.nomeEmpresa = nomeEmpresa; 
    }
    
    public void adicionarImposto(Imposto imposto) {
        impostos.add(imposto);
    }
    
    public void exibirImpostos() {
        System.out.println("\n=== Impostos de " + nomeEmpresa + " ===");
        for (Imposto i : impostos) {
            System.out.println("Imposto: " + i.getDescricao() + 
                             " | Total: R$" + String.format("%.2f", i.calcularImposto()));
        }
    }
}
