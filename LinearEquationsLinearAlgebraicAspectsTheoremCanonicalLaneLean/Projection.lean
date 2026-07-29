import LinearEquationsLinearAlgebraicAspectsTheorem.AdmissibleClass

namespace HautevilleHouse
namespace LinearEquationsLinearAlgebraicAspectsTheorem

open HautevilleHouse.CanonicalLaneMathlibCore

def linearAlgebraicProjection : Projection LinearAlgebraicEndgameState :=
  { toFun := fun x => x,
    idempotent := by intro x; rfl
  }

theorem linearAlgebraic_projection_idempotent (x : LinearAlgebraicEndgameState) :
    linearAlgebraicProjection.toFun (linearAlgebraicProjection.toFun x) = linearAlgebraicProjection.toFun x := by
  exact linearAlgebraicProjection.idempotent x

end LinearEquationsLinearAlgebraicAspectsTheorem
end HautevilleHouse