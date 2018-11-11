type exp =
  | ExpVar of { sym : Symbol.t }
  | ExpInt of { value : int }
  | ExpOp of { left : exp; op : op; right : exp }
and op =
  | OpAdd | OpSub | OpMul | OpDiv
