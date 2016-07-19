\l xparse.q

defunc:{
  if[break x;
    if[`functional~(*)x;
      :(x[1][0]),strip_enlists each 1_x[1]
    ];
    :((,)(*)x) , .z.s each 1_x;
  ];
  x
 };

strip_enlists:{
  tp:type x;
  if[0h=tp;
    if[1=(#)x;
      if[1=(#)x[0];
        :(enlist;(enlist),x[0][0])
      ];
      :x[0]
    ];
    :.z.s each x
  ];
  if[11h=tp;:enlist , x];
  if[99h=tp;:(!;.z.s key x;.z.s value x)];
  x 
 };

qpp:{[f]
  code:last (.)f;
  code:code[1+(!)((#)code)-2];
  code:parse code;
  code:defunc[code];
  code:"{",(xparse code),"}";
  value code
 };
