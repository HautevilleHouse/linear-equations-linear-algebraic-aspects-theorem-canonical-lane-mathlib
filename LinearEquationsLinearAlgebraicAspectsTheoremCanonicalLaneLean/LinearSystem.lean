import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearEquationsLinearAlgebraicAspectsTheoremCanonicalLaneLean

structure LinearSystem (K : Type) [Field K] where
  equations : List (List K)
  variables : Nat
  isConsistent : Prop
  solutionSpaceDimension : Nat

structure LinearSystemEvidence (S : LinearSystem K) where
  isConsistentClosed : S.isConsistent
  solutionSpaceDimensionClosed : S.solutionSpaceDimension = (S.variables - (Matrix.rank (Matrix.ofList S.equations)))

def LinearSystemClosed (S : LinearSystem K) : Prop :=
  S.isConsistent ∧ S.solutionSpaceDimension = (S.variables - (Matrix.rank (Matrix.ofList S.equations)))

theorem linear_system_closed_from_evidence (S : LinearSystem K) (E : LinearSystemEvidence S) : LinearSystemClosed S := by
  exact And.intro E.isConsistentClosed E.solutionSpaceDimensionClosed

end LinearEquationsLinearAlgebraicAspectsTheoremCanonicalLaneLean
end HautevilleHouse