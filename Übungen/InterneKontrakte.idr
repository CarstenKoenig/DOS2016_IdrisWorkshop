module InterneKontrakte

import Data.Vect

-- Implementiere
entferne : Eq a => (x : a) -> Vect n a -> (m ** Vect m a)












----------------------------------------------------------------------

data IstDrin : a -> Vect n a -> Type where
  Hier : IstDrin a (a :: xs)
  Dort : IstDrin a xs -> IstDrin a (y :: xs)


-- Implementiere:
-- entferne' : (x : a) -> (xs : Vect (S n) a) -> IstDrin x xs -> Vect n a


----------------------------------------------------------------------

-- IstDrin gibt es schon als `Elem` - reimplementiere damit


----------------------------------------------------------------------

-- implementiere
-- istDrin : DecEq a => (x : a) -> (xs : Vect n a) -> Dec (Elem x xs)

