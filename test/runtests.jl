using text_unidecode
using Test

@testset "text_unidecode.jl" begin
    @test unidecode("u") == "u"
    @test unidecode("uua") == "uua"
    @test unidecode(string(Char(0x10000))) == ""
    @test unidecode("ü") == "u"
    @test unidecode("ø") == "o"
    @test unidecode("😜") == ""
    @test unidecode("Ｈ") == "H"
    @test unidecode("南无阿弥陀佛") == "Nan Wu A Mi Tuo Fo"
end
