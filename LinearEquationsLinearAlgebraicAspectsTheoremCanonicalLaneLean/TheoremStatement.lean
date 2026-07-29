import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearEquationsLinearAlgebraicAspectsTheoremCanonicalLaneLean

structure LinearEquationsAdmittedObject where
  space : Type
  solutionSpace : Type
  linearEquationsSatisfied : Prop
  representationTheorem : Prop
  conclusion : representationTheorem

def LinearEquationsWitnessClosed (O : LinearEquationsAdmittedObject) : Prop :=
  O.representationTheorem

theorem linear_equations_witness_closed_from_object (O : LinearEquationsAdmittedObject) :
    LinearEquationsWitnessClosed O :=
  O.conclusion

end LinearEquationsLinearAlgebraicAspectsTheoremCanonicalLaneLean
end HautevilleHouse