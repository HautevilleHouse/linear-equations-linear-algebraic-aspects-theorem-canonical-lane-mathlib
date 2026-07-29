import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.LinearEquationsLinearAlgebraicAspectsTheorem.LinearMapStructure

namespace HautevilleHouse
namespace LinearEquationsLinearAlgebraicAspectsTheorem

structure BasisPackage (K : Type u) [Field K] (V : Type v) [AddCommGroup V] [Module K V] where
  vectors : Finset V
  spanning : ∀ v : V, v ∈ Submodule.span K (vectors : Set V)
  linearIndependent : LinearIndependent K (fun (x : vectors) => (x : V))

def BasisPackage.dimension {K : Type u} [Field K] {V : Type v} [AddCommGroup V] [Module K V] (B : BasisPackage K V) : ℕ := B.vectors.card

structure MatrixPackage (K : Type u) [Field K] (m n : ℕ) where
  entries : (Fin m) → (Fin n) → K

def matrixMult {K : Type u} [Field K] {m n p : ℕ} (A : MatrixPackage K m n) (B : MatrixPackage K n p) : MatrixPackage K m p :=
  { entries := λ i k => Finset.sum (Finset.univ : Finset (Fin n)) (λ j => A.entries i j * B.entries j k) }

theorem matrix_mult_associative {K : Type u} [Field K] {m n p q : ℕ}
    (A : MatrixPackage K m n) (B : MatrixPackage K n p) (C : MatrixPackage K p q) :
    matrixMult (matrixMult A B) C = matrixMult A (matrixMult B C) := by
  ext i l; simp [matrixMult, Finset.sum_mul, Finset.mul_sum, Finset.sum_product]

structure MatrixLinearMapEquivalence {K : Type u} [Field K] {V : Type v} [AddCommGroup V] [Module K V] {W : Type w} [AddCommGroup W] [Module K W]
    (f : LinearMapPackage K V W) (Bv : BasisPackage K V) (Bw : BasisPackage K W) where
  matrix : MatrixPackage K (Bw.dimension) (Bv.dimension)
  compatibility : ∀ x : V, f.toFun x = Finset.sum (Finset.univ : Finset (Fin (Bw.dimension))) (λ i =>
    (Finset.sum (Finset.univ : Finset (Fin (Bv.dimension))) (λ j => matrix.entries i j * (Bv.coord j x))) • (Bw.vector i))

end LinearEquationsLinearAlgebraicAspectsTheorem
end HautevilleHouse