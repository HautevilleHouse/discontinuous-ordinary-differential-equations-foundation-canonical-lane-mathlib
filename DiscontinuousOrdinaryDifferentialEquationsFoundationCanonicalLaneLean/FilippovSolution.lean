import DiscontinuousOrdinaryDifferentialEquationsFoundationCanonicalLaneLean.DiscontinuousODEEndgameObject

namespace HautevilleHouse
namespace DiscontinuousOrdinaryDifferentialEquationsFoundationCanonicalLaneLean

structure FilippovSolutionPackage (O : DiscontinuousODEEndgameObject) where
  differentialInclusion : Prop
  measurableSelection : Prop
  solutionExistence : Prop
  solutionUniqueness : Prop
  stability : Prop

structure FilippovSolutionEvidence {O : DiscontinuousODEEndgameObject} (F : FilippovSolutionPackage O) where
  differentialInclusionClosed : F.differentialInclusion
  measurableSelectionClosed : F.measurableSelection
  solutionExistenceClosed : F.solutionExistence
  solutionUniquenessClosed : F.solutionUniqueness
  stabilityClosed : F.stability

def FilippovSolutionClosed {O : DiscontinuousODEEndgameObject} (F : FilippovSolutionPackage O) : Prop :=
  F.differentialInclusion ∧ F.measurableSelection ∧ F.solutionExistence ∧ F.solutionUniqueness ∧ F.stability

theorem filippov_solution_closed_from_evidence
    {O : DiscontinuousODEEndgameObject} (F : FilippovSolutionPackage O)
    (E : FilippovSolutionEvidence F) : FilippovSolutionClosed F := by
  exact And.intro E.differentialInclusionClosed
    (And.intro E.measurableSelectionClosed
      (And.intro E.solutionExistenceClosed
        (And.intro E.solutionUniquenessClosed E.stabilityClosed)))

end DiscontinuousOrdinaryDifferentialEquationsFoundationCanonicalLaneLean
end HautevilleHouse