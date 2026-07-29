import LinearEquationsLinearAlgebraicAspectsTheorem.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace LinearEquationsLinearAlgebraicAspectsTheorem

open HautevilleHouse.CanonicalLaneMathlibCore

structure LinearAlgebraicSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure LinearAlgebraicAdmittedObject where
  space : LinearAlgebraicSpace
  linearStructure : Prop
  dimensionFinite : Prop
  basisConstructed : Prop
  conclusion : basisConstructed

structure LinearAlgebraicEndgameState where
  object : LinearAlgebraicAdmittedObject

def LinearAlgebraicWitnessClosed (O : LinearAlgebraicAdmittedObject) : Prop :=
  O.basisConstructed

end LinearEquationsLinearAlgebraicAspectsTheorem
end HautevilleHouse