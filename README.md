# file_concat

It's just a small tool to concatenate a few files.

---

Some times I need to concatenate several files. The easiest way to do it is to use

    cat file1 file2 ...

This tool do the same but it:

-   allows to specify input file with a list of files to concatenate

          file_concat.sh -if files_to_concat.txt

    or use it like this

          file_concat.sh file1 file2

-   allows to specify output file

          file_concat.sh file1 file2 -of out.txt

    If no parameter **_-of_**, the tool use standart stdout, so you can use also

          file_concat.sh -if files_to_concat.txt > out.txt

-   separates to files with empty line (the most important feature :-) )
-   allows to include file name before file content as a comment (useful in scripts; ex: SQL)

          file_concat.sh -cmt -- -if files_to_concat.txt

          --
          -- file1.sql
          --
              ...file1 content..

          --
          -- file2.sql
          --

              ...file2 content..

Not a big deal, of cause. Just a bit more useful.

---

P.S. files_to_concat.txt is just an example. You can use any other file name. There are only 2 rules:

-   every filename should be on new line
-   use absolute (preferable) or relative path regarding to location you're going to run the tool
