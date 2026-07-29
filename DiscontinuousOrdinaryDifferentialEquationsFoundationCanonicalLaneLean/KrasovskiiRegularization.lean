import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscontinuousOrdinaryDifferentialEquationsFoundationCanonicalLaneLean

structure KrasovskiiRegularizationPackage (A : AdmissibleClass) where
  discontinuousVectorField : Prop
  convexClosedRegularization : Prop
  setValuedMapDefined : Prop
  regularizationProperties : Prop

structure KrasovskiiRegularizationEvidence {A : AdmissibleClass} (Pkg : KrasovskiiRegularizationPackage A) where
  discontinuousVectorFieldClosed : Pkg.discontinuousVectorField
  convexClosedRegularizationClosed : Pkg.convexClosedRegularization
  setValuedMapDefinedClosed : Pkg.setValuedMapDefined
  regularizationPropertiesClosed : Pkg.regularizationProperties

def KrasovskiiRegularizationClosed {A : AdmissibleClass} (Pkg : KrasovskiiRegularizationPackage A) : Prop :=
  Pkg.discontinuousVectorField ∧ Pkg.convexClosedRegularization ∧ Pkg.setValuedMapDefined ∧ Pkg.regularizationProperties

theorem krasovskii_regularization_closed_from_evidence {A : AdmissibleClass} (Pkg : KrasovskiiRegularizationPackage A) (E : KrasovskiiRegularizationEvidence Pkg) : KrasovskiiRegularizationClosed Pkg := by
  exact And.intro E.discontinuousVectorFieldClosed (And.intro E.convexClosedRegularizationClosed (And.intro E.setValuedMapDefinedClosed E.regularizationPropertiesClosed))

end DiscontinuousOrdinaryDifferentialEquationsFoundationCanonicalLaneLean
end HautevilleHouse
