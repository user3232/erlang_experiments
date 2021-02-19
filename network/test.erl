-module(test).
-export([double/1, sum/3]).

double(X)->2*X.
sum(X,Y)->X+Y.
sum(X,Y,Z)->sum(X,Y)+Z.


