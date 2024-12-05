= Starting
Starting typing in Typst is easy.
You don't need packages or other weird things for most of things.

Blank line will move text to a new paragraph.

Btw, you can use any language and unicode symbols
without any problems as long as the font supports it: ßçœ̃ɛ̃ø∀αβёыა😆…
= Markup

This was a heading. Number of `=` in font of name corresponds to heading level.

== Second level heading

Okay, let's move to _emphasis_ and *bold* text.

Markup syntax is generally similar to `AsciiDoc` (this was `raw` for monospace text!)

= New lines & Escaping

You can break \
line anywhere you \
want using "\\" symbol.

Also you can use that symbol to escape \_all the symbols you want\_,
if you don't want it to be interpreted as markup or others special symbols.

= Comments & codeblocks

You can write comments with `//` and `/* comment */`:
// Like this
/* Or even like
this */

```typ
Just in case you didn't read the source, this is how it is written:

// Like this
/* Or even like
this */

By the way, I'm writing it all in a _fenced code block_ with *syntax highlighting*!
```
= Smart quotes

== What else?

There are no much things in basic "markup" syntax, but we will see much more interesting things very soon!
I hope you noticed auto-matched "smart quotes" there.

= Lists

- Writing list in a ssimple way is great.
- Nothing complex, start your points with `-` and this will become a list.
 - Indented lists are created via indentation.

 + Numbered lists star with `+` instead of `-`.
 + There is no alternative markup syntax for lists
 + So just remember `-` and `+`, all other symbols wouldn't work in an unintended way.
  + That is a general property of Typst's markup.
  + Unlike Markdown, there is only one way to write something with it.

== Notice

Typst numbered lists differ from markdown-like syntax for lists. If you write them by hand, numbering is preserved:

1. Apple
1. Orange
1. Peach

= Math

I will hist mention math ($a + b/c = sum_1 x^i$)
is possible and quite pretty there:

$
7.32 beta +
  sum_(i=0)^nabla
    (Q_i (a_i - epsilon)) / 2
$

To learn more about math, see corresponding chapter.

= Functions

Okay, let's now move to more complex things.

First of all, there are *lots of magic* in Typst.
And it major part of it is called "scripting".

To go to scripting mode, type `#` and *some funcion name* after that. We will start with _something dull_:

#lorem(50)

_That *function* just generated 50 "Lorem Ipsum" words!_

= More functions

#underline[functions can do everything!]

#text(orange)[L]ike #text(size: 0.8em)[Really] #sub[E]verything
#figure(
  caption: [This is an imaginary screenshot from one of first theses written in Typst. \ _All these things are written with #text(blue)[custom functions] too._], image("a.png", width: 80%)
)

= How to call functions

First, stat with `#`. Then write the name.
Finally, write some parentheses and maybe something inside.

You can navigate lots of built-in functions in #link("https://typst.app/docs/reference/")[Official Reference].

#quote(block: true, attribution: "Typst Examples Book")[
  That's right, links, quotes and lots of other document elements are created with functions.
]

= Function arguments

There are _two types_ of function arguments:

+ *Positional.* Like `50` in `lorem(50)`.
  Just write them in parentheses and it will be okay.
  If you have many, use commas.
+ *Named.* Like in `#quote(attibution: "Whoever")`.
  Write the value after a name and a colon.

If argument is named, it has some _default value_.
To find out what it is, see #link("https://typst.app/docs/reference/")[Official Typst Reference].

// #heading(level: 2)[#text(blue)[Extra: Types/modes in Typst]] Hace lo mismo que:
#heading(level: 2, text(blue)[Extra: Types/modes in Typst])
// ^ Aquí, "text(blue)[Extra: Types/modes in Typst]" es el argumento "body" de heading
// Nótese que en heading, "level" es un argumento nombrado y "body", uno posicional
- Math
- Content
- Script

= Content

The most "universal" type un Typst language is *content*. Everything you write in the document becomes content.

#[
  But you can explicitly create it with _scripting mode_ and *square brackets*.

  There, in square brackets, you can use any markup functions or whatever you want.
]

= Markup and code modes

When you use `#`, you are "switching" to code mode.
When you use `[]`, you turn back:

// +-- going from markup (the default mode) to scripting for that function
// |                 +-- scripting modeL calling `text`, the last argument is markup
// |     first arg   |
// v     vvvvvvvvvv  vvvv
   #rect(width: 5cm, text(red)[hello *world*])

= Passing content into functions

So what are these suare brackets after funcionts?

If you *write content rifht after function, it will be passed as positional arguments there*.

#quote(block: true)[
  So #text(red)[_that_] allows me to write _literally_ anything in things
]