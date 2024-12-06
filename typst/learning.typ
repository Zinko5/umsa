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
//  ^^^^                       ^^^^^^^^^^^^^ just a markup argument for `text`
//  |
//  +-- calling `rect` in scripting mode, with two arguments: width and other content

= Passing content into functions

So what are these suare brackets after funcionts?

If you *write content rifht after function, it will be passed as positional arguments there*.

#quote(block: true)[
  So #text(red)[_that_] allows me to write _literally anything in things
  I pass to #underline[functions]!_
]

= Passing content, part II

So, just to make it clear, when I write

```typ
- #text(red)[red text]
- #text([red text], red)
- #text("red text", red)
//      ^        ^
// Quotes there mean a plain string, not a content!
// This is just text
```

It all will result in a #text([red text], red)

#set page(width: 15cm, margin: (left: 4cm, right: 4cm))

= #text(stroke: 0.1mm, red)[Basic styling]
= Set rule
That was great, but using functions everywhere, especially with many arguments every time is awfully cumbersome.

That's why Typst has _rules_. No, not for you, for the document

#set par(justify: true)

And the first rule we will consider there is `set` rule.
As you see, I've just used it on `par` (which is short from paragraph) and now all paragraphs became _justified_.

It will apply to all paragraphs after the rule, but will work only in it's _scope_ (we will discuss them later).

#par(justify: false)[
  Of course you can override a `set` rule.
  This rule just sets the _default value_ of an argument of an element.
]

By the way, at first line of this snuppet
I've reduced page size to make justifyng more visible, also increasing margins to add blank space on left and right.

#set page(paper: "a4", margin: auto)
#set par(justify: false)

= A bit about length units

Before we continue with rules, we should talk about length. There are several absolute length units int Typst:

#set rect(height: 1em)

#table(
  columns: 2,
  [Points], rect(width: 72pt),
  [Milimeters], rect(width: 25.4mm),
  [Centimeters], rect(width: 2.54cm),
  [Inches], rect(width: 1in),
  [Relative to font size], rect(width: 6.5em)
)

`1 em` = current font size. \
It is a very convenient unit, so we are going to use it a lot

= Setting something else

#set box(
  inset: (x: 2pt, y: 0pt),
  outset: (x: 0pt, y: 2pt),
  stroke: black,
  fill: luma(91.18%),
  radius: 2pt
)

Of course, you can use #box[`set`] rule with all built-in functions and all their named arguments to make some argument "default".

For example, let's make all quoptes in this snippet authored by the book:

#set quote(block: true, attribution: [Typst Examples Book])

#quote[
  Typst is great!
]

#quote[
  The problem with quotes on the internet is that it is hard to verify their authenticity.
]

= Opinionated defaults

That allows you to set Typst default styling as you want it:

#set par(justify: true)
#set list(indent: 1em)
#set enum(indent: 1em)
#set page(numbering: "1")

- List item
- List item

+ Enum item
+ Enum item

Don't complain about bad defaults! #box[Set] your own.

= Numbering

Some of elements have a property called "numbering". They accept so-called "numbering patterns" and are very useful width set rules. Let's see what I mean.

#set heading(numbering: "I.1:")

= This is first level
= Another first
== Second
== Another Second
=== Now third
== And second again
= Now returning to first
= These are actual romanian numerals

Of course, there are lots of other cool propierties that can be _set_, so feel free to dive into #link("https://typst.app/docs/reference/")[#text(rgb("#387fdb"))[Official Reference]] and explore them!

And now we are moving into something much more interesting...
