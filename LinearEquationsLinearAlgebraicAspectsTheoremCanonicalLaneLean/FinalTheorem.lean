import canonicalLaneMathlib.AdmissibleClass
import LinearEquationsLinearAlgebraicAspectsTheorem.GateLemmas

namespace HautevilleHouse
namespace LinearEquationsLinearAlgebraicAspectsTheorem

def ConstrainedLinearAlgebraicClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_linear_algebraic_endgame (A : AdmissibleClass) :
    ConstrainedLinearAlgebraicClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end LinearEquationsLinearAlgebraicAspectsTheorem
end HautevilleHouse