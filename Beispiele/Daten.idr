module Daten

-- Liste
zahlen : List Nat
zahlen = [1,2,3,4,5]

zahlen' : List Nat
zahlen' = [1..5]

namen : List String
namen = "Marie" :: "Carsten" :: []

-- Tuple
person : (String, Nat)
person = ("Max", 40)

-- union Type
data Farbe 
  = Rot
  | Blau
  
data Ergebnis
  = Fehler String
  | Erfolg Int
  
-- GADT
data Ergebnis' : Type where
  Fehler' : String -> Ergebnis'
  Erfolg' : Int -> Ergebnis'
  
data Expression : Type -> Type where
  Falsch : Expression Bool
  Wahr : Expression Bool
  Zahl : Nat -> Expression Nat
  Plus : Expression Nat -> Expression Nat -> Expression Nat
  Gleich : Expression Nat -> Expression Nat -> Expression Bool
  Falls : Expression Bool -> Expression a -> Expression a -> Expression a
