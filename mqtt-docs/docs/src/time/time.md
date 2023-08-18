---
hide:
  - toc
search:
  exclude: true
---
```````pony linenums="1"
"""
# Time Package

The Time Package provides classes and methods for timing operations,
dealing with dates and times, and scheduling tasks.
"""

use "lib:rt" if linux
use @"internal.x86.cpuid"[(I32, I32, I32, I32)](eax: I32)
use @"internal.x86.rdtscp"[U64](aux: Pointer[I32])
use @"llvm.x86.rdtsc"[U64]()
use @"llvm.readcyclecounter"[U64]()
use @time[I64](tloc: Pointer[None])
use @clock_gettime[I32](clock: U32, ts: Pointer[(I64, I64)])
  if lp64 and (linux or bsd)
use @clock_gettime[I32](clock: U32, ts: Pointer[(I32, I32)])
  if ilp32 and (linux or bsd)
use @clock_gettime_nsec_np[U64](clock: U32) if osx
use @gettimeofday[I32](tp: Pointer[(I64, I64)], tzp: Pointer[None])
  if osx
use @GetSystemTimeAsFileTime[None](times_as_file_time: Pointer[(U32, U32)])
  if windows
use @QueryPerformanceFrequency[I32](frequency: Pointer[(U32, U32)]) if windows
use @QueryPerformanceCounter[I32](count: Pointer[(U32, U32)]) if windows

type _Clock is (_ClockRealtime | _ClockMonotonic)

primitive _ClockRealtime
  fun apply(): U32 =>
    ifdef linux or bsd then
      0
    else
      compile_error "no clock_gettime realtime clock"
    end

primitive _ClockMonotonic
  fun apply(): U32 =>
    ifdef linux then
      1
    elseif bsd then
      4
    else
      compile_error "no clock_gettime monotonic clock"
    end

primitive _ClockUptimeRaw
  fun apply(): U32 =>
    ifdef osx then
      8
    else
      compile_error "no clock_gettime_nsec_np uptime raw clock"
    end

primitive Time
  """
  A collection of ways to fetch the current time.
  """
  fun now(): (I64 /*sec*/, I64 /*nsec*/) =>
    """
    The wall-clock adjusted system time with nanoseconds.
    Return: (seconds, nanoseconds)
    """
    ifdef osx then
      var ts: (I64, I64) = (0, 0)
      @gettimeofday(addressof ts, USize(0))
      (ts._1, ts._2 * 1000)
    elseif linux or bsd then
      _clock_gettime(_ClockRealtime)
    elseif windows then
      var ft: (U32, U32) = (0, 0)
      @GetSystemTimeAsFileTime(addressof ft)
      var qft = ft._1.u64() or (ft._2.u64() << 32)
      var epoch = qft.i64() - 116444736000000000
      var sec = epoch / 10000000
      var nsec = (epoch - (sec * 10000000)) * 100
      (sec, nsec)
    else
      compile_error "unsupported platform"
    end

  fun seconds(): I64 =>
    """
    The wall-clock adjusted system time.
    """
    @time(USize(0))

  fun millis(): U64 =>
    """
    Monotonic unadjusted milliseconds.
    """
    ifdef osx then
      @clock_gettime_nsec_np(_ClockUptimeRaw()) / 1000000
    elseif linux or bsd then
      var ts = _clock_gettime(_ClockMonotonic)
      ((ts._1 * 1000) + (ts._2 / 1000000)).u64()
    elseif windows then
      _subseconds_from_query_performance_counter(1000)
    else
      compile_error "unsupported platform"
    end

  fun micros(): U64 =>
    """
    Monotonic unadjusted microseconds.
    """
    ifdef osx then
      @clock_gettime_nsec_np(_ClockUptimeRaw()) / 1000
    elseif linux or bsd then
      var ts = _clock_gettime(_ClockMonotonic)
      ((ts._1 * 1000000) + (ts._2 / 1000)).u64()
    elseif windows then
      _subseconds_from_query_performance_counter(1000000)
    else
      compile_error "unsupported platform"
    end

  fun nanos(): U64 =>
    """
    Monotonic unadjusted nanoseconds.
    """
    ifdef osx then
      @clock_gettime_nsec_np(_ClockUptimeRaw())
    elseif linux or bsd then
      var ts = _clock_gettime(_ClockMonotonic)
      ((ts._1 * 1000000000) + ts._2).u64()
    elseif windows then
      _subseconds_from_query_performance_counter(1000000000)
    else
      compile_error "unsupported platform"
    end

  fun cycles(): U64 =>
    """
    Processor cycle count. Don't use this for performance timing, as it does
    not control for out-of-order execution.
    """
    @"llvm.readcyclecounter"()

  fun perf_begin(): U64 =>
    """
    Get a cycle count for beginning a performance testing block. This will
    will prevent instructions from before this call leaking into the block and
    instructions after this call being executed earlier.
    """
    ifdef x86 then
      @"internal.x86.cpuid"(I32(0))
      @"llvm.x86.rdtsc"()
    else
      compile_error "perf_begin only supported on x86"
    end

  fun perf_end(): U64 =>
    """
    Get a cycle count for ending a performance testing block. This will
    will prevent instructions from after this call leaking into the block and
    instructions before this call being executed later.
    """
    ifdef x86 then
      var aux: I32 = 0
      var ts = @"internal.x86.rdtscp"(addressof aux)
      @"internal.x86.cpuid"(I32(0))
      ts
    else
      compile_error "perf_end only supported on x86"
    end

  fun _clock_gettime(clock: _Clock): (I64, I64) =>
    """
    Return a clock time on linux and bsd.
    """
    ifdef lp64 and (linux or bsd) then
      var ts: (I64, I64) = (0, 0)
      @clock_gettime(clock(), addressof ts)
      ts
    elseif ilp32 and (linux or bsd) then
      var ts: (I32, I32) = (0, 0)
      @clock_gettime(clock(), addressof ts)
      (ts._1.i64(), ts._2.i64())
    else
      compile_error "no clock_gettime"
    end

  fun _subseconds_from_query_performance_counter(subseconds: U64): U64 =>
      (let qpc, let qpf) = _query_performance_counter()
      if qpf <= subseconds then
        qpc * (subseconds / qpf)
      else
        (qpc * subseconds) / qpf
      end


  fun _query_performance_counter(): (U64 /* qpc */, U64 /* qpf */) =>
    """
    Return QPC and QPF.
    """
    ifdef windows then
      var pf: (U32, U32) = (0, 0)
      var pc: (U32, U32) = (0, 0)
      @QueryPerformanceFrequency(addressof pf)
      @QueryPerformanceCounter(addressof pc)
      let qpf = pf._1.u64() or (pf._2.u64() << 32)
      let qpc = pc._1.u64() or (pc._2.u64() << 32)
      (qpc, qpf)
    else
      compile_error "no QueryPerformanceCounter"
    end

```````