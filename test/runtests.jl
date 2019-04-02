using text_unidecode
using Test

@testset "text-unidecode.jl" begin
    @test unidecode("u") == "u"
    @test unidecode("uua") == "uua"
    @test unidecode(string(Char(0x10000))) == ""
    @test unidecode("ü") == "u"
    @test unidecode("ø") == "o"
end
