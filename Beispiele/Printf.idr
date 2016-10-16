module PrintF

----------------------------------------------------------------------
-- Aufwärmen

NNatsFun : Nat -> Type
NNatsFun Z = Nat
NNatsFun (S k) = Nat -> NNatsFun k

adder : (n:Nat) -> Nat -> NNatsFun n
adder Z acc = acc
adder (S k) acc = \n => adder k (acc+n)


----------------------------------------------------------------------
-- PRINTF

-- Beschreibt den Aufbau des Formatstrings:

data Format
     = Num Format
     | Str Format
     | Lit String Format
     | End


-- Typfunktion: Format -> Type

PrintfType : Format -> Type
PrintfType (Num rest) = Integer -> PrintfType rest
PrintfType (Str rest) = String -> PrintfType rest
PrintfType (Lit _ rest) = PrintfType rest
PrintfType End = String


-- Funktion mit Argumenten, die durch `format` gegeben werden
-- und die über `acc` die Ausgabe entsprechend des `format` erstellt

printfToString : (format : Format) -> (acc : String) -> PrintfType format
printfToString (Num rest) acc = \num => printfToString rest (acc ++ show num)
printfToString (Str rest) acc = \str => printfToString rest (acc ++ str)
printfToString (Lit out rest) acc = printfToString rest (acc ++ out)
printfToString End acc = acc


----------------------------------------------------------------------
-- Parsen
parseStringToFormat : String -> Format
parseStringToFormat input = parseChars (unpack input)
  where
    parseChars : List Char -> Format
    parseChars [] = End
    parseChars ('%' :: 'd' :: rest) = Num (parseChars rest)
    parseChars ('%' :: 's' :: rest) = Str (parseChars rest)
    parseChars (c :: rest) =
      case parseChars rest of
        Lit lit rest =>
          Lit (c `strCons` lit) rest
        sonst => Lit (pack [c]) sonst

----------------------------------------------------------------------
-- Endergebnis

printf : (format : String) -> PrintfType (parseStringToFormat format)
printf format = printfToString _ ""
