using TextUnidecode, BenchmarkTools
const SUITE = BenchmarkGroup()
SUITE["南无阿弥陀佛"] = @benchmarkable unidecode("南无阿弥陀佛")
SUITE["really only ascii all fine!"] = @benchmarkable unidecode("really only ascii all fine!")
