import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscontinuousOrdinaryDifferentialEquationsFoundationCanonicalLaneLean

structure DiscontinuitySurface where
  carrier : Type
  jumpCondition : carrier → Prop
  surfaceRegular : Prop

def discontinuitySurfaceClosed (D : DiscontinuitySurface) : Prop :=
  D.surfaceRegular

theorem bridge_from_discontinuity_surface (D : DiscontinuitySurface) :
    discontinuitySurfaceClosed D := by
  exact D.surfaceRegular

structure DiscontinuityModelPackage where
  surface : DiscontinuitySurface
  vectorFieldOnSmooth : Prop
  vectorFieldAcrossJump : Prop
  consistencyCondition : Prop

def DiscontinuityModelClosed (M : DiscontinuityModelPackage) : Prop :=
  M.vectorFieldOnSmooth ∧ M.vectorFieldAcrossJump ∧ M.consistencyCondition

theorem discontinuity_model_closed (M : DiscontinuityModelPackage) :
    DiscontinuityModelClosed M := by
  exact And.intro M.vectorFieldOnSmooth (And.intro M.vectorFieldAcrossJump M.consistencyCondition)

end DiscontinuousOrdinaryDifferentialEquationsFoundationCanonicalLaneLean
end HautevilleHouse