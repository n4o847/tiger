type t = { name : string; key : int }

let nextsym = ref 0
let hashtable = Hashtbl.create 128

let of_string name =
  match Hashtbl.find_opt hashtable name with
  | Some key -> { name; key }
  | None ->
    let key = !nextsym in
    nextsym := key + 1;
    Hashtbl.add hashtable name key;
    { name; key }

let name { name; key } = name

module IntMap = Map.Make (struct
  type t = int
  let compare = compare
end)

type 'a table = 'a IntMap.t
let empty = IntMap.empty
let add sym a t = IntMap.add sym.key a t
let find_opt sym t = IntMap.find_opt sym.key t
