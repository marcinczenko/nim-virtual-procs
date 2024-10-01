import ./types

proc vTableEntry*[T](function: T): VTableProcEntry =
  VTableProcEntry(
    procPointer: cast[pointer](function),
    envPointer: nil)
