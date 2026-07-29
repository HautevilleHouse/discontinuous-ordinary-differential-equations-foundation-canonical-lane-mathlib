import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscontinuousOrdinaryDifferentialEquationsFoundationCanonicalLaneLean

structure ExistenceTheoremPackage (A : AdmissibleClass) where
  upperSemicontinuousMap : Prop
  locallyIntegrableBound : Prop
  solutionDefinedOnInterval : Prop
  caratheodoryConditions : Prop

structure ExistenceTheoremEvidence {A : AdmissibleClass} (Pkg : ExistenceTheoremPackage A) where
  upperSemicontinuousMapClosed : Pkg.upperSemicontinuousMap
  locallyIntegrableBoundClosed : Pkg.locallyIntegrableBound
  solutionDefinedOnIntervalClosed : Pkg.solutionDefinedOnInterval
  caratheodoryConditionsClosed : Pkg.caratheodoryConditions

def ExistenceTheoremClosed {A : AdmissibleClass} (Pkg : ExistenceTheoremPackage A) : Prop :=
  Pkg.upperSemicontinuousMap ∧ Pkg.locallyIntegrableBound ∧ Pkg.solutionDefinedOnInterval ∧ Pkg.caratheodoryConditions

theorem existence_theorem_closed_from_evidence {A : AdmissibleClass} (Pkg : ExistenceTheoremPackage A) (E : ExistenceTheoremEvidence Pkg) : ExistenceTheoremClosed Pkg := by
  exact And.intro E.upperSemicontinuousMapClosed (And.intro E.locallyIntegrableBoundClosed (And.intro E.solutionDefinedOnIntervalClosed E.caratheodoryConditionsClosed))

end DiscontinuousOrdinaryDifferentialEquationsFoundationCanonicalLaneLean
end HautevilleHouse
