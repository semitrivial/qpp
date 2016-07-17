\l xparse.q

f:{[x]
  if[-10h=type x;x:(,)x];
  X1:value x;
  X2:value xparse parse x;
  if[not[X1~X2];raise]
  0N!"Testing <<",x,">>: Success";
 };

f "1";
f "1 2";
f "`x";

value "\\\\";
