\l qpp.q

.q.f:{[x;y]
  0N!"Checking ",(.Q.s1 x);
  qx:qpp x;
  if[not[qx~y];'break];
 };

{functional select c from x} f {(?)[x;();0b;((,)c)!(,)c]};

{functional select from x where c=1} f {(?)[x;(,)(=;c;1);0b;()]};

{functional select by c from x} f {(?)[x;();((,)c)!(,)c;()]};

\\
