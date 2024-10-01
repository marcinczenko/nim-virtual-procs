import std/strformat
import ./types
import ./utils
import ./base

type Derived2* = ref object of BaseClass

proc method1*(obj: Derived2) {.nimcall.} =
  echo "Derived2 method1"

proc method2*(obj: Derived2, intValue: int): int {.nimcall.} =
  echo "Derived2 method2 with intValue=" & $intValue
  return intValue + 1

proc method3*[T](obj: Derived2, value: T): T {.nimcall.} =
  echo fmt"Derived1 generic method3 (T={$T}) with value=" & $value
  return value

type Derived2Method1Type* = proc(obj: Derived2) {.nimcall.}
type Derived2Method2Type* = proc(obj: Derived2, intValue: int): int {.nimcall.}
type Derived2Method3Type* = proc(obj: Derived2, value: string): string {.nimcall.}

let vTable = VTableBaseClass(
  method1: vTableEntry[Derived2Method1Type](method1),
  method2: vTableEntry[Derived2Method2Type](method2),
  method3: vTableEntry[Derived2Method3Type](method3)
)

proc new*(T: typedesc[Derived2]): T =
  T(vTable: vTable)
