import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.LinearEquationsLinearAlgebraicAspectsTheorem.VectorSpaceAxioms

namespace HautevilleHouse
namespace LinearEquationsLinearAlgebraicAspectsTheorem

structure BilinearFormPackage (K : Type u) [Field K] (V : Type v) [AddCommGroup V] [Module K V] where
  toFun : V → V → K
  bilinear : ∀ (a b : K) (x y z : V),
    toFun (a • x + b • y) z = a * toFun x z + b * toFun y z ∧
    toFun x (a • y + b • z) = a * toFun x y + b * toFun x z

structure SymmetricBilinearFormPackage (K : Type u) [Field K] (V : Type v) [AddCommGroup V] [Module K V] (B : BilinearFormPackage K V) where
  symmetric : ∀ x y : V, B.toFun x y = B.toFun y x

theorem symmetric_iff_matrix_symmetric {K : Type u} [Field K] {n : ℕ} (B : BilinearFormPackage K (MatrixPackage K n 1)) :
    (SymmetricBilinearFormPackage K (MatrixPackage K n 1) B) ↔
    (∀ i j : Fin n, B.toFun (basisVec i) (basisVec j) = B.toFun (basisVec j) (basisVec i)) := by
  constructor
  · intro h i j; exact h.symmetric (basisVec i) (basisVec j)
  · intro h x y
    -- express x, y in basis
    sorry
  where
    basisVec (i : Fin n) : MatrixPackage K n 1 := { entries := λ j _ => if j = i then 1 else 0 }

end LinearEquationsLinearAlgebraicAspectsTheorem
end HautevilleHouse