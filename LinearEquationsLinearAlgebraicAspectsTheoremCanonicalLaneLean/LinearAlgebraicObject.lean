import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearEquationsLinearAlgebraicAspectsTheorem

structure LinearAlgebraicObject where
  systemType : Type
  solutionSpace : Type
  matrixRepresentation : Type
  invertibleCondition : Prop
  solutionExistence : Prop
  solutionUniqueness : Prop
  conclusion : invertibleCondition ∧ solutionExistence ∧ solutionUniqueness

def LinearAlgebraicWitnessClosed (O : LinearAlgebraicObject) : Prop :=
  O.invertibleCondition ∧ O.solutionExistence ∧ O.solutionUniqueness

end LinearEquationsLinearAlgebraicAspectsTheorem
end HautevilleHouse