module Main

import System

----------------------------------------------------------------------
-- Hilffunktionen

readNumber : IO (Maybe Nat)
readNumber = do
  input <- getLine
  if all isDigit (unpack input) then
    pure (Just (cast input))
  else 
    pure Nothing
    
----------------------------------------------------------------------
-- Projekt

-- Gesucht ist eine zufällige Zahl Z zwischen 1 und 100 
-- (Hinweis: `System.time : IO Integer`)
-- Der Spieler hat n Versuche (Vorschlag: n=7)
-- Zunächst gibt das Spiel die Anzahl der verbliebenen Versuche aus
-- Dann wird der Spieler aufgefordert eine Zahl zu nennen
-- Hat er keine Zahl eingegeben wiederholt sich der letzt Schritt 
-- (nach Ausgabe einer Warnung)
-- Hat der Spieler Z eraten hat er gewonnen 
--    eine entsprechende Meldung wird ausgegeben und das Spiel ist beendet
-- Sonst erhält der Spieler eine Meldung (zu klein/zu groß) und das Spiel
-- geht mit einem Versuch weniger (n-1) oben weiter

-- Implementiere dazu diese Funktionen entsprechend:

rate : (ziel : Nat) -> (versuche : Nat) -> IO ()


zufallsZahl : IO Nat


main : IO ()
main = do
  ziel <- zufallsZahl
  rate ziel 7
