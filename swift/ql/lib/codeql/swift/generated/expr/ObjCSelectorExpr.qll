// generated by codegen/codegen.py
private import codeql.swift.generated.Synth
private import codeql.swift.generated.Raw
import codeql.swift.elements.decl.AbstractFunctionDecl
import codeql.swift.elements.expr.Expr

module Generated {
  class ObjCSelectorExpr extends Synth::TObjCSelectorExpr, Expr {
    override string getAPrimaryQlClass() { result = "ObjCSelectorExpr" }

    Expr getImmediateSubExpr() {
      result =
        Synth::convertExprFromRaw(Synth::convertObjCSelectorExprToRaw(this)
              .(Raw::ObjCSelectorExpr)
              .getSubExpr())
    }

    final Expr getSubExpr() { result = getImmediateSubExpr().resolve() }

    AbstractFunctionDecl getImmediateMethod() {
      result =
        Synth::convertAbstractFunctionDeclFromRaw(Synth::convertObjCSelectorExprToRaw(this)
              .(Raw::ObjCSelectorExpr)
              .getMethod())
    }

    final AbstractFunctionDecl getMethod() { result = getImmediateMethod().resolve() }
  }
}
