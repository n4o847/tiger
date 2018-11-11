let () =
  try
    let lexbuf = Lexing.from_channel stdin in
    while true do
      let result = Parser.main Lexer.token lexbuf in
      Prabsyn.print_exp result;
      print_newline ();
      flush stdout
    done
  with
  | Lexer.Eof -> exit 0
