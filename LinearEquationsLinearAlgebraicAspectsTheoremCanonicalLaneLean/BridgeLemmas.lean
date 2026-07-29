import canonicalLaneMathlib.AdmissibleClass
import LinearEquationsLinearAlgebraicAspectsTheorem.AdmissibleClass

namespace HautevilleHouse
namespace LinearEquationsLinearAlgebraicAspectsTheorem

def bridgeClosed (A : AdmissibleClass) : Prop :=
  LinearAlgebraicWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end LinearEquationsLinearAlgebraicAspectsTheorem
end HautevilleHouse