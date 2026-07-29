import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.LinearEquationsLinearAlgebraicAspectsTheorem.LinearMapStructure

namespace HautevilleHouse
namespace LinearEquationsLinearAlgebraicAspectsTheorem

structure KernelPackage {K : Type u} [Field K] {V : Type v} [AddCommGroup V] [Module K V] {W : Type w} [AddCommGroup W] [Module K W]
    (f : LinearMapPackage K V W) where
  kernel : AddSubgroup V
  kernelContainsZero : (0 : V) ∈ kernel
  kernelAddClosed : ∀ x y, x ∈ kernel → y ∈ kernel → x + y ∈ kernel
  kernelSmulClosed : ∀ (a : K) (x : V), x ∈ kernel → a • x ∈ kernel
  kernelChar : ∀ x : V, x ∈ kernel ↔ f.toFun x = (0 : W)

structure ImagePackage {K : Type u} [Field K] {V : Type v} [AddCommGroup V] [Module K V] {W : Type w} [AddCommGroup W] [Module K W]
    (f : LinearMapPackage K V W) where
  image : AddSubgroup W
  imageContainsZero : (0 : W) ∈ image
  imageAddClosed : ∀ x y, x ∈ image → y ∈ image → x + y ∈ image
  imageSmulClosed : ∀ (a : K) (x : W), x ∈ image → a • x ∈ image
  imageChar : ∀ y : W, y ∈ image ↔ ∃ (x : V), f.toFun x = y

structure KernelImageEvidence {K : Type u} [Field K] {V : Type v} [AddCommGroup V] [Module K V] {W : Type w} [AddCommGroup W] [Module K W]
    (f : LinearMapPackage K V W) (Kpkg : KernelPackage f) (Ipkg : ImagePackage f) where
  kernelClosed : KernelPackage.zeroAdd Kpkg
  imageClosed : Ipkg.imageChar = Kpkg.kernelChar

def KernelImageTheoremClosed {K : Type u} [Field K] {V : Type v} [AddCommGroup V] [Module K V] {W : Type w} [AddCommGroup W] [Module K W]
    (f : LinearMapPackage K V W) (Kpkg : KernelPackage f) (Ipkg : ImagePackage f) : Prop :=
  (∀ x : V, x ∈ Kpkg.kernel ↔ f.toFun x = (0 : W)) ∧
  (∀ y : W, y ∈ Ipkg.image ↔ ∃ (x : V), f.toFun x = y)

theorem kernel_image_closed_from_evidence {K : Type u} [Field K] {V : Type v} [AddCommGroup V] [Module K V] {W : Type w} [AddCommGroup W] [Module K W]
    (f : LinearMapPackage K V W) (Kpkg : KernelPackage f) (Ipkg : ImagePackage f)
    (E : KernelImageEvidence f Kpkg Ipkg) : KernelImageTheoremClosed f Kpkg Ipkg :=
  And.intro Kpkg.kernelChar Ipkg.imageChar

end LinearEquationsLinearAlgebraicAspectsTheorem
end HautevilleHouse