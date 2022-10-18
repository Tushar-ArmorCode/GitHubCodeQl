// generated by codegen/codegen.py
private import codeql.swift.generated.Synth
private import codeql.swift.generated.Raw
import codeql.swift.elements.decl.Decl
import codeql.swift.elements.decl.GenericContext
import codeql.swift.elements.decl.IterableDeclContext
import codeql.swift.elements.decl.NominalTypeDecl

module Generated {
  class ExtensionDecl extends Synth::TExtensionDecl, GenericContext, IterableDeclContext, Decl {
    override string getAPrimaryQlClass() { result = "ExtensionDecl" }

    NominalTypeDecl getImmediateExtendedTypeDecl() {
      result =
        Synth::convertNominalTypeDeclFromRaw(Synth::convertExtensionDeclToRaw(this)
              .(Raw::ExtensionDecl)
              .getExtendedTypeDecl())
    }

    final NominalTypeDecl getExtendedTypeDecl() {
      result = getImmediateExtendedTypeDecl().resolve()
    }
  }
}
