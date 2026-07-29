import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearEquationsLinearAlgebraicAspectsTheoremCanonicalLaneLean

structure RankNullityDecomposition (V W : Type u) [AddCommGroup V] [AddCommGroup W] [Module ℝ V] [Module ℝ W] where
  kernelDimension : Nat
  imageDimension : Nat
  rankNullityIdentity : kernelDimension + imageDimension = Module.rank ℝ V
  decompositionLifted : Prop

structure RankNullityDecompositionEvidence (V W : Type u) [AddCommGroup V] [AddCommGroup W] [Module ℝ V] [Module ℝ W] (R : RankNullityDecomposition V W) where
  rankNullityIdentityClosed : R.rankNullityIdentity
  decompositionLiftedClosed : R.decompositionLifted

def RankNullityDecompositionClosed (V W : Type u) [AddCommGroup V] [AddCommGroup W] [Module ℝ V] [Module ℝ W] (R : RankNullityDecomposition V W) : Prop :=
  R.rankNullityIdentity ∧ R.decompositionLifted

theorem rank_nullity_decomposition_closed_from_evidence (V W : Type u) [AddCommGroup V] [AddCommGroup W] [Module ℝ V] [Module ℝ W] (R : RankNullityDecomposition V W) (E : RankNullityDecompositionEvidence V W R) : RankNullityDecompositionClosed V W R := by
  exact And.intro E.rankNullityIdentityClosed E.decompositionLiftedClosed

end LinearEquationsLinearAlgebraicAspectsTheoremCanonicalLaneLean
end HautevilleHouse