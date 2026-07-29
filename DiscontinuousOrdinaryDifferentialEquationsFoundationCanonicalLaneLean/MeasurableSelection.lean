import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscontinuousOrdinaryDifferentialEquationsFoundationCanonicalLaneLean

structure MeasurableSelectionPackage (A : AdmissibleClass) where
  setValuedMapMeasurable : Prop
  measurableSelectionExists : Prop
  selectionMeasurableFunction : Prop
  approximateSelection : Prop

structure MeasurableSelectionEvidence {A : AdmissibleClass} (Pkg : MeasurableSelectionPackage A) where
  setValuedMapMeasurableClosed : Pkg.setValuedMapMeasurable
  measurableSelectionExistsClosed : Pkg.measurableSelectionExists
  selectionMeasurableFunctionClosed : Pkg.selectionMeasurableFunction
  approximateSelectionClosed : Pkg.approximateSelection

def MeasurableSelectionClosed {A : AdmissibleClass} (Pkg : MeasurableSelectionPackage A) : Prop :=
  Pkg.setValuedMapMeasurable ∧ Pkg.measurableSelectionExists ∧ Pkg.selectionMeasurableFunction ∧ Pkg.approximateSelection

theorem measurable_selection_closed_from_evidence {A : AdmissibleClass} (Pkg : MeasurableSelectionPackage A) (E : MeasurableSelectionEvidence Pkg) : MeasurableSelectionClosed Pkg := by
  exact And.intro E.setValuedMapMeasurableClosed (And.intro E.measurableSelectionExistsClosed (And.intro E.selectionMeasurableFunctionClosed E.approximateSelectionClosed))

end DiscontinuousOrdinaryDifferentialEquationsFoundationCanonicalLaneLean
end HautevilleHouse
