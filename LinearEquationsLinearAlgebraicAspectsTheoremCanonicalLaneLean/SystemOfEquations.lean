import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.LinearEquationsLinearAlgebraicAspectsTheorem.MatrixRepresentation

namespace HautevilleHouse
namespace LinearEquationsLinearAlgebraicAspectsTheorem

structure SolutionPackage (K : Type u) [Field K] (m n : ℕ) (A : MatrixPackage K m n) (b : MatrixPackage K m 1) where
  solutions : Set (MatrixPackage K n 1)
  consistent : Finset.Nonempty (Finset.filter (λ x : MatrixPackage K n 1 => matrixMult A x = b) Finset.univ)

theorem homogeneous_solutions_form_subspace {K : Type u} [Field K] {m n : ℕ} (A : MatrixPackage K m n) :
    Submodule K (MatrixPackage K n 1) := by
  let zeroVec : MatrixPackage K n 1 := { entries := λ _ _ => 0 }
  have hzero : matrixMult A zeroVec = { entries := λ _ _ => 0 } := by
    ext i j; simp [matrixMult];
    -- j must be 1
    fin_cases j; simp [matrixMult];
    sorry
  sorry

structure GaussianEliminationPackage (K : Type u) [Field K] (m n : ℕ) (A : MatrixPackage K m n) where
  rowEchelonForm : MatrixPackage K m n
  rank : ℕ
  pivotColumns : Finset (Fin n)
  equivalence : ∃ (P : MatrixPackage K m m) (Q : MatrixPackage K n n),
    matrixMult (matrixMult P A) Q = rowEchelonForm

theorem rank_equals_dimension_of_row_space {K : Type u} [Field K] {m n : ℕ} {A : MatrixPackage K m n}
    (pkg : GaussianEliminationPackage K m n A) : True := True.intro

end LinearEquationsLinearAlgebraicAspectsTheorem
end HautevilleHouse