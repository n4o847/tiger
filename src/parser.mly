%{
  module A = Absyn
%}

%token <Symbol.t> ID
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
  | expr EOL                { $1 }

expr:
  | ID                      { A.ExpVar { sym = $1 } }
  | INT                     { A.ExpInt { value = $1 } }
  | LPAREN expr RPAREN      { $2 }
  | expr PLUS expr          { A.ExpOp { left = $1; op = A.OpAdd; right = $3 } }
  | expr MINUS expr         { A.ExpOp { left = $1; op = A.OpSub; right = $3 } }
  | expr TIMES expr         { A.ExpOp { left = $1; op = A.OpMul; right = $3 } }
  | expr DIV expr           { A.ExpOp { left = $1; op = A.OpDiv; right = $3 } }
  | MINUS expr %prec UMINUS { A.ExpOp
                              { left = A.ExpInt { value = 0 }
                              ; op = A.OpSub
                              ; right = $2
                              } }
