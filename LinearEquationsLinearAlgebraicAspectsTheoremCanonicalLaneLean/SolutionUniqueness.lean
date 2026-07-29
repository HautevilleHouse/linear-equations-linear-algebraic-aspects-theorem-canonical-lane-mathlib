import canonicalLaneMathlib.AdmissibleClass
import LinearEquationsLinearAlgebraicAspectsTheorem.LinearAlgebraicObject

namespace HautevilleHouse
namespace LinearEquationsLinearAlgebraicAspectsTheorem

structure SolutionUniquenessPackage where
  nullspaceTrivial : Prop
  homogeneousOnlyTrivialSolution : Prop
  injectivityCondition : Prop

def SolutionUniquenessClosed (U : SolutionUniquenessPackage) : Prop :=
  U.nullspaceTrivial ∧ U.homogeneousOnlyTrivialSolution ∧ U.injectivityCondition

theorem solution_uniqueness_from_nullspace
    (U : SolutionUniquenessPackage) (h : U.nullspaceTrivial) : U.homogeneousOnlyTrivialSolution := by
  exact h

end LinearEquationsLinearAlgebraicAspectsTheorem
end HautevilleHouse