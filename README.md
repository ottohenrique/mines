# mines.rb

## Como jogar
    git clone git@github.com:ottohenrique/mines.git
    cd mines
    ruby mines.rb

## Comandos

p (play)
  abre uma célula nas coordenadas X, Y
  não permite abrir uma célula já aberta ou com flag (`?`)

f (flag)
  marca uma célula como dúvidosa nas coordenadas X, Y
  não permite marcar como flag uma célula já aberta

s (score)
  exibe o total de flags colocadas, o total de células abertas e
  quantas jogadas ainda estão disponíveis

q (quit)
  sai do jogo
  
? (ajuda)
  exibe um texto com essa explicação dos comandos
  
## Gameplay

[![asciicast](https://asciinema.org/a/136782.png)](https://asciinema.org/a/136782)

[![asciicast](https://asciinema.org/a/136781.png)](https://asciinema.org/a/136781)

## Gameplay (old school)
	$ ruby mines.rb
	    0   1   2   3   4   5   6   7
	0 [ . | . | . | . | . | . | . | . ]
	1 [ . | . | . | . | . | . | . | . ]
	2 [ . | . | . | . | . | . | . | . ]
	3 [ . | . | . | . | . | . | . | . ]
	4 [ . | . | . | . | . | . | . | . ]
	x > 0
	y > 0
	    0   1   2   3   4   5   6   7
	0 [   |   | 1 | . | . | . | . | . ]
	1 [   |   | 2 | . | . | . | . | . ]
	2 [   |   | 3 | . | . | . | . | . ]
	3 [   |   | 2 | . | . | . | . | . ]
	4 [   |   | 1 | . | . | . | . | . ]
	x > 3
	y > 6
	    0   1   2   3   4   5   6   7
	0 [   |   | 1 | . | . | . | 1 |   ]
	1 [   |   | 2 | . | 3 | 1 | 1 |   ]
	2 [   |   | 3 | . | 3 |   |   |   ]
	3 [   |   | 2 | . | 3 | 1 |   |   ]
	4 [   |   | 1 | . | . | 1 |   |   ]
	x > 2
	y > 3
	mines.rb:31:in `play': Booooom! (RuntimeError)
		from mines.rb:101:in `<main>'
