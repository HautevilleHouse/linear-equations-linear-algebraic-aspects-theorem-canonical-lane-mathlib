import LinearEquationsLinearAlgebraicAspectsTheorem.LinearSystemPackage

/-!
# Linear Algebraic Foundation Package
-/

namespace HautevilleHouse
namespace LinearEquationsLinearAlgebraicAspectsTheorem

structure LinearAlgebraicFoundationPackage where
  vectorSpace : Type u
  field : Type v
  fieldStructure : Prop
  vectorSpaceAxioms : Prop
  linearMapSpace : Type w
  finiteDimensional : Prop
  basis : Type x

def LinearAlgebraicFoundationPackageClosed (G : LinearAlgebraicFoundationPackage) : Prop :=
  G.fieldStructure ∧ G.vectorSpaceAxioms ∧
  G.finiteDimensional ∧ (G.basis → True)

theorem linear_algebraic_foundation_package_closed
    (G : LinearAlgebraicFoundationPackage) : LinearAlgebraicFoundationPackageClosed G := by
  exact And.intro G.fieldStructure
    (And.intro G.vectorSpaceAxioms
      (And.intro G.finiteDimensional (by trivial)))

end LinearEquationsLinearAlgebraicAspectsTheorem
end HautevilleHouse