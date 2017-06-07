
# Sistemas de Inteligencia Artificial 
## Trabajo Práctico 3 
## Algoritmos Genéticos 
               
### Manual de uso 

El proyecto fue implementado utilizando GNU Octave 4.2.1 y Geometry 3.0.0.  Para utilizar el proyecto, se requiere
un interprete de Octave, y el paquete Geometry, para poder crear los gráficos de datos.

Para instalar octave en Ubuntu, utilizar el siguiente comando:
```bash
$ sudo apt-get install octave
```

Para instalar el paquete geometry en la consola de octave ejecutar:
```bash
$ octave> pkg install -forge geometry
```
Una vez instalado ejecutar la función Main en /src. Antes de la ejecución se deberá parametrizar el archivo de configuración, el cual permitirá elegir el modo de corrida, métodos de selección, de cruza y de reemplazo, así como también criterios de corte, todos ellos detallados en el informe (/docs/informe.pdf).

## Archivo de configuración

El archivo de configuración _configuration.txt_ sigue el formato nombreDeCampo=valor siendo los campos y los valores esperados los detallados a continuación: 

Parámetro | Valor/es | Uso
------------ | ------------- | -------------
debug       | t-f               | Modo debug activado
test        | t-f              | Modo test activado
hybridWithPartitions       | t-f               | Utilización de particiones activado en la elección de población para el blending
N       | [int 0-]              | Tamaño de la población
k       | [int 0-N]              | Número de individuos tomados al azar para la selecciñon
pm       | [double 0-1]               |Probabilidad de mutación
pc       | [double 0-1]               |Probabilidad de cruza
m       | [int 0-N]               | Individuos a tomar al azar en la población para selección por torneos determístoca
cutCondition       | maxGenerations-mixed-structure-content-bestSolution              | Condición de corte del algoritmo
contentPreviousIndexToCompare       | [int 0-]              | Cantidad de generaciones previas con cuya población se comparará con la actual para ver el cambio en el fitness del máximo individo 
structureMaxMatchPercentage       | [double 0-1]              | Máximo porcentaje de match entre dos poblaciones para considerar que no hubo cambio estructural
bestSolutionFitness       | [int 0-]              | Fitness de la mejor solución
maxGenerations       | [int 0-]               | Máxima cantidad de generaciones hasta la que el algoritmo debe procesar
crossoverMethod       | uniform-anular-twoPoints-onePoint              | Método de cruza
replacementMethod       |r2-r3              | Método de reemplazo
selectionBlend       | [double 0-1]               | Porcentaje de mezcla entre el método de selección 1 y 2
selectionMethod1       | ranking-roulette-elite-universal-boltzmann-deterministicTournament-probabilisticTournament              | Método de selección
selectionMethod2       | ranking-roulette-elite-universal-boltzmann-deterministicTournament-probabilisticTournament               | Método de selección
selectionBlend2       |[double 0-1]                | Porcentaje de mezcla entre el método de selección 3 y 4
selectionMethod3       | ranking-roulette-elite-universal-boltzmann-deterministicTournament-probabilisticTournament               | Método de selección
selectionMethod4       | ranking-roulette-elite-universal-boltzmann-deterministicTournament-probabilisticTournament               | Método de selección
temperature       |               | Temperatura para el cálculo de Boltzmann
className       | assasin1-assasin2-assasin3-defensor1-defensor2-warrior1-warrior2-warrior3-archer1-archer2-archer3                | Nombre de clase asociado al personaje
fitnessConst1       | [double 0-1]               | Constante de ataque del personaje
fitnessConst2       |[double 0-1]               | Constante de defensa del personaje

## Ejecución

La forma de correr el algoritmo dado un conjunto de configuraciones es: 

```octave
$ octave> main
```

Adicionalmente esta función se puede correr indicando un path a un archivo de configuración y un nombre de archivo de salida como parámetros:


```octave
$ octave> main(./configuration.txt,output)
```
