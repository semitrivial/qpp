\l xparse.q

qpp:{[f]
  code:last (.)f;
  code:code[1+(!)((#)code)-2];
  code_vars:parse_code_vars[code];
  code:code_vars`code;
  vars:code_vars`vars;
  code:ssr[code;"\n";" "];
  code:parse code;
  code:"{",vars,(xparse[;0b] code),"}";
  value code
 };

parse_code_vars:{
  if[not (first x)~"[";
    :`code`vars ! (x;"")
  ];
  end:1+first where x="]";
  vars:x til end;
  code:x end + til (count x)-end;
  `code`vars ! (code;vars)
 };
