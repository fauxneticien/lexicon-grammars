# Ngarnka Lexicon Grammar

record -> lexeme
          partOfSpeech

lexeme            -> "\\lx " "-":? [a-z]:+ _NL

# TODO: Sort the validPartOfSpeech in alphabetical order
partOfSpeech      -> "\\ps " validPartOfSpeech _NL
  validPartOfSpeech -> validNoun
                        | validCoverb
                        | "adv"
                        | "case"
                        | "conj"
                        | "dem"
                        | "interj"
                        | "part"
                        | "pro"
                        | "quest"
                        | "suf"
                        | "v"
  validNoun   -> "n"   _NL gender
  validCoverb -> "cv"  _NL transitivity

    gender            -> "\\gd " validGender
    validGender         -> "f"
                            | "m"
                            | "n"
                            | "v"
                            | "?"
    
    transitivity      -> "\\tr " validTransitivity
    validTransitivity     -> "dtr"
                            | "itr"
                            | "str"
                            | "tr"
                            | "?"

# Newline
_NL -> "\n"
