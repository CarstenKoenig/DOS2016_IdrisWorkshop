module Vektoren

import Data.Vect

-- verändert jedes Element des Vektors indem f darauf angewendet wird
-- Beispiel `vecMap (+ 1) [1,2,3] = [2,3,4]

vecMap : (f : a -> b) -> Vect n a -> Vect n b


-- soll die Länge des Vektors (Anzahl der Elemente) zurückgeben

vecLength : Vect n a -> Nat


-- alles bis auf das erste Element
-- vecTail : ???
