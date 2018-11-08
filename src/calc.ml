let rec print_exp = function
  | Absyn.ExpInt { value = i } ->
      print_string "ExpInt(";
      print_int i;
      print_string ")"
  | Absyn.ExpOp { left = l; op = o; right = r } ->
      print_string "ExpOp(left=";
      print_exp l;
      print_string ",op=";
      print_op o;
      print_string ",right=";
      print_exp r;
      print_string ")"

and print_op = function
  | Absyn.OpAdd -> print_string "OpAdd"
  | Absyn.OpSub -> print_string "OpSub"
  | Absyn.OpMul -> print_string "OpMul"
  | Absyn.OpDiv -> print_string "OpDiv"
in

try
  let lexbuf = Lexing.from_channel stdin in
  while true do
    let result = Parser.main Lexer.token lexbuf in
    print_exp result;
    print_newline ();
    flush stdout
  done
with
| Lexer.Eof -> exit 0
