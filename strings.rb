# String
#

# Concatenação
string = 'Ola, ' + 'Mundo'
assert_equal 'Ola, Mundo', string

ola = 'Ola, '
mundo = 'Mundo'
string = ola + mundo
assert_equal 'Ola, ', ola
assert_equal  'Mundo', mundo

ola = 'Ola, '
mundo = 'Mundo'
ola += mundo
assert_equal 'Ola, Mundo', ola

# Quebra de linha
string = "\n"
assert_equal 1, string.size

string = '\n'
assert_equal 2, string.size

# Interpolação
valor = 123
string = "valor: #{valor}"
assert_equal "valor: #{valor}", string

valor = 123
string = 'valor: #{valor}'
assert_equal 'valor: #{valor}', string

# Operação de "slice" em Strings
string = 'Arroz, Feijão e batata frita'
assert_equal "Fei", string[7,3]
assert_equal "Fei", string[7..9]
assert_equal "r", string[1]