\l xparse.q

f:{[x]
  if[-10h=type x;x:(,)x];
  X1:value x;
  X2:value xparse parse x;
  if[not[X1~X2];raise];
  0N!"Testing <<",x,">>: Success";
 };

tbl:([]c1:1 2 3;c2:4 5 6);
ktbl:([id:1 2 3]c1:4 5 6; c2:7 8 9);
fnc:{x*x}

f "1";
f each ("0b";"0xff";"0h";"0i";"0j";"0e";"0f");
f "1 2";
f "`x";
f "`a`b";
f "([]1 2 3)";
f "([]c:1 2 3)";
f "([]a:1 2;b:3 4)";
f "([a:1 2 3; b:4 5 6]c:7 8 9; d:10 11 12)";
f "select from tbl";
f "select c1 from tbl";
f "select c1,c2 from tbl";
f "select price:c1, qty:c2 from tbl";
f "select price:c1+c2, qty:c1*c2 from tbl";
f "select c1 by c2 from tbl";
f "select foo:c1+c2 by bar:fnc[c1-c2] from tbl";
f "select from tbl where i>0";
f "select from tbl where i>0, c1>0";

value "\\\\";
