import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscontinuousOrdinaryDifferentialEquationsFoundationCanonicalLaneLean

structure SingularPerturbationPackage where
  fastTimeScale : Type u
  slowTimeScale : Type v
  reducedSystem : Prop
  boundaryLayerCorrection : Prop
  invariantManifold : Prop

structure SingularPerturbationEvidence (S : SingularPerturbationPackage) where
  reducedSystemClosed : S.reducedSystem
  boundaryLayerCorrectionClosed : S.boundaryLayerCorrection
  invariantManifoldClosed : S.invariantManifold

def SingularPerturbationClosed (S : SingularPerturbationPackage) : Prop :=
  S.reducedSystem ∧ S.boundaryLayerCorrection ∧ S.invariantManifold

theorem singular_perturbation_closed_from_evidence
    (S : SingularPerturbationPackage) (E : SingularPerturbationEvidence S) :
    SingularPerturbationClosed S := by
  exact And.intro E.reducedSystemClosed
    (And.intro E.boundaryLayerCorrectionClosed E.invariantManifoldClosed)

end DiscontinuousOrdinaryDifferentialEquationsFoundationCanonicalLaneLean
end HautevilleHouse