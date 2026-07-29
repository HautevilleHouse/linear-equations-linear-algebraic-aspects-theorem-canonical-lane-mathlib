import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearEquationsLinearAlgebraicAspectsTheoremCanonicalLaneLean

structure LUDecomposition (K : Type) [Field K] where
  matrix : List (List K)
  lowerTriangular : List (List K)
  upperTriangular : List (List K)
  permutation : List Nat

structure LUDecompositionEvidence (L : LUDecomposition K) where
  factorizationClosed : (Matrix.ofList L.matrix) = (Matrix.mul (Matrix.mul (Matrix.permutationMatrix L.permutation) (Matrix.ofList L.lowerTriangular)) (Matrix.ofList L.upperTriangular))
  lowerTriangularClosed : Matrix.isLowerTriangular (Matrix.ofList L.lowerTriangular) ∧ Matrix.hasUnitDiagonal (Matrix.ofList L.lowerTriangular)
  upperTriangularClosed : Matrix.isUpperTriangular (Matrix.ofList L.upperTriangular)
  permutationClosed : L.permutation = (Matrix.luPermutation (Matrix.ofList L.matrix))

def LUDecompositionClosed (L : LUDecomposition K) : Prop :=
  (Matrix.ofList L.matrix) = (Matrix.mul (Matrix.mul (Matrix.permutationMatrix L.permutation) (Matrix.ofList L.lowerTriangular)) (Matrix.ofList L.upperTriangular)) ∧
  Matrix.isLowerTriangular (Matrix.ofList L.lowerTriangular) ∧ Matrix.hasUnitDiagonal (Matrix.ofList L.lowerTriangular) ∧
  Matrix.isUpperTriangular (Matrix.ofList L.upperTriangular) ∧
  L.permutation = (Matrix.luPermutation (Matrix.ofList L.matrix))

theorem lu_decomposition_closed_from_evidence (L : LUDecomposition K) (E : LUDecompositionEvidence L) : LUDecompositionClosed L := by
  exact And.intro E.factorizationClosed (And.intro (And.intro E.lowerTriangularClosed.1 E.lowerTriangularClosed.2) (And.intro E.upperTriangularClosed E.permutationClosed))

end LinearEquationsLinearAlgebraicAspectsTheoremCanonicalLaneLean
end HautevilleHouse