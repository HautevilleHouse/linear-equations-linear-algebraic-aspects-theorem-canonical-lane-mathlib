import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearEquationsLinearAlgebraicAspectsTheoremCanonicalLaneLean

structure BasisPackage (V : VectorSpacePackage) where
  basisSet : Set V.vectorSpaceType
  spanning : ∀ v : V.vectorSpaceType, ∃ (s : Finset (V.field × V.vectorSpaceType)), Finset.sum s (λ (c, b) => V.scalarMultiplication c b) = v
  linearIndependence : ∀ (f : V.vectorSpaceType → V.field) (h : ∀ b ∈ basisSet, f b = V.zeroElement), f = λ _ => V.zeroElement

structure DimensionPackage (V : VectorSpacePackage) where
  basis : BasisPackage V
  dimension : ℕ
  dimensionCardinal : Fintype.card (basis.basisSet) = dimension
  dimensionWellDefined : ∀ (b1 b2 : BasisPackage V), Fintype.card (b1.basisSet) = Fintype.card (b2.basisSet)

structure BasisEvidence (V : VectorSpacePackage) (B : BasisPackage V) where
  spanningClosed : B.spanning
  linearIndependenceClosed : B.linearIndependence

structure DimensionEvidence (V : VectorSpacePackage) (D : DimensionPackage V) where
  dimensionCardinalClosed : D.dimensionCardinal
  dimensionWellDefinedClosed : D.dimensionWellDefined

def BasisClosed (V : VectorSpacePackage) (B : BasisPackage V) : Prop :=
  B.spanning ∧ B.linearIndependence

def DimensionClosed (V : VectorSpacePackage) (D : DimensionPackage V) : Prop :=
  D.dimensionCardinal ∧ D.dimensionWellDefined

theorem basis_closed_from_evidence (V : VectorSpacePackage) (B : BasisPackage V) (E : BasisEvidence V B) : BasisClosed V B := by
  exact And.intro E.spanningClosed E.linearIndependenceClosed

theorem dimension_closed_from_evidence (V : VectorSpacePackage) (D : DimensionPackage V) (E : DimensionEvidence V D) : DimensionClosed V D := by
  exact And.intro E.dimensionCardinalClosed E.dimensionWellDefinedClosed

end LinearEquationsLinearAlgebraicAspectsTheoremCanonicalLaneLean
end HautevilleHouse