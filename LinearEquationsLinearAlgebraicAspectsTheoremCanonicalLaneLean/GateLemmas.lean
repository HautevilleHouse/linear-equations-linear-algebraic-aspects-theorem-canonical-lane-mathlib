import canonicalLaneMathlib.AdmissibleClass
import LinearEquationsLinearAlgebraicAspectsTheorem.BridgeLemmas

namespace HautevilleHouse
namespace LinearEquationsLinearAlgebraicAspectsTheorem

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end LinearEquationsLinearAlgebraicAspectsTheorem
end HautevilleHouse