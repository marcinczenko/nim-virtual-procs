import std/strformat
import ./types

type VTableBaseClass* = ref object
  method1*: VTableProcEntry
  method2*: VTableProcEntry
  method3*: VTableProcEntry

type BaseClass* = ref object of RootObj
  vTable*: VTableBaseClass

proc method1*(obj: BaseClass) {.nimcall.} =
  echo "method1"

proc method2*(obj: BaseClass, intValue: int) {.nimcall.} =
  echo "method2 with intValue=" & $intValue

proc method3*[T](obj: BaseClass, value: T): T {.nimcall.} =
  echo fmt"generic method3 (T={$T}) with intValue=" & $value
  return value + 1
