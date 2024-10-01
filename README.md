# Virtual Procs

In the [The Status Nim style guide](https://status-im.github.io/nim-style-guide/language.methods.html)
one can find the following advice:

> Use method sparingly - consider a "manual" vtable with proc closures instead.

As I am still pretty new to Nim, I still do not have proper intuition how this
actually should be done. The Nim way.

Here is some code, which is biased by my historical
experience with C++.

Some references:

- [Inheritance — virtual functions](http://www.dietmar-kuehl.de/mirror/c++-faq/virtual-functions.html)
