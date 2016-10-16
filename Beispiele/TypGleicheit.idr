module TypGleichheit

import Data.Vect

congruent : { ty, ty' : Type } -> { a,b : ty } -> {f : ty -> ty' } -> (a = b) -> (f a = f b)
congruent Refl = Refl

gleicheZahl : (a : Nat) -> (b : Nat) -> Maybe (a = b)
gleicheZahl Z Z = Just Refl
gleicheZahl Z (S k) = Nothing
gleicheZahl (S k) Z = Nothing
gleicheZahl (S k) (S j) =
  case gleicheZahl k j of
    Just prf => Just (congruent prf)


plus1IstSucc : (n:Nat) -> S n = n+1
plus1IstSucc Z = Refl
plus1IstSucc (S k) = cong (plus1IstSucc k)


vecReverse : Vect n a -> Vect n a
vecReverse [] = []
vecReverse (x :: xs) = 
  let ind = vecReverse xs
      v' = ind ++ [x]
  in isSame v'
  where
    isSame : Vect (k + 1) a -> Vect (S k) a
    isSame {k} v = rewrite (plus1IstSucc k) in v
