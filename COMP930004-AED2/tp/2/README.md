# Trabajo Práctico 2 • Diseño

Éste proyecto tiene los archivos fuente del código en LaTeX que usamos para entregar la resolución al trabajo práctico. En éste, se pide elegir las estructuras que permitan representar la [especificación](./especificacion.pdf) del festival ficticio descrito en el [trabajo práctico anterior](../1/). Las mismas deben contar con su funciones de abstracción e invariante de representación. Además, dada la descripción de una interfaz, se debe dar un pseudocódigo que utilice las estructuras elegidas para cumplir con las cotas de complejidad de las operaciones de la misma.

## Enunciado

[[Ver enunciado completo]](./enunciado.pdf)

Diseñar módulos para implementar el sistema _Lollapatuza_, conforme a la [especificación](./especificacion.pdf). Se deben proveer las siguientes operaciones, con las complejidades temporales en **peor caso** indicadas. Usamos las siguientes variables:

- A - Cantidad de Personas.
- I - Cantidad Total de Ítems en todo el Festival.
- P - Cantidad de Puestos.

### Operaciones

#### Módulo Lollapatuza

1) Iniciar un nuevo sistema. 
2) Registrar una compra. $O(\log A + \log I + \log P + \log \text{cant} )$
3) Hackear un ítem consumido por una persona. $O(\log A + \log I)$
4) Obtener el gasto total de una persona. $O(\log A)$
5) Obtener la persona que más dinero gastó. $O(1)$
6) Dado un ítem, obtener el puesto que tenga menor stock del mismo.
7) Conocer la información general del sistema:
    - Obtener las personas. $O(1)$
    - Obtener los puestos de comidas. $O(1)$
8) Otras operaciones que sean convenientes para el módulo no tienen cota de complejidad.

#### Módulo Puesto de Comida

1) Inicializar un nuevo puesto.
2) Obtener el stock de un ítem. $O(\log I)$
3) Obtener el descuento de un ítem para una cantidad. $O(\log I + \log cant)$
4) Obtener el gasto realizado por una persona. $O(\log A)$
5) Otras operaciones que sean convenientes para el módulo no tienen cota de complejidad.

## Organización del Proyecto

El archivo principal es `main.tex`. En ésta ocasión agrupamos mejor (en relación al TP1) los archivos. Aquellos provistos por la cátedra se encuentran en la carpeta `aed2/`, y cada módulo se encuentra en `/files`. Nuestras definiciones de macros propias están en `davinci.sty`.

Para mantener la facilidad de la escritura (y lectura) del código, hicimos macros que automatizan la creación de otras macros. En particular, `\tipoImperativo{arg}` y `\funcionImperativa{arg}` crean alguna macro `\arg` cuya definición está fijada por cada función. Por ejemplo:


#### Tipo Imperativo `tupla`
```tex
% Toma un parámetro (#1) y crea un comando que tiene de nombre al parámetro.
% El nuevo comando toma un argumento opcional (##1). Imprime el nombre del
% comando en monoespacio y, si el parámetro no fue nulo, lo pone con paréntesis.
\newcommand{\tipoImperativo}[1]{%
  % El newcommandx tiene nombre #1 y toma 1 parametro, 
  % y el parametro 1 es opcional con valor default nulo
  \expandafter\newcommandx\csname #1\endcsname[1][1]{%
    % Cuerpo del nuevo comando
    \mono{#1}\optionalParentheses[##1]%
  }%
}

\tipoImperativo{tupla}
```

#### Función Imperativa `MergeSort()`
```tex
% Toma un parámetro (#1) y crea un comando que tiene de nombre al parámetro.
% El nuevo comando toma un argumento opcional (##1). Imprime el nombre del
% comando en texto común y, si el parámetro no fue nulo, lo pone con paréntesis.
\newcommand{\funcionImperativa}[1]{%
  \expandafter\newcommandx\csname #1\endcsname[1][1]{%
    \text{#1}\optionalParentheses[##1]%
  }%
}

\funcionImperativa{MergeSort}
```

Luego podemos usar las nuevas macros como:

```tex
% Ejemplos tupla:
\tupla \\
\tupla{\texttt{int}} \\
\\

% Ejemplos MergeSort:

\MergeSort \\
A.\MergeSort{} \\
MergeSort{A} \\
```

El output generado es:

$$ 
\text{\texttt{tupla}} 
$$

$$ 
\text{\texttt{tupla(\texttt{int})}} 
$$

$$ 
\text{MergeSort} 
$$

$$ 
A.\text{MergeSort()} 
$$

$$
\text{MergeSort($A$)} 
$$



Teniendo ésto en cuenta, en `definiciones.tex` están todas las definiciones de funciones y tipos que usamos para escribir el trabajo.
