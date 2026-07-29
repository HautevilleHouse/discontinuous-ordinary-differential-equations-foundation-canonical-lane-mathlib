import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscontinuousOrdinaryDifferentialEquationsFoundationCanonicalLaneLean

def DiscontinuousODEClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem discontinuous_ode_endgame (A : AdmissibleClass) :
    DiscontinuousODEClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DiscontinuousOrdinaryDifferentialEquationsFoundationCanonicalLaneLean
end HautevilleHouse
