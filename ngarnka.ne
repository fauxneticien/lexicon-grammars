# Grammar

record -> lexeme
          headwordSound:?
          partOfSpeech
          senseEntry:+
          dateStamp

lexeme            -> "\\lx " validLexeme
  validLexeme   -> "-":? [a-z]:+

headwordSound     -> _NL "\\sf " validHeadwordSound
  validHeadwordSound -> "Headword_Sound\\" [^\\]:+ "\\" [^_]:+ "_" [A-Z|a-z]:+ ".mp3"

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
        glossEnglish
        definitionEnglish
            semanticDomain:+
            reverseEnglish:+
        variantForm:*
        synonym:*
        scientificName:*
        example:*
        source:*
        crossReference:*
        picture:*
        encyclopedicInformationEnglish:?
        usageEnglish:?
        notesGeneral:?
        subEntry:*
              
    senseNumber -> _NL "\\sn "  [\d]:+
    glossEnglish -> _NL "\\ge " [0-9|A-Z|a-z|_]:+
    definitionEnglish -> _NL "\\de " _ABNL

  semanticDomain -> _NL "\\sd " validSemanticDomain
    validSemanticDomain ->  "A Body"
                          | "B People"
                          | "C Language and Culture"
                          | "D Things"
                          | "E Food and Cooking"
                          | "F Water"
                          | "G Environment"
                          | "H Mammals"
                          | "I Reptiles"
                          | "J Birds"
                          | "K Water Animals"
                          | "L Insects and Spiders"
                          | "M Plants"
                          | "N Description"
                          | "O Place Names"
                          | "P Moving"
                          | "Q State"
                          | "R Talking and Looking"
                          | "S Verbs (Inflecting)"
                          | "T Hitting and Violence"
                          | "U Holding and Taking"
                          | "V Space and Time"
                          | "W Questions"
                          | "X Exclamations"
                          | "Y Word Endings"
                          | "Z Pronouns"
                          | "ZZ Verbal Inflection"
                          | "ZZZ Non-explicit"
                          | "ZZZZ Sealed"

  reverseEnglish -> _NL "\\re " _ABNL
  variantForm -> _NL "\\va " validLexeme
  synonym -> _NL "\\sy " validLexeme
  scientificName -> _NL "\\sc " [A-Z|a-z|\s|.]:+

  example -> exampleVernacular
             exampleSentenceAudio:?
             exampleEnglishFreeTranslation
             referenceForExample

    exampleVernacular -> _NL "\\xv " _ABNL
    exampleSentenceAudio -> _NL "\\sfx " validExampleSentenceAudio
      validExampleSentenceAudio -> "DICT_Audio\\" [^\\]:+ "\\" [^.]:+ ".mp3"
    exampleEnglishFreeTranslation -> _NL "\\xe " _ABNL
    referenceForExample -> _NL "\\rf " _ABNL

  source -> _NL "\\so " _ABNL
  crossReference -> _NL "\\cf " validLexeme
  
  picture -> _NL "\\pc " _ABNL
  
  encyclopedicInformationEnglish -> _NL "\\ee " _ABNL
  usageEnglish -> _NL "\\ue " _ABNL
  notesGeneral -> _NL "\\nt " _ABNL
  
  subEntry -> _NL "\\se " _ABNL
          glossEnglish:?
          definitionEnglish
            semanticDomain:*
            reverseEnglish:*
          variantForm:*
          synonym:*
          scientificName:*
          example:*
          source:*
          crossReference:*
          picture:*
          encyclopedicInformationEnglish:?
          usageEnglish:?
          notesGeneral:?             
  
dateStamp -> _NL "\\dt " [\d] [\d] "/" [A-Z] [a-z] [a-z] "/" [\d] [\d] [\d] [\d]

# Newline
_NL -> "\n"
# All but new line
_ABNL -> [^\n]:+
