import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearEquationsLinearAlgebraicAspectsTheoremCanonicalLaneLean

structure EigenvalueDecomposition (V : Type u) [AddCommGroup V] [Module ℝ V] where
  eigenSpaceFamily : ℝ → Submodule ℝ V
  directSumDecomposition : ⨁ (λ : ℝ), eigenSpaceFamily λ = ⊤
  invarianceUnderLinearMap : Prop

structure EigenvalueDecompositionEvidence (V : Type u) [AddCommGroup V] [Module ℝ V] (E : EigenvalueDecomposition V) where
  invarianceUnderLinearMapClosed : E.invarianceUnderLinearMap

def EigenvalueDecompositionClosed (V : Type u) [AddCommGroup V] [Module ℝ V] (E : EigenvalueDecomposition V) : Prop :=
  E.invarianceUnderLinearMap

theorem eigenvalue_decomposition_closed_from_evidence (V : Type u) [AddCommGroup V] [Module ℝ V] (E : EigenvalueDecomposition V) (Ev : EigenvalueDecompositionEvidence V E) : EigenvalueDecompositionClosed V E := by
  exact Ev.invarianceUnderLinearMapClosed

end LinearEquationsLinearAlgebraicAspectsTheoremCanonicalLaneLean
end HautevilleHouse