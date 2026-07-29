import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearEquationsLinearAlgebraicAspectsTheoremCanonicalLaneLean

structure LinearMapPackage (V W : VectorSpacePackage) where
  underlyingFunction : V.vectorSpaceType → W.vectorSpaceType
  additivity : ∀ u v : V.vectorSpaceType, underlyingFunction (V.vectorAddition u v) = W.vectorAddition (underlyingFunction u) (underlyingFunction v)
  homogeneity : ∀ a : V.field, ∀ v : V.vectorSpaceType, underlyingFunction (V.scalarMultiplication a v) = W.scalarMultiplication a (underlyingFunction v)

structure LinearMapEvidence {V W : VectorSpacePackage} (L : LinearMapPackage V W) where
  additivityClosed : L.additivity
  homogeneityClosed : L.homogeneity

def LinearMapClosed {V W : VectorSpacePackage} (L : LinearMapPackage V W) : Prop :=
  L.additivity ∧ L.homogeneity

theorem linear_map_closed_from_evidence {V W : VectorSpacePackage} (L : LinearMapPackage V W) (E : LinearMapEvidence L) : LinearMapClosed L := by
  exact And.intro E.additivityClosed E.homogeneityClosed

end LinearEquationsLinearAlgebraicAspectsTheoremCanonicalLaneLean
end HautevilleHouse