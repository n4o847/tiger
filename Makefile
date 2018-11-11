RESULT = bin/calc

SOURCES = \
  src/symbol.ml \
  src/absyn.ml \
  src/parser.mly \
  src/lexer.mll \
  src/prabsyn.ml \
  src/calc.ml

-include OCamlMakefile
