import std/strformat
import ./types
import ./utils
import ./base

type Derived1* = ref object of BaseClass

proc method1*(obj: Derived1) {.nimcall.} =
  echo "Derived1 method1"

proc method2*(obj: Derived1, intValue: int): int {.nimcall.} =
  echo "Derived1 method2 with intValue=" & $intValue
  return intValue + 1

proc method3*[T](obj: Derived1, value: T): T {.nimcall.} =
  echo fmt"Derived1 generic method3 (T={$T}) with value=" & $value
  return value + 1

type Derived1Method1Type* = proc(obj: Derived1) {.nimcall.}
type Derived1Method2Type* = proc(obj: Derived1, intValue: int): int {.nimcall.}
type Derived1Method3Type* = proc(obj: Derived1, value: uint16): uint16 {.nimcall.}

let vTable = VTableBaseClass(
  method1: vTableEntry[Derived1Method1Type](method1),
  method2: vTableEntry[Derived1Method2Type](method2),
  method3: vTableEntry[Derived1Method3Type](method3)
)

proc new*(T: typedesc[Derived1]): T =
  T(vTable: vTable)
