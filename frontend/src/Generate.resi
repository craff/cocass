open Problem

let generate : (~maxsol:int=?, ~callback:(int=>unit)=?,int,int)
               => promise<option<problem>>

// cancel current generation
let cancel : 'a => unit