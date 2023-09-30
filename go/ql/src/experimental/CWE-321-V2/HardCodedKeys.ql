/**
 * @name Decoding JWT with hardcoded key
 * @description Decoding JWT Secret with a Constant value lead to authentication or authorization bypass
 * @kind path-problem
 * @problem.severity error
 * @id go/parse-jwt-with-hardcoded-key
 * @tags security
 *       experimental
 *       external/cwe/cwe-321
 */

import go
import experimental.frameworks.JWT

module JwtPaseWithConstantKeyConfig implements DataFlow::ConfigSig {
  predicate isSource(DataFlow::Node source) { source.asExpr() instanceof StringLit }

  predicate isSink(DataFlow::Node sink) {
    // first part is the JWT Parsing Functions that get a func type as an argument
    // Find a node that has flow to a key Function argument
    // then find the first result node of this Function which is the secret key
    exists(FuncDef fd, DataFlow::Node n, DataFlow::ResultNode rn |
      GolangJwtKeyFunc::flow(n, _) and fd = n.asExpr()
    |
      rn.getRoot() = fd and
      rn.getIndex() = 0 and
      sink = rn
    )
    or
    exists(Function fd, DataFlow::ResultNode rn | GolangJwtKeyFunc::flow(fd.getARead(), _) |
      // sink is result of a method
      sink = rn and
      // the method is belong to a function in which is used as a JWT function key
      rn.getRoot() = fd.getFuncDecl() and
      rn.getIndex() = 0
    )
    or
    // second part is the JWT Parsing Functions that get a string or byte as an argument
    sink = any(JwtParse jp).getKeyArg()
  }
}

module GolangJwtKeyFuncConfig implements DataFlow::ConfigSig {
  predicate isSource(DataFlow::Node source) {
    source = any(Function f).getARead()
    or
    source.asExpr() = any(FuncDef fd)
  }

  predicate isSink(DataFlow::Node sink) {
    sink = any(JwtParseWithKeyFunction parseJWT).getKeyFuncArg()
  }
}

module JwtPaseWithConstantKey = TaintTracking::Global<JwtPaseWithConstantKeyConfig>;

module GolangJwtKeyFunc = TaintTracking::Global<GolangJwtKeyFuncConfig>;

import JwtPaseWithConstantKey::PathGraph

from JwtPaseWithConstantKey::PathNode source, JwtPaseWithConstantKey::PathNode sink
where JwtPaseWithConstantKey::flowPath(source, sink)
select sink.getNode(), source, sink, "This  $@.", source.getNode(),
  "Constant Key is used as JWT Secret key"
