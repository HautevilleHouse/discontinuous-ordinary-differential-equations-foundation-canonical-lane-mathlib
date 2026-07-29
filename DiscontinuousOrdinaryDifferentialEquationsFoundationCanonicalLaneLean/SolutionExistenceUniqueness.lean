import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscontinuousOrdinaryDifferentialEquationsFoundationCanonicalLaneLean

structure SolutionExistenceUniquenessPackage where
  existenceInterval : Prop
  uniquenessInClass : Prop
  caratheodorySolution : Prop
  generalisedSolution : Prop

structure SolutionExistenceUniquenessEvidence
    (P : SolutionExistenceUniquenessPackage) where
  existenceIntervalClosed : P.existenceInterval
  uniquenessInClassClosed : P.uniquenessInClass
  caratheodorySolutionClosed : P.caratheodorySolution
  generalisedSolutionClosed : P.generalisedSolution

def SolutionExistenceUniquenessClosed
    (P : SolutionExistenceUniquenessPackage) : Prop :=
  P.existenceInterval ∧ P.uniquenessInClass ∧
  P.caratheodorySolution ∧ P.generalisedSolution

theorem solution_existence_uniqueness_closed_from_evidence
    (P : SolutionExistenceUniquenessPackage)
    (E : SolutionExistenceUniquenessEvidence P) :
    SolutionExistenceUniquenessClosed P := by
  exact And.intro E.existenceIntervalClosed
    (And.intro E.uniquenessInClassClosed
      (And.intro E.caratheodorySolutionClosed
        E.generalisedSolutionClosed))

end DiscontinuousOrdinaryDifferentialEquationsFoundationCanonicalLaneLean
end HautevilleHouse
