% -------------------------------------------------------
%  Ejemplo de la diferencia en la salida en las notaciones de Nielsen 
%  y de Qiskit
%-------------------------------------------------------------------

% Ejemplo 1 Notacion Qiskit
% --------------------------------------------------------------
%    Qubit_0 ------H ----0-------
%    Qubit_1 -----------CNOT -----
% --------------------------------------------------------------
clc;
% Notación vector columna
Qubit_0 = [ 1 0]' ;  %  |0>
Qubit_1 = [ 1 0]' ;  %  |0>

fprintf (' q0=|0> : \n');
display(Qubit_0);
fprintf (' q1=|0> : \n');
display(Qubit_1);

entrada00 = kron(Qubit_1, Qubit_0);  % |00> = |0> (x) |0>

% Puertas cuánticas

I = [ 1 0 
      0 1 ];
H= 1/sqrt(2) * [1 1
                1 -1];
CNOT = [ 1 0 0 0 
         0 0 0 1 
         0 0 1 0
         0 1 0 0 ];
%Puerta CNOT correspondienta a qiskit con q0 bit de control :
% |q1q0> CNOT |q1'q0'>
% |00>   --->  |00>
% |01>   --->  |11>
% |10>   --->  |10>
% |11>   --->  |01>

% Calculamos los operadores parciales del circuito
U1 = kron (I,H); % I|q1> (x) H|q0> = I (x) H |q1q0>
fprintf ('Operador Unitario equivalente a I|q1> (x) H|q0> = I (x) H |q1q0>: \n');
disp(U1);
disp(CNOT);  % CNOT correspondiente a qiskit    
%
U = CNOT*U1;          % orden matrices al multiplicar desde el final al principio del circuito
%U = CNOT*kron (I,H);  % es euivalente a CNOT * U1
fprintf ('Qubit_0 ------H-----0-------\nQubit_1 -----------CNOT-----\n\n');
fprintf ('U es el operador Unitario equivalente a todo el circuito: \n');
display(U);

salida00 = U*entrada00;
%fprintf ('Salida : \n');
display(salida00);  % En este caso la salida es la misma en Qiskit y en Nielsen  

fprintf ('=======================================================\n');

Qubit_0 = [ 0 1]' ;  %  |1>
Qubit_1 = [ 1 0]' ;  %  |0>
entrada01 = kron(Qubit_1, Qubit_0);  % |01> = |0> Xt |1>

%fprintf (' Entrada|01> : \n');
display(entrada01);
display(U);
salida01 = U*entrada01;
display(salida01);

fprintf ('=======================================================\n');

Qubit_0 = [ 1 0]' ;  %  |0>
Qubit_1 = [ 0 1]' ;  %  |1>
entrada10 = kron(Qubit_1, Qubit_0);  % |10> = |1> Xt |0>

%fprintf (' Entrada|01> : \n');
display(entrada10);
display(U);
salida10 = U*entrada10;
display(salida10);

fprintf ('=======================================================\n');

Qubit_0 = [ 0 1]' ;  %  |1>
Qubit_1 = [ 0 1]' ;  %  |1>
entrada11 = kron(Qubit_1, Qubit_0);  % |11> = |1> Xt |1>

%fprintf (' Entrada|01> : \n');
display(entrada11);
display(U);
salida11 = U*entrada11;
display(salida11);   % En este caso la salida es la misma en Qiskit y en Nielsen  