#include "benchmark/benchmark.h"
#include "fixtures_location.h"

static void DoNothing(benchmark::State& state) {
  while (state.KeepRunning()) {
    //
  }
}
BENCHMARK(DoNothing)->Unit(benchmark::TimeUnit::kMillisecond);

BENCHMARK_MAIN();
