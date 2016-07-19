\l qpp.q

.q.f:{[x;y]
  qx:qpp x;
  if[qx~y; 0N!"Checking ",(.Q.s1 x),": Success";:(::)];
  X::x;
  Y::y;
  raise
 };

{functional select c from x} f {(?)[x;();0b;(!)[(enlist)[c];(enlist)[c]]]};

{functional select from x where c=1} f {(?)[x;(enlist)enlist[=;c;1];0b;()]};

\\
