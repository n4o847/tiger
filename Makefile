RESULT = bin/calc

SOURCES = \
  src/absyn.ml \
  src/parser.mly \
  src/lexer.mll \
  src/calc.ml

-include OCamlMakefile
