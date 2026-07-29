import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscontinuousOrdinaryDifferentialEquationsFoundationCanonicalLaneLean

structure FilippovPackage where
  diffInclusion : Type u
  setValuedMapExistence : Prop
  convexValuedUpperSemicontinuous : Prop
  solutionTubes : Prop

structure FilippovEvidence (F : FilippovPackage) where
  setValuedMapExistenceClosed : F.setValuedMapExistence
  convexValuedUpperSemicontinuousClosed : F.convexValuedUpperSemicontinuous
  solutionTubesClosed : F.solutionTubes

def FilippovClosed (F : FilippovPackage) : Prop :=
  F.setValuedMapExistence ∧ F.convexValuedUpperSemicontinuous ∧ F.solutionTubes

theorem filippov_closed_from_evidence (F : FilippovPackage) (E : FilippovEvidence F) :
    FilippovClosed F := by
  exact And.intro E.setValuedMapExistenceClosed
    (And.intro E.convexValuedUpperSemicontinuousClosed E.solutionTubesClosed)

end DiscontinuousOrdinaryDifferentialEquationsFoundationCanonicalLaneLean
end HautevilleHouse