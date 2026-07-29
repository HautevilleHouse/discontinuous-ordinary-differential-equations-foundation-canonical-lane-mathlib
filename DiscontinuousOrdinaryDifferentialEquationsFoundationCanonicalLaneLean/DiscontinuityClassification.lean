import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscontinuousOrdinaryDifferentialEquationsFoundationCanonicalLaneLean

structure DiscontinuityClassificationPackage where
  jumpType : Prop
  essentialType : Prop
  removableType : Prop
  classificationComplete : Prop

structure DiscontinuityClassificationEvidence (P : DiscontinuityClassificationPackage) where
  jumpTypeClosed : P.jumpType
  essentialTypeClosed : P.essentialType
  removableTypeClosed : P.removableType
  classificationCompleteClosed : P.classificationComplete

def DiscontinuityClassificationClosed (P : DiscontinuityClassificationPackage) : Prop :=
  P.jumpType ∧ P.essentialType ∧ P.removableType ∧ P.classificationComplete

theorem discontinuity_classification_closed_from_evidence
    (P : DiscontinuityClassificationPackage)
    (E : DiscontinuityClassificationEvidence P) :
    DiscontinuityClassificationClosed P := by
  exact And.intro E.jumpTypeClosed
    (And.intro E.essentialTypeClosed
      (And.intro E.removableTypeClosed E.classificationCompleteClosed))

end DiscontinuousOrdinaryDifferentialEquationsFoundationCanonicalLaneLean
end HautevilleHouse
