using PkgBenchmark
curr = benchmarkpkg("..")
prev = benchmarkpkg("..", "HEAD~")
judge(curr, prev).benchmarkgroup