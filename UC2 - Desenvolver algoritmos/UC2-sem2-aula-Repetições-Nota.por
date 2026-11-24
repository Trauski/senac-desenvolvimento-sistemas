programa
{
	
	funcao inicio()
	{
		
		inteiro nota

		escreva("Digite uma nota entre 0 e 10: ")
		leia(nota)

		enquanto(nota < 0 ou nota > 10) {
			escreva("Nota inválida! Digite novamente. ")
			leia(nota)
		}
		escreva("Nota ", nota, " registrada com sucesso. ")
		*/

		inteiro opcao, numero01, numero02

		faca {
			escreva("\n 1 - Soma\n 2 - Média\n 3 - Subtração\n 0 - Sair ")
			leia(opcao)

			escreva("Digite o primeiro valor: ")
			leia(numero01)
			escreva("Digite o segundo valor: ")
			leia(numero02)

			se(opcao == 1) {
				escreva("A soma é: ", numero01 + numero02, "\n")
			} senao se (opcao == 2) {
				escreva("A média é ", ((numero01 + numero02)/2), "\n")
			} senao se (opcao == 3) {
				escreva ("A subtração é: ", numero01 - numero02, "\n")
			}
						
		} enquanto (opcao != 0)
			escreva("Encerrando programa")



			//Último exemplo
			inteiro i = 0

			enquanto(i <5) {
				escreva("Programa em execução. Exibindo a linha ", i, "\n")
				i++
			}
			
		
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 780; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */