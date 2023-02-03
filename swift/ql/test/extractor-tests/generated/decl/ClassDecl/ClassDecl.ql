// generated by codegen/codegen.py
import codeql.swift.elements
import TestUtils

from
  ClassDecl x, int getNumberOfGenericTypeParams, ModuleDecl getModule, int getNumberOfMembers,
  Type getInterfaceType, string getName, int getNumberOfBaseTypes, Type getType
where
  toBeTested(x) and
  not x.isUnknown() and
  getNumberOfGenericTypeParams = x.getNumberOfGenericTypeParams() and
  getModule = x.getModule() and
  getNumberOfMembers = x.getNumberOfMembers() and
  getInterfaceType = x.getInterfaceType() and
  getName = x.getName() and
  getNumberOfBaseTypes = x.getNumberOfBaseTypes() and
  getType = x.getType()
select x, "getNumberOfGenericTypeParams:", getNumberOfGenericTypeParams, "getModule:", getModule,
  "getNumberOfMembers:", getNumberOfMembers, "getInterfaceType:", getInterfaceType, "getName:",
  getName, "getNumberOfBaseTypes:", getNumberOfBaseTypes, "getType:", getType
