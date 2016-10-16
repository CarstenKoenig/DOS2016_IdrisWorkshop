module PatternMatching

zahlen : List Nat
zahlen = [1,2,3,4,5]

person : (String, Nat)
person = ("Max", 40)

data Farbe 
  = Rot
  | Blau
  
data Expression : Type -> Type where
  Falsch : Expression Bool
  Wahr : Expression Bool
  Zahl : Nat -> Expression Nat
  Plus : Expression Nat -> Expression Nat -> Expression Nat
  Gleich : Expression Nat -> Expression Nat -> Expression Bool
  Falls : Expression Bool -> Expression a -> Expression a -> Expression a

istLeer : List a -> Bool
istLeer [] = True
istLeer (x :: xs) = False

name : (String, Nat) -> String
name (n, _) = n

eval : Expression a -> a
eval Falsch = False
eval Wahr = True
eval (Zahl k) = k
eval (Plus x y) = eval x + eval y
eval (Gleich x y) = eval x == eval y
eval (Falls b t e) = if (eval b) then eval t else eval e
