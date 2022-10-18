// generated by codegen/codegen.py
private import codeql.swift.generated.Synth
private import codeql.swift.generated.Raw
import codeql.swift.elements.type.AnyFunctionType
import codeql.swift.elements.type.GenericTypeParamType

module Generated {
  class GenericFunctionType extends Synth::TGenericFunctionType, AnyFunctionType {
    override string getAPrimaryQlClass() { result = "GenericFunctionType" }

    GenericTypeParamType getImmediateGenericParam(int index) {
      result =
        Synth::convertGenericTypeParamTypeFromRaw(Synth::convertGenericFunctionTypeToRaw(this)
              .(Raw::GenericFunctionType)
              .getGenericParam(index))
    }

    final GenericTypeParamType getGenericParam(int index) {
      result = getImmediateGenericParam(index).resolve()
    }

    final GenericTypeParamType getAGenericParam() { result = getGenericParam(_) }

    final int getNumberOfGenericParams() { result = count(getAGenericParam()) }
  }
}
