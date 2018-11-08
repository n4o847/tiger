%token <int> INT
%token PLUS MINUS TIMES DIV
%token LPAREN RPAREN
%token EOL
%left PLUS MINUS
%left TIMES DIV
%nonassoc UMINUS
%start main
%type <Absyn.exp> main
%%
main:
    expr EOL                { $1 }
;
expr:
    INT                     { Absyn.ExpInt { value = $1 } }
  | LPAREN expr RPAREN      { $2 }
  | expr PLUS expr          { Absyn.ExpOp { left = $1; op = Absyn.OpAdd; right = $3 } }
  | expr MINUS expr         { Absyn.ExpOp { left = $1; op = Absyn.OpSub; right = $3 } }
  | expr TIMES expr         { Absyn.ExpOp { left = $1; op = Absyn.OpMul; right = $3 } }
  | expr DIV expr           { Absyn.ExpOp { left = $1; op = Absyn.OpDiv; right = $3 } }
  | MINUS expr %prec UMINUS { Absyn.ExpOp
                              { left = Absyn.ExpInt { value = 0 }
                              ; op = Absyn.OpSub
                              ; right = $2
                              } }
;
