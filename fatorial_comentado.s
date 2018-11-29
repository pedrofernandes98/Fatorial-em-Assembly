 .data

mensagem:	.asciiz "Digite um numero\n"
numero: 	.word 1
fatorial: 	.word 1

	.text

main: 	#imprime uma string na tela

	li $v0, 4 #carrega o valor 4 para o registrador $v0, esse é o valor padrão para que o sistema operacional execute a função de imprimir uma string na tela
	la $a0, mensagem #carrega o valor da variável 'mensagem' no registrador $a0 que será passado como parâmetro que será a string a ser impressa
	syscall #chamada do sistema operacional

	#lê um inteiro digitado pelo usário

	li $v0, 5 #carrega o valor 5 para o registrador $v0, valor padrão para chamar a função do SO que lê um inteiro
	syscall #chamada do SO

	#armazena o inteiro digtado pelo usuário na variável 'numero'
	sw $v0, numero 

	#Calcula o fatorial

	li $s0, 1 #O registrador $s0 é utilizado para receber o valor que será atribuido a variável fat, dessa forma inicialmente recebe fat = 1
	add $t0, $zero, $v0 # atribui o valor digitado pelo usuário para o registrador t0 // i = num;
	li $t1, 1 # atribui o valor 1 para o registrador $t1
for:	sge $t2, $t0, $t1 # verifica se o valor de $t0 >= $t1, se for verdeiro retorna 1 para $t2, caso seja falso retorna 0 // i>=1
	beq $t2, $zero, fim # caso o valor de $t2 seja igual a 0 o programa salta para o rótulo fim, caso não seja, o programa executa a próxima linha
	mul $s0, $s0, $t0 # faz a multiplicação fat *= i;
	sub $t0, $t0, $t1 #i--
	j for #salta de volta para o for

	#Imprime o fatorail calculado

fim:	sw $s0, fatorial #armazena o valor do fatorial na variável fatorial
	li $v0, 1 #carrega o valor 1 para o registrador $v0
	move $a0, $s0 #passa o valor do fatorial para o registrador $a0
	syscall #chamada do sistema operacional

	jr $ra
	    	