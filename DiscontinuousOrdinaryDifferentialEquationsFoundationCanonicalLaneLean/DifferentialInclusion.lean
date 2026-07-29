import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscontinuousOrdinaryDifferentialEquationsFoundationCanonicalLaneLean

structure DifferentialInclusionPackage where
  setValuedMap : Type u
  solutionConcept : Type v
  existenceTheorem : Prop
  selectionTheorem : Prop
  relaxationTheorem : Prop

structure DifferentialInclusionEvidence (D : DifferentialInclusionPackage) where
  existenceTheoremClosed : D.existenceTheorem
  selectionTheoremClosed : D.selectionTheorem
  relaxationTheoremClosed : D.relaxationTheorem

def DifferentialInclusionClosed (D : DifferentialInclusionPackage) : Prop :=
  D.existenceTheorem ∧ D.selectionTheorem ∧ D.relaxationTheorem

theorem differential_inclusion_closed_from_evidence
    (D : DifferentialInclusionPackage) (E : DifferentialInclusionEvidence D) :
    DifferentialInclusionClosed D := by
  exact And.intro E.existenceTheoremClosed
    (And.intro E.selectionTheoremClosed E.relaxationTheoremClosed)

end DiscontinuousOrdinaryDifferentialEquationsFoundationCanonicalLaneLean
end HautevilleHouse