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