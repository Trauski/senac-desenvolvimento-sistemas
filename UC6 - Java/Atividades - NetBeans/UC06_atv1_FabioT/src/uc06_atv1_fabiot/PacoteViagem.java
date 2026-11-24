package uc06_atv1_fabiot;

// Classe e seus atributos (incluindo as outras classes)
public class PacoteViagem {
    
    Transporte transporte;
    Hospedagem hospedagem;
    String destino;
    int quantidadeDias;
    
    // Construtor
    public PacoteViagem(Transporte transporte, Hospedagem hospedagem, String destino, int quantidadeDias){
        this.transporte = transporte;
        this.hospedagem = hospedagem;
        this.destino = destino;
        this.quantidadeDias = quantidadeDias;
    }
    
    // Método 1 - Calcular hospedagem a partir de qtd de dias e valor da diária, em USD
    public double calcularTotalHospedagem() {
        return hospedagem.getValorDiaria() * quantidadeDias;
    }
    
    // Método 2 - Calcular valor com margem de lucro informada (%), em USD
    public double calcularLucro(double valor, double margem){
        return valor * (1 + margem/100);
    }
    
    // Método 3 - Calcular total do pacote com margem (%) e adicionais ($), em USD
    public double calcularTotalPacote(double margem, double taxasAdicionais) {
        double totalHospedagem = calcularTotalHospedagem();
        double subtotal = transporte.getValor() + totalHospedagem + taxasAdicionais;
        return calcularLucro(subtotal, margem); //chamando método 2
    }
    
    // Método 4 - exibir() dessa classe chamando também método exibir() de transporte e hospedagem
    public void exibir(double margem, double taxasAdicionais){
        System.out.println("=== Pacote de Viagem ===");
        System.out.println("Destino: " + destino);
        System.out.println("Número de dias: " + quantidadeDias);
        transporte.exibir();
        hospedagem.exibir();
        System.out.println("Total hospedagem: $" + String.format("%.2f", calcularTotalHospedagem()));
        System.out.println("Total do pacote: $" + String.format("%.2f", calcularTotalPacote(margem, taxasAdicionais)));
        
    }
            
}
