import ./virtual/base
import ./virtual/derived1
import ./virtual/derived2
import ./virtual/basedispatch

let d1 = Derived1.new()
let d2 = Derived2.new()

proc someFunc(obj: BaseClass) =
  obj.vTable.method1.callVirtual(obj)
  echo obj.vTable.method2.callVirtual(obj, 42)
  if (obj of Derived1):
    echo obj.vTable.method3.callVirtual(obj, 42.uint16)
  else:
    echo obj.vTable.method3.callVirtual(obj, "some string value")

someFunc(d1)
someFunc(d2)
