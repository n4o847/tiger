all: directories bin/calc

bin/calc: obj/lexer.cmo obj/parser.cmo obj/calc.cmo
	ocamlc -o bin/calc obj/lexer.cmo obj/parser.cmo obj/calc.cmo

obj/calc.cmo: src/calc.ml
	ocamlc -o obj/calc.cmo -c src/calc.ml -I obj

obj/parser.cmo: obj/parser.ml
	ocamlc -c obj/parser.ml -I obj

obj/lexer.cmo: obj/lexer.ml obj/parser.cmi
	ocamlc -c obj/lexer.ml -I obj

obj/parser.cmi: obj/parser.mli
	ocamlc -c obj/parser.mli

obj/lexer.ml: src/lexer.mll
	ocamllex -o obj/lexer.ml src/lexer.mll

obj/parser.ml: src/parser.mly
	ocamlyacc -b obj/parser src/parser.mly

obj/parser.mli: src/parser.mly
	ocamlyacc -b obj/parser src/parser.mly

.PHONY: all clean directories

directories:
	mkdir -p obj bin

clean:
	rm -rf obj