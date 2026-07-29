import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscontinuousOrdinaryDifferentialEquationsFoundationCanonicalLaneLean

structure UniquenessCounterexamplePackage (A : AdmissibleClass) where
  nonUniquenessConstructed : Prop
  peanoPhenomenon : Prop
  selectionCriterion : Prop
  continuousSelectionFailed : Prop

structure UniquenessCounterexampleEvidence {A : AdmissibleClass} (Pkg : UniquenessCounterexamplePackage A) where
  nonUniquenessConstructedClosed : Pkg.nonUniquenessConstructed
  peanoPhenomenonClosed : Pkg.peanoPhenomenon
  selectionCriterionClosed : Pkg.selectionCriterion
  continuousSelectionFailedClosed : Pkg.continuousSelectionFailed

def UniquenessCounterexampleClosed {A : AdmissibleClass} (Pkg : UniquenessCounterexamplePackage A) : Prop :=
  Pkg.nonUniquenessConstructed ∧ Pkg.peanoPhenomenon ∧ Pkg.selectionCriterion ∧ Pkg.continuousSelectionFailed

theorem uniqueness_counterexample_closed_from_evidence {A : AdmissibleClass} (Pkg : UniquenessCounterexamplePackage A) (E : UniquenessCounterexampleEvidence Pkg) : UniquenessCounterexampleClosed Pkg := by
  exact And.intro E.nonUniquenessConstructedClosed (And.intro E.peanoPhenomenonClosed (And.intro E.selectionCriterionClosed E.continuousSelectionFailedClosed))

end DiscontinuousOrdinaryDifferentialEquationsFoundationCanonicalLaneLean
end HautevilleHouse
