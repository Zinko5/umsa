Quiero hacer un trabajo/proyecto de [x].

El documento, informe, presentación o documentación del trabajo debe estar escrito en un documento doc.typ de Typst.

Necesito que generes el código de Typst que tendrá el documento. Te pediré que generes fragmentos de código de Typst que yo colocaré en el archivo.typ así que deben tener continuidad. En cada nuevo mensaje, te indicaré qué contenido debe tener el fragmento de código Typst que generarás y me pasarás.

En el documento, se es posible que se deban realizar algunos cálculos numéricos u otros procedimientos científicos, si ese es el caso, te pasaré algunos apuntes teóricos, ejemplos, guías, pautas y/o instrucciones de lo que quiero que hagas y debes responder con el fragmento de código de Typst aplicando las fuentes a mi trabajo, cumpliendo sus requerimientos.

No hagas justificaciones matemáticas ni demostraciones de las fórmulas. Solo realiza el procedimiento paso por paso aplicando lo que digan las fuentes. 

Al momento de anotar ecuaciones, no expliques cosas básicas, es un trabajo universitario, no una clase de guía o texto educativo básico, igue las reglas que aplicarías a un paper matemático científico:

La resolución de ejercicios debe ser comprensible para el lector (que se asume tiene conocimientos del tema, pero no necesariamente conoce todos los detalles de tu enfoque). Por lo tanto, no siempre es necesario desglosar cada paso de forma exhaustiva, pero sí debes proporcionar suficiente detalle para que el razonamiento sea reproducible. Aquí algunos principios clave:

```txt
Explicar el contexto: Antes de resolver un ejercicio, introduce brevemente el problema, la fórmula o el método que usarás. Por ejemplo: "Para resolver la ecuación diferencial, aplicaremos el método de separación de variables."
Mostrar pasos clave: No es necesario detallar cada operación aritmética, pero sí los pasos lógicos importantes (por ejemplo, cómo llegas de una ecuación a otra, o por qué aplicas una fórmula específica).
Justificar decisiones: Si aplicas una fórmula o teorema, menciona por qué es válido en el contexto (p.ej., "Por el teorema de Pitágoras, dado que el triángulo es rectángulo...").
Evitar redundancia: En papers profesionales, se omite el detalle excesivo de cálculos triviales para mantener la concisión, pero sin sacrificar claridad.
```

Las ecuaciones mostrando los cálculos no deben saltar directamente al resultado, sino mostrar el desgloce paso por paso, de manera formal y vigorosa matemática y científicamente. Lo mínimo es que cuando apliques una fórmula, primero escribas la fórmula y después reemplaces las variables por sus valores reales (las variables en Typst) antes de mostrar el resultado, esto no aplica para sumatorias ni productorias, pero sí para cualquier función o fórmula definida en las fuentes.

Los fragmentos de codigo que me pasaras solo deben ser eso, fragmentos, yo lo uniré todo después, así que que sepas que los fragmentos que envíes tendrán continuidad. Debes pasármelos en un bloque de código de Typst.

Debes usar correctamente la sintaxis de Typst para escribir las fórmulas, no intentes hacerlo como si fuera en LaTeX, la sintaxis es muy distinta.

Revisa la documentacion en internet para no equivocarte en la sintaxis y no uses recursos como por ejemplo `bold()` o `mat()` que no aparezcan en las fuentes.

Tampoco introduzcas nuevos índices ni títulos con `=` a no ser que yo te lo indique directamente.

Para realizar los cálculos numéricos, hazlos usando la función de typst `#calc`, esta es su documentación:

https://typst.app/docs/reference/foundations/calc/

No uses cosas que no están dentro de `calc`, por ejemplo, no existe `calc.sum` ni `calc.add`. Para operaciones básicas como suma, resta, multiplicación y división, se hacen simplemente con `#calc.round(x + y, digits: 4)`, `#calc.round(x - y, digits: 4)`, `#calc.round(x * y, digits: 4)`, `#calc.round(x / y, digits: 4)`.

Otras consideraciones útiles en las ecuaciones de Typst son:
- escribir letras seguidas de otras letras o números, puesto que solo van juntas si forman un símbolo o una variable definida con `#let`, por ejemplo, $xa$ resulta en un error, ya que no existe un símbolo matemático 'xa', sino que para anotar solo las letras, lo correcto sería escribir `$x a$` separadas por un espacio.
- Al momento de escribir texto dentro de un bloque de ecuación, se hace simplemente escribiendo el texto entre comillas. Ejemplo: `$a = c + b "es la ecuación."$` es un uso correcto del texto dentro de una ecuación.
- A diferencia de LaTeX, en Typst se usan los paréntesis simples `()` en lugar de los corchetes para agrupar cosas, por ejemplo: `$sum_(i = 1)^n x_(i 1) x_(i 2)$` es un uso correcto de los paréntesis para agrupar.
- A diferencia de LaTeX, en Typst las fracciones se anotan con el símbolo `/`, aprovechando las agrupaciones con paréntesis. Por ejemplo: `x = (2x^(n - 1))/(a + b - c) + 1/(n - 1)` es un uso correcto de las fracciones en Typst.
- Al momento de aplicar un símbolo de tipo acento en Typst como `$overline()$`, `$hat()$` o  `$sqrt()$`, no se le puede pasar unicamente una variable, sino que debe ser al menos una cosa que no sea una variable, aunque sea un texto vacío `""`. Por ejemplo, si se define la variable `$#let a = 2$`, el resultado de `$sqrt(#a)$` es erróneo, en cambio, se puede arreglar pasando `$sqrt(#a"")$`, cuyo resultado es correcto y no afecta en nada a la ecuación. Siguiendo el mismo ejemplo, colocar: `$sqrt(#a prop #a)$` también sería correcto, ya que además de la variable `#a`, se está pasando otra cosa (un símbolo `prop`).

No hagas calculos internos con python para comprobar los números, solo se mostrarán los resultados obtenidos con la función `#calc` de Typst.

Repito, tu no hagas calculos de ningun tipo, todos los calculos se haran con `#calc`, así que sólo maneja bien las variables.

Usa variables de Typst aplicando la función `#let` (recuerda que tendrán continuidad con tus siguientes fragmentos de código) para los cálculos, que tendrás que mostrar en ecuaciones de Typst paso a paso.

Cuando muestres resultados numéricos, que tengan solo cuatro decimales.

Al momento de nombrar a las variables que crees con `#let`, nómbralas usando camelCase.

Evita escribir los valores numéricos manualmente, siempre que se pueda usa la función `#calc` para tener presición perfecta, o usa una variable `#let` si el valor numérico se repite varias veces a lo largo del documento.

---

En el documento, es posible que se deban justificar cosas teóricas de programación, si ese es el caso, debes investigar en internet y usar tu conocimiento para explicar qué es cada cosa de programación que sea avanzada también es posible que te pase consideraciones del código. Por ejemplo, no debes explicar qué es un lenguaje popular como Python o Java, pero sí deberías explicar un lenguaje menos conocido como R. No debes explicar conceptos básicos del código, como estructuras de bucle o declaraciones de variables, pero sí deberías explicar aplicaciones de funciones de librerías complejas

Cuando expliques una parte del código, menciónala explícitamente a través del modo raw que ofrece Typst, que pueden ser tanto en línea con \` \`, o en un bloque separado:
\`\`\`[lenguaje]
[código]
\`\`\`

Cuando menciones nombres de archivos, variables o funciones, házlo en notación de raw text \`\`, por ejemplo: "en el archivo `corpus.txt` se almacena el corpus".

--- 

Te pasaré la primera instrucción y la primera tanda de fuentes que quiero que uses para aplicarlas al trabajo.

Instrucción:

[x]

---

Fuentes o consideraciones:

[x]

---

Recuerda que debes responder sólo el fragmento de código que formará parte del documento.
