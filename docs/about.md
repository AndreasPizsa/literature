Documentation often lives a separate life from code, in separate files, stored away in folders. Yet very often prose can make code more comprehensible, while code can be more expressive than prose. They are equally important and should be equal partners.

Literature lets you write prose and code in the same file where they both live not just side by side but together as equal, complementary partners, and that’s A Good Thing.

Literature generalizes the idea of Literate CoffeeScript to just any language. It’s just Markdown with code blocks, except that the code blocks are intended to be executed. There are basically only three rules:

* Regular, unfenced code blocks are executable code
* Fenced code blocks are documentation. (That’s handy for usage examples)
* `.litjs` or `.js.md` will result in a `.js` file, `.litc` or `.c.md` will create a `.c` file, etc.
