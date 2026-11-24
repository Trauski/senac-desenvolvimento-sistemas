programa
{
	
	funcao inicio()
	{
		// UC2 Atividade 2 - Fábio Trawitzki
	
		real descontoDia, gasto, total
		cadeia cliente
		inteiro i, contagem

		total = 0.0
		contagem = 0

		escreva("Qual o valor do desconto do dia: ")
		leia(descontoDia)	

		para (i = 0; i < 6; i++) {
			escreva("\nQual o nome do cliente: ")
			leia(cliente)
			escreva("\nQuanto ", cliente, " gastou na loja? ")
			leia(gasto)		

			se(gasto > 100) {
				total = total + (gasto - descontoDia)
				contagem = contagem++
				escreva("\n->  ", cliente, " recebeu desconto. \n Valor total com desconto: ", (gasto - descontoDia), "\n")
				
				} senao {
				total = total + gasto
				escreva("\n->  ", cliente, " NÃO recebeu desconto. \n Valor total: ", gasto, "\n")
				}
		 }	
			escreva("\n ---- Valor total recebido pela loja: $", total, "  ----\n")
			escreva("\n  ---- Número de clientes com desconto: ", contagem, "  ----\n")
		
	}
		
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 808; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */