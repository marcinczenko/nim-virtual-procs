import ./types
import ./base
import ./derived1
import ./derived2

proc callVirtual*(vTableProcEntry: VTableProcEntry, obj: BaseClass) =
  let p: pointer = vTableProcEntry.procPointer
  if obj of Derived1:
    let c = cast[Derived1Method1Type](p)
    c(Derived1(obj))
  elif obj of Derived2:
    let c = cast[Derived2Method1Type](p)
    c(Derived2(obj))
  else:
    raise newException(Exception, "not implemented")

proc callVirtual*(vTableProcEntry: VTableProcEntry,
                  obj: BaseClass,
                  intValue: int): int =
  let p: pointer = vTableProcEntry.procPointer
  if obj of Derived1:
    let c = cast[Derived1Method2Type](p)
    return c(Derived1(obj), intValue)
  elif obj of Derived2:
    let c = cast[Derived2Method2Type](p)
    return c(Derived2(obj), intValue)
  else:
    raise newException(Exception, "not implemented")

proc callVirtual*[T](vTableProcEntry: VTableProcEntry,
                  obj: BaseClass,
                  value: T): T =
  let p: pointer = vTableProcEntry.procPointer
  if obj of Derived1:
    let c = cast[Derived1Method3Type](p)
    return c(Derived1(obj), value)
  else:
    raise newException(Exception, "not implemented")

proc callVirtual*(vTableProcEntry: VTableProcEntry,
                  obj: BaseClass,
                  value: string): string =
  let p: pointer = vTableProcEntry.procPointer
  if obj of Derived2:
    let c = cast[Derived2Method3Type](p)
    return c(Derived2(obj), value)
  else:
    raise newException(Exception, "not implemented")
