import DiscontinuousOrdinaryDifferentialEquationsFoundationCanonicalLaneLean.FilippovSolution

namespace HautevilleHouse
namespace DiscontinuousOrdinaryDifferentialEquationsFoundationCanonicalLaneLean

structure SlidingModePackage {O : DiscontinuousODEEndgameObject}
    (F : FilippovSolutionPackage O) where
  slidingSurface : Prop
  equivalentControl : Prop
  chatteringBehavior : Prop
  stabilityAnalysis : Prop

structure SlidingModeEvidence {O : DiscontinuousODEEndgameObject}
    {F : FilippovSolutionPackage O} (S : SlidingModePackage F) where
  slidingSurfaceClosed : S.slidingSurface
  equivalentControlClosed : S.equivalentControl
  chatteringBehaviorClosed : S.chatteringBehavior
  stabilityAnalysisClosed : S.stabilityAnalysis

def SlidingModeClosed {O : DiscontinuousODEEndgameObject}
    {F : FilippovSolutionPackage O} (S : SlidingModePackage F) : Prop :=
  S.slidingSurface ∧ S.equivalentControl ∧ S.chatteringBehavior ∧ S.stabilityAnalysis

theorem sliding_mode_closed_from_evidence
    {O : DiscontinuousODEEndgameObject} {F : FilippovSolutionPackage O}
    (S : SlidingModePackage F) (E : SlidingModeEvidence S) : SlidingModeClosed S := by
  exact And.intro E.slidingSurfaceClosed
    (And.intro E.equivalentControlClosed
      (And.intro E.chatteringBehaviorClosed E.stabilityAnalysisClosed))

end DiscontinuousOrdinaryDifferentialEquationsFoundationCanonicalLaneLean
end HautevilleHouse