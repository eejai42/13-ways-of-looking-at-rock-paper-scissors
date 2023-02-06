# Rock, Paper, Scissors
Gli elfi iniziano a montare il loro accampamento sulla spiaggia. Per decidere la posizione della tenda pi� vicina alla scorta di snack, un torneo di Rock, Paper, Scissors � gi� in corso.

Rock, Paper, Scissors � un gioco tra due giocatori. Ogni gioco contiene molte round; in ogni round, i giocatori scelgono simultaneamente uno tra Roccia, Carta, Forbici utilizzando una forma di mano. Quindi, un vincitore per quel round viene selezionato: Roccia vince contro Forbici, Carta vince contro Roccia, Forbici vince contro Carta. Se entrambi i giocatori scelgono la stessa forma, il round termina in un pareggio.

## Forme e Risultati
Ci sono 3 forme. Sono:

Rock (codice avversario: A, codice giocatore: X, vince contro: C, punteggio: 1),
Paper (codice avversario: B, codice giocatore: Y, vince contro: A, punteggio: 2),
Scissors (codice avversario: C, codice giocatore: Z, vince contro: B, punteggio: 3),

I punteggi dei risultati sono:

- Vittoria: 6
- Sconfitta: 0
- Pareggio: 3


## Regole
Grazie al tuo aiuto di ieri, un elfo ti d� una guida strategica crittografata (il tuo input per il puzzle) che dice che ti aiuter� a vincere. "La prima colonna rappresenta ci� che il tuo avversario giocher�:

A per Rock,
B per Paper,
C per Scissors,
 ... e la seconda colonna rappresenta ci� che dovresti giocare in risposta:
X per Rock,
Y per Paper,
Z per Scissors,
Vincere ogni volta sarebbe sospetto, quindi le risposte devono essere state scelte con cura.

Il vincitore del torneo completo � il giocatore con il punteggio pi� alto. Il tuo punteggio totale � la somma dei tuoi punteggi per ogni round. Il punteggio per un singolo round � il punteggio per la forma che hai selezionato
(Rock = 1,Paper = 2,Scissors = 3,) pi� il punteggio per il risultato del round (vittoria = 6, sconfitta = 0, pareggio = 3).

Poich� non si pu� essere sicuri se l'Elfo stia cercando di aiutare o di ingannare, � necessario calcolare il punteggio che si otterrebbe seguendo la guida strategica.

## Esempio di gioco
Poich� non si pu� essere sicuri se l'Elfo stia cercando di aiutare o di ingannare, � necessario calcolare il punteggio che si otterrebbe seguendo la guida strategica.

Ad esempio, supponiamo che ti sia stata data la seguente guida strategica:

A Y
B X
C Z
Questa guida strategica prevede e raccomanda quanto segue:

L'avversario ha scelto  (codice A), il giocatore ha scelto  (codice Y), la partita � stata un win, con un punteggio di 8 punteggio di scelta: 2, punteggio di esito: 6
L'avversario ha scelto  (codice B), il giocatore ha scelto  (codice X), la partita � stata un loss, con un punteggio di 1 punteggio di scelta: 1, punteggio di esito: 0
L'avversario ha scelto  (codice C), il giocatore ha scelto  (codice Z), la partita � stata un draw, con un punteggio di 6 punteggio di scelta: 3, punteggio di esito: 3

Il punteggio finale �: 15
