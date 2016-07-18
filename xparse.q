xparse:{
  tp:type x;
  if[0h=tp;
    if[1=(#)x;
      if[0h=type x[0];:chmap[.Q.s1;x[0]]];
      if[(11h=type x[0]) & (1<count x[0]);:xparse x[0]];
      :"(,)",xparse x[0]
    ];
    if[0=(#)x;:"()"];
    if[((enlist)~(*)x) & (2<(#)x);:"(",(";" sv xparse each 1_x),")"];
    :"(",(fncstr(*)x),")[",(";"sv xparse each 1_x),"]"
  ];
  if[11h=tp;
    if[1=(#)x;:"`",string (*)x];
  ];
  if[-11h=tp;:string x];
  if[99h=tp;:qstr x];
  if[0<tp;:"(",(";"sv .Q.s1 each x),")"];
  :.Q.s1 x
 };

fncstr:{
  if[-11h=type x;:string x];
  qstr x
 };

qstr:{
  tp:type x;
  if[(0h<=tp) & (20h>tp);:chmap[qstr;x]];
  if[99h=tp;:"(",(qstr key x),")!",qstr value x];
  .Q.s1 x
 };

chmap:{[f;x]
  if[1=(#)x;:"(,)",f[x[0]]];
  "(",(";" sv f each x),")"
 };
