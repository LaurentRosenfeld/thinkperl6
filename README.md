# thinkperl6

### Generating the PDF

The directory `book` contains the LaTeX sources needed to compile the book.
To recompile it, run the following command within the directory:
```
make
```
This command will create the directory `tmpDir` where you'll find the PDF (thinkperl6.pdf)
alonside other intermediate files created during the compilation process.

To move the created pdf to the directory `PDF` in the root directory, run:
```
make pdf
```

To remove `tmpDir`, run:
```
make clean
```
**Note**: The chances of a successful compilation increase if you have an almost
complete installation of a recent TeX Live distribution.

Also note that a PDF version is available (https://github.com/LaurentRosenfeld/thinkperl6/tree/master/PDF).

There are some Perl 6 examples of this book in the https://github.com/LaurentRosenfeld/thinkperl6/tree/master/Supplementary directory and a quite a bit of additional material on the Perl 6 language (conference talks, blog posts, etc.) in the 
https://github.com/LaurentRosenfeld/Perl-6-Miscellaneous directory.

