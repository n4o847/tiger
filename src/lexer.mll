{
open Parser
exception Eof
}
rule token = parse
  | [' ' '\t']        { token lexbuf }
  | ['\n']            { EOL }
  | ['a'-'z' 'A' - 'Z'] ['a'-'z' 'A'-'Z' '0'-'9' '\'']* as lxm
                      { ID (Symbol.of_string lxm) }
  | ['0'-'9']+ as lxm { INT (int_of_string lxm) }
  | '+'               { PLUS }
  | '-'               { MINUS }
  | '*'               { TIMES }
  | '/'               { DIV }
  | '('               { LPAREN }
  | ')'               { RPAREN }
  | eof               { raise Eof }
