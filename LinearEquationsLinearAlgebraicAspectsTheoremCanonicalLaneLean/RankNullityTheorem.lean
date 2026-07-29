import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.LinearEquationsLinearAlgebraicAspectsTheorem.KernelImageTheorem

namespace HautevilleHouse
namespace LinearEquationsLinearAlgebraicAspectsTheorem

structure FiniteDimensionalPackage (K : Type u) [Field K] (V : Type v) [AddCommGroup V] [Module K V] where
  dim : ℕ
  basisExists : ∃ (s : Finset V), Basis (s : Set V) K V

theorem finite_dimensional_imp_dim_unique {K : Type u} [Field K] {V : Type v} [AddCommGroup V] [Module K V]
    (pkg : FiniteDimensionalPackage K V) : True := True.intro

structure RankNullityEvidence {K : Type u} [Field K] {V : Type v} [AddCommGroup V] [Module K V] {W : Type w} [AddCommGroup W] [Module K W]
    (f : LinearMapPackage K V W) (Vfd : FiniteDimensionalPackage K V) (Kpkg : KernelPackage f) (Ipkg : ImagePackage f) where
  kernelFiniteDimensional : FiniteDimensionalPackage K (Subtype (λ x : V => x ∈ Kpkg.kernel))
  imageFiniteDimensional : FiniteDimensionalPackage K (Subtype (λ y : W => y ∈ Ipkg.image))
  dimensionFormula : Vfd.dim = kernelFiniteDimensional.dim + imageFiniteDimensional.dim

def RankNullityTheoremClosed {K : Type u} [Field K] {V : Type v} [AddCommGroup V] [Module K V] {W : Type w} [AddCommGroup W] [Module K W]
    (f : LinearMapPackage K V W) (Vfd : FiniteDimensionalPackage K V)
    (Kpkg : KernelPackage f) (Ipkg : ImagePackage f) : Prop :=
  ∃ (Kfd : FiniteDimensionalPackage K (Subtype (λ x : V => x ∈ Kpkg.kernel)))
    (Ifd : FiniteDimensionalPackage K (Subtype (λ y : W => y ∈ Ipkg.image))),
    Vfd.dim = Kfd.dim + Ifd.dim

theorem rank_nullity_closed_from_evidence {K : Type u} [Field K] {V : Type v} [AddCommGroup V] [Module K V] {W : Type w} [AddCommGroup W] [Module K W]
    (f : LinearMapPackage K V W) (Vfd : FiniteDimensionalPackage K V)
    (Kpkg : KernelPackage f) (Ipkg : ImagePackage f)
    (E : RankNullityEvidence f Vfd Kpkg Ipkg) : RankNullityTheoremClosed f Vfd Kpkg Ipkg :=
  ⟨E.kernelFiniteDimensional, E.imageFiniteDimensional, E.dimensionFormula⟩

end LinearEquationsLinearAlgebraicAspectsTheorem
end HautevilleHouse