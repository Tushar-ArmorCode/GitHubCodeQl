// generated by codegen/codegen.py
private import codeql.swift.generated.Synth
private import codeql.swift.generated.Raw
import codeql.swift.elements.expr.Expr
import codeql.swift.elements.stmt.Stmt

module Generated {
  class ThrowStmt extends Synth::TThrowStmt, Stmt {
    override string getAPrimaryQlClass() { result = "ThrowStmt" }

    Expr getImmediateSubExpr() {
      result =
        Synth::convertExprFromRaw(Synth::convertThrowStmtToRaw(this).(Raw::ThrowStmt).getSubExpr())
    }

    final Expr getSubExpr() { result = getImmediateSubExpr().resolve() }
  }
}
