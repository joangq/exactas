# Trabajo Práctico 1 • Especificación

Éste proyecto tiene los archivos fuente del código en LaTeX que usamos para entregar la resolución al trabajo práctico. En éste, se pide dar el Tipo Abstracto de Dato (TAD) que especifica formalmente el comportamiento descrito por el siguiente enunciado.

## Enunciado

[[Ver enunciado completo]](./enunciado.pdf)

La organización del reconocido festival internacional Lollapatuza nos encomendó realizar el sistema para el manejo centralizado de la comida.

El sistema Lollapatuza debe contar con varios Puestos de Comida. Estos puestos cuentan con un Menú y un Stock de Ítems a vender. El Menú indica el precio de cada uno de estos Ítems. Por política de la organización, se permite que dos puestos vendan un mismo Ítem, pero solo si lo venden al mismo precio. El Stock indica la cantidad que tiene el local de cada uno de los Ítems.El local solo puede vender los Ítems de su Menú que tiene disponibles en su Stock.
Cada persona, al pasar por la caja del Puesto de Comida, puede comprar varios Ítems. Cada Puesto de Comida puede decidir implementar promociones, de la forma “Comprando N o más cantidad del Ítem I, te hacemos X % de descuento en esos Ítems”. Para una misma cantidad y un mismo Ítem, debe haber un único descuento, pero puede haber distintos descuentos para distintas cantidades de un mismo Ítem. En este caso, siempre se toma el descuento de mayor N.

Lo que no sabíamos era que el grupo cuenta con un infiltrado. Justo antes de la entrega del TP, decidió incorporar la acción de hackear al sistema. Esta consiste en eliminar el consumo de un Ítem dado a una Persona determinada, de alguna compra en la que NO se le haya aplicado un descuento a este Ítem. Esta persona debería haber comprado al menos una vez dicho Ítem sin que le aplique un descuento. De existir el consumo en múltiples puestos de comida, se eliminará el mismo de alguno de ellos, viéndose afectado su Stock.

Por último, el sistema Lollapatuza debe permitir ver todas las Personas que están habilitadas para realizar compras, y ver quién fue la Persona que más plata gastó. En caso de empate, se informará cualquiera de las Personas con más gastos.

## Organización del Proyecto

El archivo principal es `main.tex`. Como usamos distintos TADs para especificar el comportamiento descrito en el enunciado, separamos la escritura de cada uno en archivos distintos, los cuales se encuentran en la carpeta `tads/`.

Como en éstas especificaciones formales largas a veces es cómodo poder volver a ver la definición de un Tipo o una Función, quisimos usar `hyperrefs` (enlaces) a las mismas en cada uso. Para poder hacer esto de forma sostenible, automatizamos la creación de hyperrefs.

Creamos y usamos las siguientes macros:

```tex
% Para definiciones con paréntesis
\newcommand{\crearLabel}[1]{%
   \expandafter\newcommand\csname #1\endcsname[1]{%
        \ifx\empty##1\empty%
            \hyperref[#1]{\text{#1}}%
        \else%
            \hyperref[#1]{\text{#1}}(##1)%
        \fi%
   }%
}

% Para textos sin procesar
\newcommand{\crearLabelText}[3]{%
    \expandafter\newcommand\csname #2\endcsname{\hyperref[#1]{\text{#3}}}%
}

% Para utilizar con hyperref (tadOperacion)
\newcommand{\myTadOperacion}[4]{\phantomsection\tadOperacion{#1}{#2}{#3}{#4}\label{#1}}

% Para utilizar con hyperref (tadNombre)
\newcommand{\crearTadNombre}[1]{\phantomsection\tadNombre{#1}\label{#1}}
```

Por ejemplo, destacamos los siguientes usos:

```tex
% main.tex
\crearLabelText{Lollapatuza}{Lollapatuza}{\tadNombre{Lollapatuza}}
\crearLabelText{Lollapatuza}{lollapatuza}{\text{lollapatuza}}

\crearLabel{compraventa}
\crearLabel{eliminarConsumo}

% tads/lollapatuza.tad.tex

% ...
\begin{tad}{\crearTadNombre{Lollapatuza}}
% ...
\myTadOperacion{compraventa}{\text{lollapatuza}/F,\text{puesto}/P, \text{persona}/p, \text{compra}/c }
             {\lollapatuza}{
             $p \in \genteEn{F} \\
            \land P \in \puestosDe{F} \\%
            \land\;\compraValida{}?(\puestoDe{c}, c)$
             }

\myTadOperacion{eliminarConsumo}{lollapatuza \, F, persona \, p, item \, i}{lollapatuza}{}
                \vspace{-7mm}
                 \begin{align*}
                    \RaggedRight
                     &\{p \in \text{genteEn(F)}\, \land\\
                     &(\exists c: compra) (\\
                     &\espacio{2} \text{está?}(c, \comprasDe{p}) \\
                     &\espacio{2} \yluego \itemDe{c} \igobs i \\
                     &\espacio{2} \land \,\gastoDe{c} \igobs \precioSinDescDe{\puestosDe{F}, i} * \cantidadDe{c} \\
                     &)\}
                 \end{align*}
                 
             }
% ...
```

Ésto funciona porque `\myTadOperacion` y `\crearTadNombre` se expanden a código que crea una label en donde fue utilizado, junto con una sección oculta (_phantom_) para que esté contenida en alguna sección válida. Luego las funciones `\crearLabel...` crean una macro con el nombre del parámetro que referencia una label del mismo nombre.

Luego, se puede usar simplemente `\eliminarConsumo`, `\compraventa`, `\lollapatuza` y `\Lollapatuza`. Y cada uno imprimirá en el documento el nombre del TAD o la función que le corresponda, con una referencia a su primera definición.


