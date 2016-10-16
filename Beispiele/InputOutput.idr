module InputOutput

main : IO ()
main = do
    putStr "Enter your name: "
    x <- getLine
    putStrLn ("Halo " ++ x ++ "!")


readNumber : IO (Maybe Nat)
readNumber = do
  input <- getLine
  if all isDigit (unpack input) then
    pure (Just (cast input))
  else 
    pure Nothing
