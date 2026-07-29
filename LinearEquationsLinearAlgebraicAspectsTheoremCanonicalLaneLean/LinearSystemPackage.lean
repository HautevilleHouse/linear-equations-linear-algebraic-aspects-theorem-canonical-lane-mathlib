import LinearEquationsLinearAlgebraicAspectsTheorem.RiemannianCurvature

/-!
# Linear System Package
-/

namespace HautevilleHouse
namespace LinearEquationsLinearAlgebraicAspectsTheorem

structure LinearSystemPackage (G : LinearAlgebraicFoundationPackage) where
  coefficientMatrix : Type u
  constantVector : Type v
  solutionSet : Type w
  systemConsistent : Prop
  solutionSpaceDimension : Prop
  rankNullityTheorem : Prop
  fundamentalSolution : Prop

structure LinearSystemEvidence {G : LinearAlgebraicFoundationPackage}
    (L : LinearSystemPackage G) where
  systemConsistentClosed : L.systemConsistent
  solutionSpaceDimensionClosed : L.solutionSpaceDimension
  rankNullityTheoremClosed : L.rankNullityTheorem
  fundamentalSolutionClosed : L.fundamentalSolution

def LinearSystemPackageClosed {G : LinearAlgebraicFoundationPackage}
    (L : LinearSystemPackage G) : Prop :=
  L.systemConsistent ∧ L.solutionSpaceDimension ∧
  L.rankNullityTheorem ∧ L.fundamentalSolution

theorem linear_system_package_closed_from_evidence
    {G : LinearAlgebraicFoundationPackage} (L : LinearSystemPackage G)
    (E : LinearSystemEvidence L) : LinearSystemPackageClosed L := by
  exact And.intro E.systemConsistentClosed
    (And.intro E.solutionSpaceDimensionClosed
      (And.intro E.rankNullityTheoremClosed E.fundamentalSolutionClosed))

end LinearEquationsLinearAlgebraicAspectsTheorem
end HautevilleHouse