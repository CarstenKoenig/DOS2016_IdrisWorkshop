module Main

-- `IO a` sagt: ich bin eine Aktion mit Seiteneffekten, die nach Abschluss ein `a` zurückgibt
-- `putStr str`: schreibe String `str`  in `stdout`
-- `putStrLn` schreibe String `(str + '\n')` in `stdout`
-- `getLine` liest alles bis zur nächsten `'\n'` von `stdin`

-- aufruf über
-- :exec in REPL (ruft `Main.main` auf)
-- im Terminal `idris Datei.idr --exec plusIO`
-- Kompilieren: `idris Datei.idr -o Datei.exe`

----------------------------------------------------------------------
-- Übung

-- Schreib eine Aktion, dass zwei Zahlen eingeben lässt
-- und dann die Summe ausgibt


plusIO : IO Int
plusIO = ?todo


main : IO ()
main = do
  erg <- plusIO
  putStrLn $ show erg
