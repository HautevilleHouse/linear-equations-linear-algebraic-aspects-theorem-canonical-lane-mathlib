import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearEquationsLinearAlgebraicAspectsTheoremCanonicalLaneLean

structure LeastSquaresSolution (K : Type) [Field K] [DecidableEq K] where
  matrix : List (List K)
  targetVector : List K
  solution : List K
  residualVector : List K
  normSquared : K

structure LeastSquaresEvidence (L : LeastSquaresSolution K) where
  normalEquationsClosed : L.solution = (Matrix.solveNormalEquations (Matrix.ofList L.matrix) (Vector.ofList L.targetVector))
  residualClosed : L.residualVector = (Vector.sub (Vector.ofList L.targetVector) (Matrix.mulVec (Matrix.ofList L.matrix) (Vector.ofList L.solution)))
  normSquaredClosed : L.normSquared = (Vector.dotProduct L.residualVector L.residualVector)
  minimalityClosed : ∀ (x : List K), (Vector.dotProduct (Vector.sub (Vector.ofList L.targetVector) (Matrix.mulVec (Matrix.ofList L.matrix) (Vector.ofList x))) (Vector.sub (Vector.ofList L.targetVector) (Matrix.mulVec (Matrix.ofList L.matrix) (Vector.ofList x)))) ≥ L.normSquared

def LeastSquaresClosed (L : LeastSquaresSolution K) : Prop :=
  L.solution = (Matrix.solveNormalEquations (Matrix.ofList L.matrix) (Vector.ofList L.targetVector)) ∧
  L.residualVector = (Vector.sub (Vector.ofList L.targetVector) (Matrix.mulVec (Matrix.ofList L.matrix) (Vector.ofList L.solution))) ∧
  L.normSquared = (Vector.dotProduct L.residualVector L.residualVector) ∧
  ∀ (x : List K), (Vector.dotProduct (Vector.sub (Vector.ofList L.targetVector) (Matrix.mulVec (Matrix.ofList L.matrix) (Vector.ofList x))) (Vector.sub (Vector.ofList L.targetVector) (Matrix.mulVec (Matrix.ofList L.matrix) (Vector.ofList x)))) ≥ L.normSquared

theorem least_squares_closed_from_evidence (L : LeastSquaresSolution K) (E : LeastSquaresEvidence L) : LeastSquaresClosed L := by
  exact And.intro E.normalEquationsClosed (And.intro E.residualClosed (And.intro E.normSquaredClosed E.minimalityClosed))

end LinearEquationsLinearAlgebraicAspectsTheoremCanonicalLaneLean
end HautevilleHouse