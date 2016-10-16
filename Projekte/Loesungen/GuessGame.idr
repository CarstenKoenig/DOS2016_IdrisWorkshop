module Main

import Data.Vect

----------------------------------------------------------------------
-- Hilffunktion


remove : (x : a) -> (xs : Vect (S n) a) -> { auto prf : Elem x xs } -> Vect n a
remove {prf = Here} x (x :: ys) = ys
remove {prf = (There Here)} x (y :: (x :: xs)) = y :: xs
remove {prf = (There (There later))} x (y :: (z :: xs)) = y :: remove x (z::xs)


----------------------------------------------------------------------
-- Spiel-Zustand

data GameState : (guessesRemaining : Nat) -> (letters : Nat) -> Type where
  MkGameState : (word : String)
                -> (missing : Vect letters Char)
                -> GameState guessesRemaining letters


data Finished : Type where
  Lost : (game : GameState 0 (S letters)) -> Finished
  Won : (game : GameState (S guesses) 0) -> Finished


----------------------------------------------------------------------
-- Spielereingabe prüfen

data ValidInput : List Char -> Type where
  Letter : (c : Char) -> ValidInput [c]


toFew : ValidInput [] -> Void
toFew (Letter _) impossible

toMuch : ValidInput (c::c'::cs) -> Void
toMuch (Letter _) impossible

isValidInput : (cs : List Char) -> Dec (ValidInput cs)
isValidInput [] = No toFew
isValidInput [c] = Yes (Letter c)
isValidInput (c::c'::cs) = No toMuch


isValidString : (s : String) -> Dec (ValidInput (unpack s))
isValidString s = isValidInput _

----------------------------------------------------------------------
-- Eingabe

readGuess : IO (c ** ValidInput c)
readGuess = do
  putStrLn "Buchstabe? "
  input <- getLine
  case isValidString (toUpper input) of
    Yes prf => pure (_ ** prf)
    No _ => do
      print "ungültige Eingabe"
      readGuess

----------------------------------------------------------------------
-- Verarbeitung

processGuess : (letter : Char) ->
               GameState (S guesses) (S letters) ->
               Either (GameState guesses (S letters))
                      (GameState (S guesses) letters)
processGuess letter (MkGameState word missing) = 
  case isElem letter missing of
    Yes ind => Right (MkGameState word (remove letter missing))
    No _ => Left (MkGameState word missing)


----------------------------------------------------------------------
-- Spiel-Funktion

game : GameState (S guesses) (S letters) -> IO Finished
game {guesses} {letters} gameState = do
  (_ ** Letter letter) <- readGuess
  case processGuess letter gameState of
    Left nope => do
      putStrLn "falsch geraten"
      case guesses of
        Z => pure (Lost nope)
        S k => game nope
    Right yeah => do
      putStrLn "richtig geraten"
      case letters of
        Z => pure (Won yeah)
        S k => game yeah
        
        
----------------------------------------------------------------------
-- Main

main : IO ()
main = do
  ergebnis <- game {guesses=5} 
	(MkGameState "DevOpenSpace" ['D','E','V','O','P','N','S','A','C'])
  case ergebnis of
    Lost (MkGameState word _) =>
      putStrLn ("Verloren - das Wort war " ++ word)
    Won _ =>
      putStrLn "Gewonnen!"
