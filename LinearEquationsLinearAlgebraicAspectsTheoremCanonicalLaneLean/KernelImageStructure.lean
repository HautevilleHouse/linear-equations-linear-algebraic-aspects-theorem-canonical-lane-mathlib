import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearEquationsLinearAlgebraicAspectsTheoremCanonicalLaneLean

structure KernelImagePackage {V W : VectorSpacePackage} (L : LinearMapPackage V W) where
  kernel : Set V.vectorSpaceType
  image : Set W.vectorSpaceType
  kernelDef : kernel = {v | L.underlyingFunction v = V.zeroVector}
  imageDef : image = {w | ∃ v : V.vectorSpaceType, L.underlyingFunction v = w}
  kernelSubspace : Subspace V kernel
  imageSubspace : Subspace W image

structure KernelImageEvidence {V W : VectorSpacePackage} {L : LinearMapPackage V W} (K : KernelImagePackage L) where
  kernelDefClosed : K.kernelDef
  imageDefClosed : K.imageDef
  kernelSubspaceClosed : K.kernelSubspace
  imageSubspaceClosed : K.imageSubspace

def KernelImageClosed {V W : VectorSpacePackage} {L : LinearMapPackage V W} (K : KernelImagePackage L) : Prop :=
  K.kernelDef ∧ K.imageDef ∧ K.kernelSubspace ∧ K.imageSubspace

theorem kernel_image_closed_from_evidence {V W : VectorSpacePackage} {L : LinearMapPackage V W} (K : KernelImagePackage L) (E : KernelImageEvidence K) : KernelImageClosed K := by
  exact And.intro E.kernelDefClosed (And.intro E.imageDefClosed (And.intro E.kernelSubspaceClosed E.imageSubspaceClosed))

end LinearEquationsLinearAlgebraicAspectsTheoremCanonicalLaneLean
end HautevilleHouse