Custom Delphi Iterators
=======================

[This example](DelphiCustomIterators.dpr) demonstrates how to implement a
custom iterator in Delphi to be used with the `for in` loop.

We use `record` types instead of classes. Even though `System.IEnumerator` is
an `interface`, Delphi allows implementing enumerators as records, thus saving
both overhead from dynamic heap allocations and head aches from
freeing iterators.

This example is a modified version of [this
one](https://www.thedelphigeek.com/2007/03/fun-with-enumerators-part-6-generators.html).
