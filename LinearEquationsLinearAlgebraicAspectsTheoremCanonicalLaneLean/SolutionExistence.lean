import canonicalLaneMathlib.AdmissibleClass
import LinearEquationsLinearAlgebraicAspectsTheorem.LinearAlgebraicObject

namespace HautevilleHouse
namespace LinearEquationsLinearAlgebraicAspectsTheorem

structure SolutionExistencePackage where
  consistentSystem : Prop
  particularSolution : Prop
  homogeneousSolutionSpace : Type

def SolutionExistenceClosed (S : SolutionExistencePackage) : Prop :=
  S.consistentSystem ∧ S.particularSolution

theorem solution_existence_from_particular
    (S : SolutionExistencePackage) (h : S.particularSolution) : S.consistentSystem := by
  exact h

end LinearEquationsLinearAlgebraicAspectsTheorem
end HautevilleHouse