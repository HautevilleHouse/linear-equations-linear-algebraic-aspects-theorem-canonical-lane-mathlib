import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearEquationsLinearAlgebraicAspectsTheoremCanonicalLaneLean

structure VectorSpaceUniversalProperty (V : Type u) [AddCommGroup V] [Module ℝ V] where
  basisCardinality : Cardinal
  cardinalityInvariance : Prop
  linearMapFactorization : Prop
  uniqueRepresentation : Prop

structure VectorSpaceUniversalPropertyEvidence (V : Type u) [AddCommGroup V] [Module ℝ V] (U : VectorSpaceUniversalProperty V) where
  cardinalityInvarianceClosed : U.cardinalityInvariance
  linearMapFactorizationClosed : U.linearMapFactorization
  uniqueRepresentationClosed : U.uniqueRepresentation

def VectorSpaceUniversalPropertyClosed (V : Type u) [AddCommGroup V] [Module ℝ V] (U : VectorSpaceUniversalProperty V) : Prop :=
  U.cardinalityInvariance ∧ U.linearMapFactorization ∧ U.uniqueRepresentation

theorem vector_space_universal_property_closed_from_evidence (V : Type u) [AddCommGroup V] [Module ℝ V] (U : VectorSpaceUniversalProperty V) (E : VectorSpaceUniversalPropertyEvidence V U) : VectorSpaceUniversalPropertyClosed V U := by
  exact And.intro E.cardinalityInvarianceClosed (And.intro E.linearMapFactorizationClosed E.uniqueRepresentationClosed)

end LinearEquationsLinearAlgebraicAspectsTheoremCanonicalLaneLean
end HautevilleHouse