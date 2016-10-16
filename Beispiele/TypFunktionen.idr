module TypFunktionen

NatOderString : Bool -> Type
NatOderString False = Nat
NatOderString True = String

natOrString : (b:Bool) -> NatOderString b
natOrString False = 42
natOrString True = "Frage"

toString : (b:Bool) -> NatOderString b -> String
toString False n = show n
toString True s = s
