\l xparse.q

defunc:{[x;vars]
  if[break x;
    if[`functional~(*)x;
      :(x[1][0]),strip_enlists[;vars] each 1_x[1]
    ];
    :((,)(*)x) , .z.s[;vars] each 1_x;
  ];
  x
 };

strip_enlists:{[x;vars]
  tp:type x;
  if[0h=tp;
    if[1=(#)x;
      if[1=(#)x[0];
        :(enlist;(enlist),x[0][0])
      ];
      :x[0]
    ];
    :.z.s[;vars] each x
  ];
  if[11h=tp;:enlist , x];
  if[99h=tp;:(!;.z.s[;vars] key x;.z.s[;vars] value x)];
  x 
 };

qpp:{[f]
  val:(.)f;
  vars:val[1];
  code:last val;
  code:code[1+(!)((#)code)-2];
  code:parse code;
  code:defunc[code;vars];
  code:"{",(xparse code),"}";
  value code
 };
