programa
{
	
	funcao inicio()
	{
		inteiro i, numeroTabuada

		escreva("Digite o número que deseja a tabuada: ")
		leia(numeroTabuada)

		para(i = 0; i <= 10; i++) {
		// numero * tabuada = resultado
			escreva(numeroTabuada, " * ", i, " = ", numeroTabuada*i, "\n")
	}
		
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 283; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {numeroTabuada, 6, 13, 13};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */