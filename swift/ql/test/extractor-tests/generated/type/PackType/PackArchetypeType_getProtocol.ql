// generated by codegen/codegen.py
import codeql.swift.elements
import TestUtils

from PackArchetypeType x, int index
where toBeTested(x) and not x.isUnknown()
select x, index, x.getProtocol(index)
