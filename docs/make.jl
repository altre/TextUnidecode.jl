using Documenter, text-unidecode

makedocs(;
    modules=[text-unidecode],
    format=Documenter.HTML(),
    pages=[
        "Home" => "index.md",
    ],
    repo="https://github.com/altre/text-unidecode.jl/blob/{commit}{path}#L{line}",
    sitename="text-unidecode.jl",
    authors="Alan Schelten",
    assets=[],
)

deploydocs(;
    repo="github.com/altre/text-unidecode.jl",
)
