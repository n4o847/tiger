RESULT = bin/calc

SOURCES = \
  src/absyn.ml \
  src/parser.mly \
  src/lexer.mll \
  src/prabsyn.ml \
  src/calc.ml

-include OCamlMakefile
