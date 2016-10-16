module Vektoren

import Data.Vect

data Vektor : (n:Nat) -> (a:Type) -> Type where
  Nil : Vektor 0 a
  (::) : a -> Vektor n a -> Vektor (S n) a


concat : Vektor n a -> Vektor m a -> Vektor (n+m) a
concat [] ys = ys
concat (x :: xs) ys = x :: concat xs ys


fourInts : Vect 4 Int
fourInts = [0, 1, 2, 3]

sixInts : Vect 6 Int
sixInts = [4, 5, 6, 7, 8, 9]

tenInts : Vect 10 Int
tenInts = fourInts ++ sixInts
