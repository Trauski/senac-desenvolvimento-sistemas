programa
{
	
	funcao inicio()
	{
		enquanto (while)

		inteiro contador
		
		contador = 0

		enquanto (contador <= 10) {
			escreva(contador, "\n")
			contador = contador + 1  // ou contador++
		}
		
		--- Exemplo 2 enquanto (while) ---

		inteiro numeroDigitado, soma = 0

		escreva("Digite o primeiro valor a ser somado: ")
		leia(numeroDigitado)

		enquanto (numeroDigitado != 0) {
			soma = soma + numeroDigitado
			escreva("Digite o próximo número: ")
			leia(numeroDigitado)
		}

		escreva("A soma total dos números foi: ", soma)

		

		// Exemplo faca/enquanto (do/while)

		inteiro contador = 0

		faca {
			escreva(contador, "\n")
			contador = contador + 1
		} enquanto(contador <= 10)

		

			inteiro opcao

			faca {
				escreva("MENU\n 1 - Saque\n 2 - Deposito\n 3 - Saldo\n 0 Sair: ")
				leia(opcao)
				se(opcao >3) {
					opcao = 0
				}
			} enquanto (opcao != 0)

		
		inteiro contador

		//para (for)
		//para (valorInicial; condição; incremento valorInicial)
		
		para(contador = 0; contador <= 10; contador++) {
			escreva(contador, "\n")
		}

		para(contador = 10; contador > 0; contador--) {
			escreva(contador, "\n")
		}

		para(contador = 0; contador <= 10; contador = contador+2) {
			escreva(contador, "\n")
		}










		
		
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 885; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */