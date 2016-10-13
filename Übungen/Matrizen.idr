module Matrizen

import Data.Vect

Matrix : (Nat, Nat) -> Type -> Type
Matrix (n,m) a = Vect n (Vect m a)

matTranspose : Matrix (n,m) a -> Matrix (m,n) a
matTranspose [] = mat0
  where
    mat0 : Matrix (n,0) a
    mat0 {n} = replicate n []
matTranspose (x :: xs) = 
  let xs' = transpose xs
  in zipWith (::) x (transpose xs)


----------------------------------------------------------------------
-- Matrixmultiplikation

-- Hinweise

-- Funktioniert über "Zeile MAL Spalte"
-- MAL ist dabei das Skalarprodukt: <[1,2,3], [3,4,5]> = (1*3) + (2*4) + (3*5)
-- Schleifen für Zeile und Spalte, können über `map` implementiert werden

matMult : Num a => Matrix (n,m) a -> Matrix (m,o) a -> Matrix (n,o) a

a : Matrix (3,2) Int
a = [[1,2],[3,4],[5,6]]

b : Matrix (2,4) Int
b = [[7,8,9,10],[11,12,13,14]]

ab : Matrix (3,4) Int
ab = [[29,32,35,38],[65,72,79,86],[101,112,123,134]]

-- checkIt in der REPL evaluiert sollte True ergeben
checkIt : Bool
checkIt = matMult a b == ab
