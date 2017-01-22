input program.
loop t = 0 to 8 by 0.1.
end case.
end loop.
end file.
end input program.
execute.


do if (t < 0.999).
compute L_t = 0.2.
else if  (t < 2).
compute L_t = 0.4.
else if (t < 3).
compute L_t = 0.6.
else if (t < 4).
compute L_t = 0.8.
else.
compute L_t = 1. 
end if.
execute.

do if (t < 0.999).
compute S_t = exp(-L_t*t).
else if  (t < 2).
compute S_t = exp(-.2 -L_t*(t-1)).
else if (t < 3).
compute S_t = exp(-0.6 - L_t*(t-2)).
else if (t < 4).
compute S_t = exp(-1.2-L_t*(t-3)).
else.
compute S_t = exp(-2 - L_t*(t-4)). 
end if.
execute.

compute f_t = S_t*L_t.
execute.

GRAPH
  /LINE(SIMPLE)=VALUE(L_t) by t
  /TITLE='Hazard Function'.

GRAPH
  /LINE(SIMPLE)=VALUE(S_t) by t
  /TITLE='Survival Function'.

GRAPH
  /LINE(SIMPLE)=VALUE(f_t) by t
  /TITLE='Death Density Function'.
