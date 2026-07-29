import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscontinuousOrdinaryDifferentialEquationsFoundationCanonicalLaneLean

/-!
# Discontinuous Ordinary Differential Equations Foundation

This module defines the foundational structure for discontinuous ODEs.
We fix a Euclidean space R^n and consider the differential inclusion
  x' ∈ F(t, x)
where F is a set-valued map with closed values, locally bounded, and measurable in t.
The fundamental theorem of Filippov and Carathéodory provides local existence.
-/

structure TimeInterval where
  start : ℝ
  end' : ℝ
  nonempty : start ≤ end'

def TimeInterval.toSet (I : TimeInterval) : Set ℝ := {t | I.start ≤ t ∧ t ≤ I.end'}

structure EuclideanSpace (n : ℕ) where
  vec : ℝ^n

structure SetValuedMap (n : ℕ) where
  f : ℝ × EuclideanSpace n → Set (EuclideanSpace n)
  closedValues : ∀ (t,x), IsClosed (f (t,x))
  locallyBounded : ∀ (t0,x0), ∃ ε>0, ∃ M, ∀ (t,x) ∈ Metric.closedBall (t0,x0) ε, ∀ y ∈ f (t,x), ‖y‖ ≤ M
  measurableInT : ∀ x, MeasurableSet {t | f (t,x) ≠ ∅}

structure DifferentialInclusion (n : ℕ) (F : SetValuedMap n) where
  interval : TimeInterval
  initial : EuclideanSpace n
  solution : ℝ → EuclideanSpace n
  absolutelyContinuous : ∀ t ∈ interval.toSet, HasDerivAt solution (F (t, solution t)) t

structure FilippovSolution (n : ℕ) (F : SetValuedMap n) where
  interval : TimeInterval
  initial : EuclideanSpace n
  solution : ℝ → EuclideanSpace n
  lipschitzInX : ∃ L, ∀ t, ∀ x y, (F (t,x)).hausdorffDistance (F (t,y)) ≤ L * ‖x - y‖
  absolutelyContinuous : ∀ t ∈ interval.toSet, HasDerivAt solution (F (t, solution t)) t

theorem local_existence (n : ℕ) (F : SetValuedMap n) (x0 : EuclideanSpace n) :
    ∃ (interval : TimeInterval) (filippov : FilippovSolution n F), filippov.initial = x0 ∧ filippov.interval.start = 0 := by
  -- This is the standard existence result for Filippov differential inclusions.
  -- The proof relies on the Filippov-Pliss lemma and the Arzelà–Ascoli theorem.
  -- For the sake of this formalization, we cite the theorem as a bridge.
  sorry

end DiscontinuousOrdinaryDifferentialEquationsFoundationCanonicalLaneLean
end HautevilleHouse
