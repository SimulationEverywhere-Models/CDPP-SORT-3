Esta es una version mejorada del mecanismo de ordenacion numerica sobre
automatas celulares, que actua en forma semejante a bubble sort.
A diferencia de la version anterior, este automata no es circular (nowrapped),
por lo que ya no es necesario tener elementos que representen limites para
poder ordenar en forma correcta.
Como no es circular, deberia especificarse un comportamiento apropiado para 
las celdas del borde, pero si estas no son especificadas, entonces la 
referencia a una celda fuera del automata dara como resultado un valor 
indefinido (?), lo que servira para imitar el caso de los limites de la 
version anterior.

Inicialmente el automata tiene los valores:

    x1 x2 x3 x4 ... xn
     1  ?  1  ? ...  s

donde: xi es un valor numerico (puede ser un entero o real).
        ? es usado por GadCelLa para representar un valor Indefinido.
        s es 1 o ? dependiento de la cantidad de elementos a ordenar.
            Si n es par, entonces s = ?.
            Si n es impar, entonces s = 1.

Por ejemplo, si queremos ordenar los 7 numeros: 4, 7, 14, -4, 2, 0 y 3 debemos
inicializar un atomata celular de 2x7 como:

    4  7 14 -4  2  0  3
    1  ?  1  ?  1  ?  1

Los valores de la segunda fila indican contra quien se realizaran las
comparaciones. Si debajo de uno de los valores a ordenar se encuentra un
1 significa que sera comparado y ordenado con respecto al valor ubicado a la
derecha de este. Por otra parte, si el valor es ? significa que sera ordenado
con respecto al valor ubicado a la izquierda del mismo.

Por lo tanto, en el primer paso se ordenaran los pares (4,7) (14, -4) (2,0)
y el ultimo elemento (3) como no tiene mas elementos a su derecha no sera
ordenado en este paso.

Los pares ordenados son (4,7) (-4, 14) (0,2).
El automata resultante sera:

    4  7 -4 14  0  2  3
    ?  1  ?  1  ?  1  ?

Notemos que los valores de la segunda fila que estan debajo de un numero, han
cambiado (los que eran ? ahora son 1 y viceversa). Esto significa que en el 
proximo paso se crearan nuevos pares para las respectivas comparaciones.

En el segundo paso, los pares a ordenar son: (7, -4) (14, 0) (2, 3). El primer
elemento (4) como tiene debajo un ? debe compararse con el elemento de la
izquierda, pero como este es un ? (pues se esta referenciando a una celda
no definida por el automata) significa que no debe realizarse una ordenacion
de este elemento en este paso.

Los pares ordenados son (-4, 7) (0, 14) (2, 3).
El automata resultante sera:

    4 -4  7  0 14  2  3
    1  ?  1  ?  1  ?  1

Como vemos, los elementos de la segunda fila debajo de un valor numerico han
cambiado nuevamente, para armar nuevos pares en el proximo paso.

El automata sigue realizando pasos en forma infinita, debido a que por mas
que no se realicen cambios en los pares una vez que se encuentran ordenados
correctamente todos los numeros, los elementos de la segunda fila siguen
cambiando de valor en cada paso. Es por esto que para que finalice la ejecucion
debe asignarse un tiempo maximo de simulacion. Este tiempo puede ser corto
para ordenar ciertos numeros, debido a la cantidad de columnas del automata.
Si se verifica que la simulacion finalizo pero los numeros aun no han sido
totalmente ordenados, debe incrementarse el tiempo de simulacion.
