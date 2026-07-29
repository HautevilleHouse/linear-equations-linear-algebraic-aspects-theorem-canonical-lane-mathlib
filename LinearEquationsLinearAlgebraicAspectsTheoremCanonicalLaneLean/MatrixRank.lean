import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearEquationsLinearAlgebraicAspectsTheoremCanonicalLaneLean

structure MatrixRank (K : Type) [Field K] where
  matrix : List (List K)
  rank : Nat
  nullity : Nat

structure MatrixRankEvidence (R : MatrixRank K) where
  rankClosed : R.rank = (Matrix.rank (Matrix.ofList R.matrix))
  nullityClosed : R.nullity = (Matrix.nullity (Matrix.ofList R.matrix))
  rankNullityClosed : R.rank + R.nullity = (Matrix.colCount (Matrix.ofList R.matrix))

def MatrixRankClosed (R : MatrixRank K) : Prop :=
  R.rank = (Matrix.rank (Matrix.ofList R.matrix)) ∧
  R.nullity = (Matrix.nullity (Matrix.ofList R.matrix)) ∧
  R.rank + R.nullity = (Matrix.colCount (Matrix.ofList R.matrix))

theorem matrix_rank_closed_from_evidence (R : MatrixRank K) (E : MatrixRankEvidence R) : MatrixRankClosed R := by
  exact And.intro E.rankClosed (And.intro E.nullityClosed E.rankNullityClosed)

end LinearEquationsLinearAlgebraicAspectsTheoremCanonicalLaneLean
end HautevilleHouse