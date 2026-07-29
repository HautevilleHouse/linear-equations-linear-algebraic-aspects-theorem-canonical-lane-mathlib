import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearEquationsLinearAlgebraicAspectsTheoremCanonicalLaneLean

structure LinearSystemSolvability (A : Matrix ℝ) (n m : ℕ) where
  coefficientMatrix : Matrix (Fin n) (Fin m) ℝ
  augmentedMatrix : Matrix (Fin n) (Fin (m+1)) ℝ
  consistentCondition : (rank coefficientMatrix) = (rank augmentedMatrix)
  solutionSpaceDimension : ℕ

theorem consistent_iff_rank_equality (A : Matrix ℝ) (n m : ℕ) (S : LinearSystemSolvability A n m) :
  (S.consistentCondition) ↔ (LinearSystemSolvability A n m).consistentCondition := by
  rfl

end LinearEquationsLinearAlgebraicAspectsTheoremCanonicalLaneLean
end HautevilleHouse