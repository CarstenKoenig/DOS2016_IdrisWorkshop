module Baum

-- ein Baum ist entweder ein leeres Blatt 
-- oder ein Ast mit einem Wert und zwei Unterbäumen
-- überlege wie der entsprechende Datentyp aussehen könnte

-- data Baum : ... where
--  Blatt : Baum a
--  Ast : ... -> Baum a
  
----------------------------------------------------------------------  
  
-- ähnlich `Elem` für den Vektor wollen wir eine Datenstruktur
-- die "beweist", dass ein Wert in einem Baum ist, indem der Weg
-- dorthin aufgezeigt wird
-- Wie kann das ausehen?

-- data PfadZu : (wert : a) -> (baum : Baum a) -> Type where
-- ??? lass Dich von Elem / IstDrin inspirieren

----------------------------------------------------------------------
      
-- jetzt müssen wir noch entscheiden, ob wir einen Weg finden können

-- gibtEsPfad : DecEq a => (zu : a) -> (baum : Baum a) -> Dec (PfadZu zu baum)

----------------------------------------------------------------------
-- Wenn alles passt sollte `zu0 = Yes (IstLinks (IstRechts Hier))` sein!
 
-- beispiel : Baum Int
-- beispiel = Ast 2 (Ast 1 Blatt (Ast 0 Blatt Blatt)) (Ast 3 Blatt Blatt)

-- zu0 : Dec (PfadZu 0 Baum.beispiel)
-- zu0 = gibtEsPfad _ _
