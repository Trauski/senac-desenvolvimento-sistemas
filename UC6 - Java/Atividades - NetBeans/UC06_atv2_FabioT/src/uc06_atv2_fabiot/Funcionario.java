
package uc06_atv2_fabiot;


public abstract class Funcionario {    // Abstração
    
    // Atributos privados (Encapsulamento)
    private String nome, cpf, endereco, telefone, setor;
    
    // Construtor
    public Funcionario(String nome, String cpf, String endereco, String telefone, String setor) {
        this.nome = nome;
        this.cpf = cpf;
        this.endereco = endereco;
        this.telefone = telefone;
        this.setor = setor;
    }
    
    // Getters
    public String getNome() { return nome; }
    public String getCpf() { return cpf; }
    public String getEndereco() { return endereco; }
    public String getTelefone() { return telefone; }
    public String getSetor() { return setor; }
    
    // Método abstrato - cada subclasse implementa de um jeito específico
    public abstract double calcularPagamento();
    
    //Método abstrato para aumento
    public abstract void aplicarAumento(double percentual);
    
    //Método para exibir dados - vai ser herdado pelas subclasses
    public void exibir() {
        System.out.println("Nome: " + nome);
        System.out.println("CPF: " + cpf);
        System.out.println("Endereco: " + endereco);
        System.out.println("Telefone: " + telefone);
        System.out.println("Setor: " + setor);
        System.out.println("Pagamento: R$" + String.format("%.2f", calcularPagamento()));
    }
    
    
}
