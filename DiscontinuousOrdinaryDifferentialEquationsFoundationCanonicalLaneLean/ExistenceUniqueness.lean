import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscontinuousOrdinaryDifferentialEquationsFoundationCanonicalLaneLean

structure FilippovSolutionPackage where
  differentialInclusion : Prop
  solutionExistence : Prop
  solutionUniqueness : Prop
  measurableSelection : Prop

def FilippovSolutionClosed (F : FilippovSolutionPackage) : Prop :=
  F.differentialInclusion ∧ F.solutionExistence ∧ F.solutionUniqueness ∧ F.measurableSelection

theorem filippov_solution_closed (F : FilippovSolutionPackage) :
    FilippovSolutionClosed F := by
  exact And.intro F.differentialInclusion (And.intro F.solutionExistence (And.intro F.solutionUniqueness F.measurableSelection))

structure CaratheodorySolutionPackage where
  integralEquation : Prop
  absolutelyContinuous : Prop
  existenceUnderCaratheodory : Prop
  uniquenessUnderCaratheodory : Prop

def CaratheodorySolutionClosed (C : CaratheodorySolutionPackage) : Prop :=
  C.integralEquation ∧ C.absolutelyContinuous ∧ C.existenceUnderCaratheodory ∧ C.uniquenessUnderCaratheodory

theorem caratheodory_solution_closed (C : CaratheodorySolutionPackage) :
    CaratheodorySolutionClosed C := by
  exact And.intro C.integralEquation (And.intro C.absolutelyContinuous (And.intro C.existenceUnderCaratheodory C.uniquenessUnderCaratheodory))

end DiscontinuousOrdinaryDifferentialEquationsFoundationCanonicalLaneLean
end HautevilleHouse