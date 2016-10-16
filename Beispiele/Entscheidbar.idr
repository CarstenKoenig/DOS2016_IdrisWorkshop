module Entscheidbar

data Entscheidbar : (behauptung:Type) -> Type where
  Ja : (beweis : behauptung) -> Entscheidbar behauptung
  Nein : (widerspruch : behauptung -> Void) -> Entscheidbar behauptung


NullUngleichNachfolger : Nat -> (Z = S k) -> Void
NullUngleichNachfolger _ Refl impossible


NachfolgerUngleichNull : Nat -> (S k = Z) -> Void
NachfolgerUngleichNull _ Refl impossible


auchNichtGleich : (a = b -> Void) -> (S a = S b) -> Void
auchNichtGleich wid Refl = wid Refl


sindGleich : (n : Nat) -> (m : Nat) -> Entscheidbar (n = m)
sindGleich Z Z = Ja Refl
sindGleich Z (S k) = Nein (NullUngleichNachfolger k)
sindGleich (S k) Z = Nein (NachfolgerUngleichNull k)
sindGleich (S k) (S j) =
  case sindGleich k j of
    Ja prf => Ja (cong prf)
    Nein wid => Nein (auchNichtGleich wid)


sindGleich' : (n : Nat) -> (m : Nat) -> Dec (n = m)
sindGleich' Z Z = Yes Refl
sindGleich' Z (S k) = No (NullUngleichNachfolger k)
sindGleich' (S k) Z = No (NachfolgerUngleichNull k)
sindGleich' (S k) (S j) =
  case sindGleich' k j of
    Yes prf => Yes (cong prf)
    No wid => No (auchNichtGleich wid)
