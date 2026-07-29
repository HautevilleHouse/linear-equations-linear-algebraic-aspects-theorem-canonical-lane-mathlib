import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearEquationsLinearAlgebraicAspectsTheorem

structure VectorSpacePackage (K : Type u) [Field K] (V : Type v) [AddCommGroup V] [Module K V] where
  zeroVector : V
  addAssociative : ∀ u v w : V, (u + v) + w = u + (v + w)
  zeroAdd : ∀ v : V, 0 + v = v
  addZero : ∀ v : V, v + 0 = v
  negAdd : ∀ v : V, v + (-v) = 0
  addNeg : ∀ v : V, (-v) + v = 0
  addCommutative : ∀ u v : V, u + v = v + u
  smulAssociative : ∀ (a b : K) (v : V), (a * b) • v = a • (b • v)
  oneSmul : ∀ v : V, (1 : K) • v = v
  smulAdd : ∀ (a : K) (u v : V), a • (u + v) = a • u + a • v
  addSmul : ∀ (a b : K) (v : V), (a + b) • v = a • v + b • v

structure VectorSpaceEvidence {K : Type u} [Field K] {V : Type v} [AddCommGroup V] [Module K V] (pkg : VectorSpacePackage K V) where
  zeroAddClosed : pkg.zeroAdd
  addZeroClosed : pkg.addZero
  negAddClosed : pkg.negAdd
  addNegClosed : pkg.addNeg
  addAssociativeClosed : pkg.addAssociative
  addCommutativeClosed : pkg.addCommutative
  smulAssociativeClosed : pkg.smulAssociative
  oneSmulClosed : pkg.oneSmul
  smulAddClosed : pkg.smulAdd
  addSmulClosed : pkg.addSmul

def VectorSpaceClosed {K : Type u} [Field K] {V : Type v} [AddCommGroup V] [Module K V] (pkg : VectorSpacePackage K V) : Prop :=
  pkg.zeroAdd ∧ pkg.addZero ∧ pkg.negAdd ∧ pkg.addNeg ∧
  pkg.addAssociative ∧ pkg.addCommutative ∧
  pkg.smulAssociative ∧ pkg.oneSmul ∧ pkg.smulAdd ∧ pkg.addSmul

theorem vector_space_closed_from_evidence {K : Type u} [Field K] {V : Type v} [AddCommGroup V] [Module K V]
    (pkg : VectorSpacePackage K V) (E : VectorSpaceEvidence pkg) : VectorSpaceClosed pkg :=
  And.intro E.zeroAddClosed (
    And.intro E.addZeroClosed (
      And.intro E.negAddClosed (
        And.intro E.addNegClosed (
          And.intro E.addAssociativeClosed (
            And.intro E.addCommutativeClosed (
              And.intro E.smulAssociativeClosed (
                And.intro E.oneSmulClosed (
                  And.intro E.smulAddClosed E.addSmulClosed))))))))

end LinearEquationsLinearAlgebraicAspectsTheorem
end HautevilleHouse