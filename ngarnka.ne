# Grammar

record -> lexeme
          partOfSpeech
          senseEntry

lexeme            -> "\\lx " "-":? [a-z]:+

# TODO: Sort the validPartOfSpeech in alphabetical order
partOfSpeech      ->  _NL "\\ps " validPartOfSpeech
  validPartOfSpeech -> validNoun
                        | validCoverb
                        | "v"
                        | "adv"
                        | "case"
                        | "suf"
                        | "conj"
                        | "interj"
                        | "pro"
                        | "dem"
                        | "quest"
                        | "part"
  validNoun   -> "n"   gender
  validCoverb -> "cv"  transitivity

    gender            -> _NL "\\gd " validGender
    validGender         -> "f"
                            | "m"
                            | "n"
                            | "v"
                            | "?"
    
    transitivity      -> _NL "\\tr " validTransitivity
    validTransitivity     -> "dtr"
                            | "itr"
                            | "str"
                            | "tr"
                            | "?"

senseEntry -> senseNumber:?
    senseNumber -> _NL "\\sn " [\d]:+

# Newline
_NL -> "\n"
