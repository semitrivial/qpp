xparse:{[x;fnc]
  tp:type x;
  if[0h=tp;
    if[1=(#)x;
      if[0h=type x[0];:chmap_list[qstr[;fnc];x[0]]];
      if[(11h=type x[0]) & (1<count x[0]);:xparse[;fnc] x[0]];
      :"(,)",xparse[;fnc] x[0]
    ];
    if[0=(#)x;:"()"];
    if[(enlist)~(*)x;
      if[2<(#)x;:"(",(";" sv xparse[;fnc] each 1_x),")"];
      if[(2=(#)x) & ((enlist)~(*)x[1]);
        :"(enlist)enlist[",(";"sv xparse[;fnc] each 1_x[1]),"]"
      ];
    ];
    if[`functional~(*)x;:xparse[x[1];1b]];
    :"(",(fncstr[;fnc](*)x),")[",(chmap[xparse[;fnc];1_x]),"]"
  ];
  if[-11h=tp;:string x];
  if[99h=tp;:qstr[;fnc] x];
  if[(0<tp) & (20>tp);:"(",(";"sv qstr[;fnc] each x),")"];
  :.Q.s1 x
 };

fncstr:{[x;fnc]
  if[100h=type x;:string qpp x];
  if[-11h=type x;:string x];
  if[0h=type x;:xparse[;fnc] x];
  qstr[;fnc] x
 };

qstr:{[x;fnc]
  tp:type x;
  if[(0h<=tp) & (20h>tp);:chmap_list[qstr[;fnc];x]];
  if[99h=tp;:"(",(qstr[;fnc] key x),")!",qstr[;fnc] value x];
  if[(-11h=tp) & fnc;
    :string x
  ];
  .Q.s1 x
 };

filter_projections:{
  if[104h=type x;:""];
  :x
 };

chmap:{[f;x]
  ";" sv filter_projections each f each x
 };

chmap_list:{[f;x]
  if[1=(#)x;
    if[0h=type x[0];:"(,)",f[x[0]]];
    :"(),",f[x[0]]
  ];
  "(",chmap[f;x],")"
 };

// Taken from https://github.com/patmok/unparse
break:{$[type x;0b;vchar x;0b;not x~()]};
vchar:(1# 11h)~type';  / char vector?
