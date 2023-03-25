# Rock, Paper, Scissors
Os Elfos começam a montar acampamento na praia. Para decidir cuja barraca ficará mais perto do armazenamento de lanches, um torneio gigante de Rock, Paper, Scissors já está em andamento.

Rock, Paper, Scissors é um jogo entre dois jogadores. Cada jogo contém muitas rodadas; em cada rodada, os jogadores escolhem simultaneamente uma das opções Pedra, Papel ou Tesoura, usando uma forma de mão. Em seguida, um vencedor para aquela rodada é selecionado: Pedra ganha contra Tesoura, Papel ganha contra Pedra, Tesoura ganha contra Papel. Se ambos os jogadores escolherem a mesma forma, a rodada termina em empate.

## Formas e Resultados
Há 3 formas. Elas são:

Rock (código oponente: A, código jogador: X, ganha contra: C, pontuação: 1),
Paper (código oponente: B, código jogador: Y, ganha contra: A, pontuação: 2),
Scissors (código oponente: C, código jogador: Z, ganha contra: B, pontuação: 3),

## Os resultados de pontuação são:

Vitória: 6
Derrota: 0
Empate: 3
As Regras
Agradecido pela ajuda de ontem, um Elfo lhe dá um guia de estratégia criptografado (seu input de quebra-cabeça) que eles dizem que certamente o ajudarão a vencer. "A primeira coluna é o que o oponente vai jogar:

A para Rock,
B para Paper,
C para Scissors,
 ... e a segunda coluna é o que você deve jogar em resposta:
X para Rock,
Y para Paper,
Z para Scissors,
Vencer sempre seria suspeito, então as respostas devem ter sido cuidadosamente escolhidas.

O vencedor de todo o torneio é o jogador com a maior pontuação. Sua pontuação total é a soma de suas pontuações em cada rodada. A pontuação para uma única rodada é a pontuação para a forma que você escolheu
(Rock = 1,Paper = 2,Scissors = 3,) mais a pontuação para o resultado da rodada (vitória = 6, derrota = 0, empate = 3).

Desde que você não pode ter certeza se o Elf está tentando ajudá-lo ou enganá-lo, você deve calcular a pontuação que você obteria se seguisse o guia de estratégia.

## Jogo de exemplo
Desde que você não pode ter certeza se o Elf está tentando ajudá-lo ou enganá-lo, você deve calcular a pontuação que você obteria se seguisse o guia de estratégia.

Por exemplo, suponha que você tenha recebido o seguinte guia de estratégia:

A Y
B X
C Z
Este guia de estratégia prevê e recomenda o seguinte:

O oponente escolheu  (código A), o jogador escolheu  (código Y) a rodada foi win, com uma pontuação de 8 pontuação de escolha: 2, pontuação de resultado: 6
O oponente escolheu  (código B), o jogador escolheu  (código X) a rodada foi loss, com uma pontuação de 1 pontuação de escolha: 1, pontuação de resultado: 0
O oponente escolheu  (código C), o jogador escolheu  (código Z) a rodada foi draw, com uma pontuação de 6 pontuação de escolha: 3, pontuação de resultado: 3

A pontuação final é: 15
