using TextUnidecode, BenchmarkTools
using BenchmarkTools
const SUITE = BenchmarkGroup()
SUITE["南无阿弥陀佛"] = @benchmarkable unidecode("南无阿弥陀佛")
