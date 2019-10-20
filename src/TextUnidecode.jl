module TextUnidecode

const table = Vector{Vector{String}}(undef, 256)

"""
Convert non-ascii characters to "good enough" ascii.
```jldoctest
julia> unidecode("南无阿弥陀佛")
"Nan Wu A Mi Tuo Fo"

julia> unidecode("あみだにょらい")
amidaniyorai
```
"""
function unidecode(str::AbstractString)::AbstractString
    buf = IOBuffer()
    ascii_char = Char(0)
    @inbounds for c in str
        code_point = codepoint(c)
        if code_point < 0x80
            ascii_char = c
            print(buf, ascii_char)
            continue
        elseif code_point > 0xffff
            continue
        else
            # Chop off last two hex digits
            section = code_point >> 8
            # Last two hex digits
            pos = code_point % 256
            cache = get_cache(section)
            print(buf, cache[pos + 1])
        end
    end
    # rstrip if from unicode table
    if buf.size > 1 && buf.data[buf.size] == 0x20 && ascii_char != ' '
        buf.size -= 1
    end
    String(take!(buf))
end

function get_cache(section::UInt32)::Vector{String}
    if isassigned(table, section+1) 
        table[section + 1]
    else
        path = joinpath(@__DIR__, "..", "resources", "X$(string(section, base = 16, pad = 3))" )
        if isfile(path)
            table[section + 1] = readlines(path)
        else
            # No match, remove all
            table[section + 1] = fill("", 256)
        end
    end
end

export unidecode
end

