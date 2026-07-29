import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscontinuousOrdinaryDifferentialEquationsFoundationCanonicalLaneLean

structure SlidingModesPackage where
  slidingSurfaceDefined : Prop
  equivalentControl : Prop
  finiteTimeReachability : Prop
  chatteringBehaviour : Prop

structure SlidingModesEvidence (P : SlidingModesPackage) where
  slidingSurfaceDefinedClosed : P.slidingSurfaceDefined
  equivalentControlClosed : P.equivalentControl
  finiteTimeReachabilityClosed : P.finiteTimeReachability
  chatteringBehaviourClosed : P.chatteringBehaviour

def SlidingModesClosed (P : SlidingModesPackage) : Prop :=
  P.slidingSurfaceDefined ∧ P.equivalentControl ∧
  P.finiteTimeReachability ∧ P.chatteringBehaviour

theorem sliding_modes_closed_from_evidence
    (P : SlidingModesPackage)
    (E : SlidingModesEvidence P) :
    SlidingModesClosed P := by
  exact And.intro E.slidingSurfaceDefinedClosed
    (And.intro E.equivalentControlClosed
      (And.intro E.finiteTimeReachabilityClosed
        E.chatteringBehaviourClosed))

end DiscontinuousOrdinaryDifferentialEquationsFoundationCanonicalLaneLean
end HautevilleHouse
