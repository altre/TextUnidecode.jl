# text_unidecode

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://altre.github.io/text-unidecode.jl/stable)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://altre.github.io/text-unidecode.jl/dev)
[![Build Status](https://travis-ci.com/altre/text-unidecode.jl.svg?branch=master)](https://travis-ci.com/altre/text-unidecode.jl)
[![Coveralls](https://coveralls.io/repos/github/altre/text-unidecode.jl/badge.svg?branch=master)](https://coveralls.io/github/altre/text-unidecode.jl?branch=master)

Convert non-ascii characters to "good enough" ascii.
```
julia> unidecode("南无阿弥陀佛")
"Nan Wu A Mi Tuo Fo"

julia> unidecode("あみだにょらい")
amidaniyorai
```

## References
This package is a more or less direct port of the java package [unidecode](https://github.com/xuender/unidecode) which in turn is probably one of many
ports of the Perl Package [Text::Unidecode](https://metacpan.org/pod/Text::Unidecode) by Sean M. Burke.

The similarly named julia package [Unidecode](https://github.com/matthieugomez/Unidecode.jl) solves a different problem: Re-converting autocompleted Latex or Emoji back to
the original UTF-8 string.