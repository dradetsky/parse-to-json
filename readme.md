parse-to-json
=============

A quick and dirty lisp-to-json parser by leveraging the actual lisp
parser.

building
--------

Install `cl-json` via quickload (`(ql:quickload "cl-json")`), then run
`./prep.sh` to make this available for building. Then run `./build.sh`
to build the `parse-to-json` ecl executable.

usage notes
-----------

It works (in theory) like

```shell
cat some-file.lisp | ./parse-to-json
```

This probably won't be of any use by itself. It's designed to be used
with a preprocessing step to prevent it from barfing on a number of
forms which can't be parsed in isolation such as:

0. Symbols in packages: `foo:bar` where the foo package has not aready
   been processed (for example, because it's in another file.

1. The sharpdot reader macro: `#.(some-fn some-arg)`

As of 2019-05-19, this preprocessing code has not been packaged and
published. Not that it's particularly complicated. Basically, some
Python code performs the preprocessing, and then invokes the
executable as a subprocess.

code notes
----------

Any real lisp programmers reviewing this code will probably note that
the build system is not set up anything like the way anybody who knows
how to do lisp would do it to cut executables. You're right. I'm out
of practice with lisp, and I haven't had time to refamiliarize myself
with how it ought to be done.

background
----------

I needed a way to parse lisp into some kind structured data.
Originally, I used a Python LALR parser to produce Python
lists-of-lists. This seemed like a simpler solution.
