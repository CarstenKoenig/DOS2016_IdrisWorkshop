module Funktionen

hallo : String -> String
hallo name = "Hallo " ++ name

addieren : Int -> Int -> Int
addieren a b = a + b

addieren' : Int -> (Int -> Int)
addieren' a = \b => a + b

add10 : Int -> Int
add10 = addieren 10

identität : { ty : Type } -> ty -> ty
identität { ty = typ } val = val
