xparse:{
  tp:type x;
  if[0h=tp;
    if[1=(#)x;:"(,)",(xparse x[0])];
    :"(",(string(*)x),")[",(";"sv xparse each 1_x),"]"
  ];
  if[11h=tp;
    if[1=(#)x;:"`",string (*)x];
  ];
  if[-11h=tp;:string x];
  if[0<tp;:"(",(";"sv .Q.s1 each x),")"];
  :.Q.s1 x
 };
