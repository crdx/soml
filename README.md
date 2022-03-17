# SOML

**SOML** is a simple output format intended to be readable but parseable. The primary goal is to keep long multiline strings readable when displayed next to simple values. A familiar heredoc-like syntax delimits the lengthy output.

## `SOML::Document`

A document is represented by a set of fields. Fields are separated with no more than one newline. Two new lines delimit multiple documents.

## `SOML::Field`

A field is represented by name and a value. A value can be a single line value or a value that spans multiple lines.

## Contributions

Open an [issue](https://github.com/crdx/soml/issues) or send a [pull request](https://github.com/crdx/soml/pulls).

## Licence

[MIT](LICENCE.md).
