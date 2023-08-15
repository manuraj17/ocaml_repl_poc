let print_and_return_list list =
  let _ = print_endline "List:: " in
  (match list with
   | [] -> print_endline "List is empty"
   | _ -> List.iter (fun x -> print_endline x) list);
  list

let parse_input input list =
  let parts = String.split_on_char ' ' input in
  match parts with
  | ["a"; v] ->  v :: list
  | ["p"] ->  print_and_return_list list
  | ["q"] -> exit 0
  | _ -> (print_endline "Invalid input"; list)

let print_prompt () = Printf.printf ">> "

let rec program_loop master_list =
  let _ = print_prompt () in
  let input = read_line () in
  let new_list = parse_input input master_list in
  program_loop new_list

(* Call the loop function to start the program *)
let _ = print_endline "Welcome to a POC REPL"
let _ = print_endline "Usage: "
let _ = print_endline ">> a 1 (* add an element to list *)"
let _ = print_endline ">> p (* to print the list *)"
let _ = print_endline ">> q (* to exit *)"
let _ = program_loop []
