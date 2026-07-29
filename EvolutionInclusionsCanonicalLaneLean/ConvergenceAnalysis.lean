import canonicalLaneMathlib.AdmissibleClass

/-!
# Convergence Analysis Package for Evolution Inclusions
-/

namespace HautevilleHouse
namespace EvolutionInclusionsCanonicalLaneLean

structure ConvergenceAnalysis (M : EvolutionInclusionModel) (D : DiscretizationScheme M) where
  weakConvergence : Prop
  strongConvergence : Prop
  rateOfConvergence : ℝ → Prop
  numericalStability : Prop
  consistencyStabilityWeak : D.consistencyCondition ∧ D.stabilityCondition → weakConvergence

structure ConvergenceEvidence {M : EvolutionInclusionModel} {D : DiscretizationScheme M}
    (C : ConvergenceAnalysis M D) where
  weakConvergenceClosed : C.weakConvergence
  strongConvergenceClosed : C.strongConvergence
  rateOfConvergenceClosed : C.rateOfConvergence
  numericalStabilityClosed : C.numericalStability

def ConvergenceClosed {M : EvolutionInclusionModel} {D : DiscretizationScheme M}
    (C : ConvergenceAnalysis M D) : Prop :=
  C.weakConvergence ∧ C.strongConvergence ∧ C.numericalStability

theorem convergence_closed_from_evidence
    {M : EvolutionInclusionModel} {D : DiscretizationScheme M}
    (C : ConvergenceAnalysis M D) (E : ConvergenceEvidence C) : ConvergenceClosed C := by
  exact And.intro E.weakConvergenceClosed
    (And.intro E.strongConvergenceClosed E.numericalStabilityClosed)

end EvolutionInclusionsCanonicalLaneLean
end HautevilleHouse
