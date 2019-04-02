module text_unidecode
using Printf

const table = Vector{Vector{String}}(undef, 256)

function unidecode(str::String)::String
    new_string = Vector{String}()
    for c in str
        code_point = Int(c)
        if code_point < 0x80
            push!(new_string, string(c))
            continue
        elseif code_point > 0xffff
            continue
        else
            # Chop off last two hex digits
            section = code_point >> 8
            # Last two hex digits
            pos = code_point % 256;
            cache = get_cache(section)
            push!(new_string, cache[pos + 1])
        end
    end
    join(new_string)
end

function get_cache(section)
    try 
        return table[section + 1]
    catch UndefRefError
        path = joinpath("resources", @sprintf "X%03x" section)
        table[section + 1] = readlines(path)
        return table[section + 1]
    end
end

export unidecode
end
