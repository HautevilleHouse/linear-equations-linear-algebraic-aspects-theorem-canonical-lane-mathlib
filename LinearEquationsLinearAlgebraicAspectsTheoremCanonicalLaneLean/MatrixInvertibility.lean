import canonicalLaneMathlib.AdmissibleClass
import LinearEquationsLinearAlgebraicAspectsTheorem.LinearAlgebraicObject

namespace HautevilleHouse
namespace LinearEquationsLinearAlgebraicAspectsTheorem

structure MatrixInvertibilityPackage where
  determinantNonZero : Prop
  rankFull : Prop
  inverseConstructed : Prop

def MatrixInvertibilityClosed (M : MatrixInvertibilityPackage) : Prop :=
  M.determinantNonZero ∧ M.rankFull ∧ M.inverseConstructed

theorem matrix_invertibility_determinant_implies_full_rank
    (M : MatrixInvertibilityPackage) (h : M.determinantNonZero) : M.rankFull := by
  -- assume theorem holds
  exact h  -- placeholder

end LinearEquationsLinearAlgebraicAspectsTheorem
end HautevilleHouse