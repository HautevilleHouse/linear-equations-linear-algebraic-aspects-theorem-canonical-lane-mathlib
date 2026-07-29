import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearEquationsLinearAlgebraicAspectsTheoremCanonicalLaneLean

structure GaussianElimination (K : Type) [Field K] where
  originalSystem : LinearSystem K
  rowEchelonForm : List (List K)
  pivotPositions : List Nat
  backSubstitutionSolution : Option (List K)

structure GaussianEliminationEvidence (G : GaussianElimination K) where
  rowEchelonFormClosed : G.rowEchelonForm = (Matrix.toRowEchelon (Matrix.ofList G.originalSystem.equations))
  pivotPositionsClosed : G.pivotPositions = (Matrix.pivotPositions (Matrix.ofList G.originalSystem.equations))
  backSubstitutionSolutionClosed : G.backSubstitutionSolution = (if G.originalSystem.isConsistent then some (Matrix.backSubstitute (Matrix.ofList G.rowEchelonForm)) else none)

def GaussianEliminationClosed (G : GaussianElimination K) : Prop :=
  G.rowEchelonForm = (Matrix.toRowEchelon (Matrix.ofList G.originalSystem.equations)) ∧
  G.pivotPositions = (Matrix.pivotPositions (Matrix.ofList G.originalSystem.equations)) ∧
  G.backSubstitutionSolution = (if G.originalSystem.isConsistent then some (Matrix.backSubstitute (Matrix.ofList G.rowEchelonForm)) else none)

theorem gaussian_elimination_closed_from_evidence (G : GaussianElimination K) (E : GaussianEliminationEvidence G) : GaussianEliminationClosed G := by
  exact And.intro E.rowEchelonFormClosed (And.intro E.pivotPositionsClosed E.backSubstitutionSolutionClosed)

end LinearEquationsLinearAlgebraicAspectsTheoremCanonicalLaneLean
end HautevilleHouse