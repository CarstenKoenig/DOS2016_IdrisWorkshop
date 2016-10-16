module Baum

-- ein Baum ist entweder ein leeres Blatt 
-- oder ein Ast mit einem Wert und zwei Unterbäumen
-- überlege wie der entsprechende Datentyp aussehen könnte

data Baum : (a : Type) -> Type where
  Blatt : Baum a
  Ast : (wert : a) -> (links : Baum a) -> (rechts : Baum a) -> Baum a
  
-- ähnlich `Elem` für den Vektor wollen wir eine Datenstruktur
-- die "beweist", dass ein Wert in einem Baum ist, indem der Weg
-- dorthin aufgezeigt wird
-- Wie kann das ausehen?

data PfadZu : (wert : a) -> (baum : Baum a) -> Type where
  Hier : PfadZu wert (Ast wert l r)
  IstLinks : PfadZu wert links -> PfadZu wert (Ast y links r)
  IstRechts : PfadZu wert rechts -> PfadZu wert (Ast y l rechts)
  
-- jetzt müssen wir noch entscheiden, ob wir einen Weg finden können

nichtImBlatt : PfadZu zu Blatt -> Void
nichtImBlatt Hier impossible
nichtImBlatt (IstLinks _) impossible


nowhere : (notRechts : PfadZu zu rechts -> Void) -> 
          (notLinks : PfadZu zu links -> Void) -> 
          (notHere : (zu = wert) -> Void) -> 
          PfadZu zu (Ast wert links rechts) -> Void
nowhere notRechts notLinks notHere Hier = notHere Refl
nowhere notRechts notLinks notHere (IstLinks l) = notLinks l
nowhere notRechts notLinks notHere (IstRechts r) = notRechts r


gibtEsPfad : DecEq a => (zu : a) -> (baum : Baum a) -> Dec (PfadZu zu baum)
gibtEsPfad zu Blatt = No nichtImBlatt
gibtEsPfad zu (Ast wert links rechts) = 
  case decEq zu wert of
    Yes Refl => Yes Hier
    No notHere =>
      case gibtEsPfad zu links of
        Yes links => Yes (IstLinks links)
        No notLinks => 
          case gibtEsPfad zu rechts of
            Yes rechts => Yes (IstRechts rechts)
            No notRechts => No (nowhere notRechts notLinks notHere)
        

----------------------------------------------------------------------
-- Wenn alles passt sollte `zu0 = Yes (IstLinks (IstRechts Hier))` sein!
 
beispiel : Baum Int
beispiel = Ast 2 (Ast 1 Blatt (Ast 0 Blatt Blatt)) (Ast 3 Blatt Blatt)

zu0 : Dec (PfadZu 0 Baum.beispiel)
zu0 = gibtEsPfad _ _
