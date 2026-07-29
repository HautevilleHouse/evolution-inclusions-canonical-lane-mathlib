import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EvolutionInclusionsCanonicalLaneLean

structure AsymptoticBehavior {X : Type} [NormedAddCommGroup X] [InnerProductSpace ℝ X] where
  solutionFamily : ℝ → X
  longTimeLimit : X
  weakConvergence : Prop
  strongConvergenceUnderRegularity : Prop
  convergenceRate : ℝ
  weakConvergenceTerm : weakConvergence
  strongConvergenceUnderRegularityTerm : strongConvergenceUnderRegularity
  convergenceRateTerm : convergenceRate > 0

structure AsymptoticEvidence {X : Type} [NormedAddCommGroup X] [InnerProductSpace ℝ X]
    (A : AsymptoticBehavior X) where
  weakConvergenceClosed : A.weakConvergence
  strongConvergenceUnderRegularityClosed : A.strongConvergenceUnderRegularity
  convergenceRateClosed : A.convergenceRate > 0

def AsymptoticBehaviorClosed {X : Type} [NormedAddCommGroup X] [InnerProductSpace ℝ X]
    (A : AsymptoticBehavior X) : Prop :=
  A.weakConvergence ∧ A.strongConvergenceUnderRegularity ∧ A.convergenceRate > 0

theorem asymptotic_behavior_closed_from_evidence {X : Type} [NormedAddCommGroup X] [InnerProductSpace ℝ X]
    (A : AsymptoticBehavior X) (E : AsymptoticEvidence A) :
    AsymptoticBehaviorClosed A := by
  exact And.intro E.weakConvergenceClosed (And.intro E.strongConvergenceUnderRegularityClosed E.convergenceRateClosed)

end EvolutionInclusionsCanonicalLaneLean
end HautevilleHouse
