all: directories bin/calc

bin/calc: obj/absyn.cmo obj/lexer.cmo obj/parser.cmo obj/calc.cmo
	ocamlc -o bin/calc obj/absyn.cmo obj/lexer.cmo obj/parser.cmo obj/calc.cmo

obj/absyn.cmo: src/absyn.ml
	ocamlc -o obj/absyn.cmo -c src/absyn.ml -I obj

obj/calc.cmo: src/calc.ml
	ocamlc -o obj/calc.cmo -c src/calc.ml -I obj

obj/parser.cmo: obj/parser.ml
	ocamlc -c obj/parser.ml -I obj

obj/lexer.cmo: obj/lexer.ml obj/parser.cmi
	ocamlc -c obj/lexer.ml -I obj

obj/parser.cmi: obj/parser.mli obj/absyn.cmo
	ocamlc -c obj/parser.mli -I obj

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
