materia(programacionavanzada).
materia(planeacionycontroldeproyectos).
materia(seguridadinformatica).
materia(solucionentelecomunicaciones).
materia(sistemasexpertos).
materia(trabajodegrado).
materia(ingles).

profesor(jeison).
profesor(luis).
profesor(senelis).
profesor(edgar).
profesor(adrian).
profesor(william).

dia(lunes).
dia(martes).
dia(miercoles).
dia(jueviernes).
dia(viernes).
dia(sabado).

sol(S):-
	write('HORARIO NOVENO SEMESTRE'),
    Profesores = [jeison,luis,senelis,edgar,adrian,william],
    Materias = 
	[programacionavanzada,planeacionycontroldeproyectos,
	seguridadinformatica,solucionentelecomunicaciones,
	sistemasexpertos,ingles],

    S = [[P0,M0,lunes],
	[P1,M1,martes],
	[P2,M2,miercoles],
	[P3,M3,jueves],
	[P4,M4,viernes],
	[P5,M5,sabado]],
    
    permutation([P0,P1,P2,P3,P4,P5],Profesores),
    permutation([M0,M1,M2,M3,M4,M5],Materias),   
    member([jeison,programacionavanzada,_],S),     
    despues([jeison,programacionavanzada,_],[_,planeacionycontroldeproyectos,_],S), 
    S = [Lunes|_],Lunes \= [luis,_,_], Lunes \= [_,planeacionycontroldeproyectos,_].
 
despues(X,Y,L):- append(_,[Y|R],L),member(X,R).

imparte(P,M):-
    profesor(P),materia(M),
    sol(S),
    member([P,M,_],S).

trabaja(P,D):-
    profesor(P),dia(D),
    sol(S),
    member([P,_,D],S).

clase(M,D):-
    materia(M),dia(D),
    sol(S),
    member([_,M,D],S).

   