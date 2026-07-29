import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearEquationsLinearAlgebraicAspectsTheoremCanonicalLaneLean

structure FundamentalSubspaces (K : Type) [Field K] where
  matrix : List (List K)
  columnSpaceBasis : List (List K)
  nullSpaceBasis : List (List K)
  rowSpaceBasis : List (List K)
  leftNullSpaceBasis : List (List K)

structure FundamentalSubspacesEvidence (F : FundamentalSubspaces K) where
  columnSpaceBasisClosed : F.columnSpaceBasis = (Matrix.columnSpaceBasis (Matrix.ofList F.matrix))
  nullSpaceBasisClosed : F.nullSpaceBasis = (Matrix.nullSpaceBasis (Matrix.ofList F.matrix))
  rowSpaceBasisClosed : F.rowSpaceBasis = (Matrix.rowSpaceBasis (Matrix.ofList F.matrix))
  leftNullSpaceBasisClosed : F.leftNullSpaceBasis = (Matrix.leftNullSpaceBasis (Matrix.ofList F.matrix))
  dimensionRelationsClosed : (List.length F.columnSpaceBasis) + (List.length F.nullSpaceBasis) = (Matrix.colCount (Matrix.ofList F.matrix)) ∧
    (List.length F.rowSpaceBasis) + (List.length F.leftNullSpaceBasis) = (Matrix.rowCount (Matrix.ofList F.matrix))

def FundamentalSubspacesClosed (F : FundamentalSubspaces K) : Prop :=
  F.columnSpaceBasis = (Matrix.columnSpaceBasis (Matrix.ofList F.matrix)) ∧
  F.nullSpaceBasis = (Matrix.nullSpaceBasis (Matrix.ofList F.matrix)) ∧
  F.rowSpaceBasis = (Matrix.rowSpaceBasis (Matrix.ofList F.matrix)) ∧
  F.leftNullSpaceBasis = (Matrix.leftNullSpaceBasis (Matrix.ofList F.matrix)) ∧
  (List.length F.columnSpaceBasis) + (List.length F.nullSpaceBasis) = (Matrix.colCount (Matrix.ofList F.matrix)) ∧
  (List.length F.rowSpaceBasis) + (List.length F.leftNullSpaceBasis) = (Matrix.rowCount (Matrix.ofList F.matrix))

theorem fundamental_subspaces_closed_from_evidence (F : FundamentalSubspaces K) (E : FundamentalSubspacesEvidence F) : FundamentalSubspacesClosed F := by
  exact And.intro E.columnSpaceBasisClosed (And.intro E.nullSpaceBasisClosed (And.intro E.rowSpaceBasisClosed (And.intro E.leftNullSpaceBasisClosed (And.intro E.dimensionRelationsClosed.left E.dimensionRelationsClosed.right))))

end LinearEquationsLinearAlgebraicAspectsTheoremCanonicalLaneLean
end HautevilleHouse