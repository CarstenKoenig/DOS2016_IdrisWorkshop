module VectFilter

import Data.Vect

filter' : (a -> Bool) -> Vect n a -> (m ** Vect m a)
filter' pred [] = (0 ** [])
filter' pred (x :: xs) =
  let (_ ** rek) = filter' pred xs
  in if pred x then (_ ** x::rek) else (_ ** rek)

beispiel : (m ** Vect m Integer)
beispiel = filter' (\x => (x `mod` 2) == 0) [1,2,3,4,5,6,7,8,9,10]
