#########################################
## Preencha todas as ocorrências de __ ##
#########################################


# Operadores condicionais (if/else)
#

# Atribuição de valores com condições
if true
  resultado = 'valor_verdadeiro'
else
  resultado = 'valor_falso'
end
assert_equal 'valor_verdadeiro', resultado

resultado = 'valor_inicial'
if true
  resultado = 'valor_verdadeiro'
end
assert_equal 'valor_verdadeiro', resultado

resultado = 'valor_inicial'
if false
  resultado = 'valor_falso'
end
assert_equal nil, resultado

# Uso de if com uma única linha de código
resultado = 'valor_inicial'
resultado = 'valor_verdadeiro' if true
assert_equal 'valor_verdadeiro', resultado

resultado = 'valor_inicial'
resultado = 'valor_falso' if false
assert_equal nil, resultado
