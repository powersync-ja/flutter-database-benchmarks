
# Flutter Database Benchmarks

A project to compare performance between various databases on Flutter.

The benchmarks are loosely based on old [SQLite benchmarks](https://www.sqlite.org/speed.html).

## Test Notes

Since the tests are based on ones from SQLite, the operations used may favor SQLite in some cases.
For example, copying data from one table to another (Test 11) is a native operation using a single query in SQLite,
while this requires separately querying and inserting data in Isar and ObjectBox.

On specific tests:

Test 1: This does individual inserts - no batching or transactions. This is not recommended for large volumes,
but does demonstrate the overhead per transaction.  The WAL journal mode on SQLite gives it an advantage on this test.

Test 6: Not present, since it only creates indexes, which are avoided in these benchmarks.

Test 7: This tests a "between" operation on an indexed column - `WHERE b >= ? AND b < ?`.
This is one test where ObjectBox does not perform as well as the others - it's possible that this operation
does not currently use indexes in ObjectBox.

## Benchmark Details

Some differences from the SQLite benchmarks:
1. Tables and indexes are pre-created, to better match typical usage, and to allow fair comparison
   with databases that don't support dynamic tables and indexes.
2. Tables have an explicit integer primary key "id", auto-populated by the respective databases. This is not directly used in the tests.
3. Clear instead of drop tables.
4. The exact queries may be different, but the outcome should be roughly the same.

The relative runtime is expected to roughly match the SQLite performance from above, but will be slightly
different because of the differences mentioned.

For the implementation, most benchmarks have two versions:
1. The default "obvious" implementation. Focus on ease of implementation rather than performance.
   * Only very simple performance optimizations are considered, for example combining writes into a single optimization.
2. A "batched" implementation that aims to minimize the performance overhead of individual async operations.
   * This may introduce some additional complexity to batch operations, but increases performance.
   * Only performance optimizations readily available in the library's documentation or examples are considered.
   * This is done by either using a batch API provided by the library, or running synchronous operations in a separate Isolate.

Only asynchronous/non-blocking APIs are used, unless the code runs in a background Isolate.
Synchronous calls have the ability to block the UI / introduce stutter, so we believe it best to avoid them completely.

## Benchmark limitations

1. Does not measure UI performance during database operations yet. Despite the database operations being async, it may still
   block the UI Isolate in some cases.
2. Only a single run of each test is recorded.
3. No UI yet - all results are logged to the console.
4. Does not test concurrent operations.

## Database-specific notes

Notes on implementations:

### sqlite_async

Only async operations are directly supported.

Uses WAL journal mode (library default). `PRAGMA wal_checkpoint(RESTART)` is run at the end of
every test, to better allocate write time to the relevant test.

Batched mode: Uses prepared statements internally.

### Sqflite

Uses DELETE journal mode (library default).

[sqflite_ffi](https://github.com/tekartik/sqflite/blob/master/sqflite_common_ffi/doc/using_ffi_instead_of_sqflite.md) is used for all tests.
This has much better performance than the default implementation, and is a simple change.

### Isar

Runs in "relaxed durability" mode. According to the docs:

> relaxedDurability	Relaxes the durability guarantee to increase write performance. In case of a system crash (not app crash), it is possible to lose the last committed transaction. Corruption is not possible.

This makes it the same guarantees as SQLite in WAL mode with `synchronous = NORMAL`, as used for sqlite_async.

### ObjectBox

ObjectBox does support async operations from version 2.0, but not in a transaction.

For async transactions, everything in the transaction must run in a separate isolate.
It doesn't cause any issues in these benchmarks, but would potentially complicate code in real-world applications.

Since there is no way to run an async transaction without running in a separate Isolate, only one implementation is provided.

## Acknowledgements

 * Some portions inspired by another Flutter database benchmarks project: https://github.com/o-ifeanyi/db_benchmarks
 * Implementation of the SQLite tests are adapted from the benchmarks in https://github.com/rhashimoto/wa-sqlite

