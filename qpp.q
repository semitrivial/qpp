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
  if[99h=tp;
    keyval:transform_keyval[key x;value x];
    :(!;keyval`key;keyval`val)
  ];
  x 
 };

transform_keyval:{[k;v]
  if[(`x~key) & (0h=type v) & (11h=type v[0]);
    :`key`val ! ((,)v[0];v[0])
  ];
  `key`val ! (strip_enlists k;strip_enlists v)
 };

qpp:{[f]
  code:last (.)f;
  code:code[1+(!)((#)code)-2];
  code:parse code;
  code:defunc[code];
  code:"{",(xparse code),"}";
  value code
 };
