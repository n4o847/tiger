module A = Absyn

let indent = ref 0

type indent_type = INC | KEEP | DEC

let rec print_indent ty =
  print_newline ();
  indent := !indent + (match ty with
    | INC -> 1
    | KEEP -> 0
    | DEC -> -1);
  let rec p = function
    | 0 -> ()
    | i -> print_string "    "; p (i - 1)
  in
  p !indent

and print_exp = function
  | A.ExpInt { value } ->
      print_string "ExpInt(";
      print_int value;
      print_string ")"
  | A.ExpOp { left; op; right } ->
      print_string "ExpOp";
      print_indent KEEP;
      print_string "{ left =";
      print_indent INC;
      print_exp left;
      print_indent DEC;
      print_string ", op =";
      print_indent INC;
      print_op op;
      print_indent DEC;
      print_string ", right =";
      print_indent INC;
      print_exp right;
      print_indent DEC;
      print_string "}"

and print_op = function
  | A.OpAdd -> print_string "OpAdd"
  | A.OpSub -> print_string "OpSub"
  | A.OpMul -> print_string "OpMul"
  | A.OpDiv -> print_string "OpDiv"
