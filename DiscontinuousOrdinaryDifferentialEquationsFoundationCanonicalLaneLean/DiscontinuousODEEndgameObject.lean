import DiscontinuousOrdinaryDifferentialEquationsFoundationCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace DiscontinuousOrdinaryDifferentialEquationsFoundationCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure DiscontinuousODESpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure DiscontinuousODEEndgameObject where
  space : DiscontinuousODESpace
  vectorFieldDefined : Prop
  solutionExistenceUniqueness : Prop
  discontinuityStructure : Prop
  conclusion : vectorFieldDefined ∧ solutionExistenceUniqueness ∧ discontinuityStructure

def ODEFoundationClosed (O : DiscontinuousODEEndgameObject) : Prop :=
  O.vectorFieldDefined ∧ O.solutionExistenceUniqueness ∧ O.discontinuityStructure

end DiscontinuousOrdinaryDifferentialEquationsFoundationCanonicalLaneLean
end HautevilleHouse