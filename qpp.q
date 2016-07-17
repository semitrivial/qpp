\l unparse.q
unparse:.unparse.unparse

transform_functional:{[ast]
  
 };

qpp:{[f]
  code:last (.)f;
  code:code[1+(!)((#)code)-2];
  code:parse code;
  code:transform_functional[code]
 };
