\l xparse.q

qpp:{[f]
  code:last (.)f;
  code:code[1+(!)((#)code)-2];
  code:ssr[code;"\n";" "];
  code:parse code;
  code:"{",(xparse[;0b] code),"}";
  value code
 };
