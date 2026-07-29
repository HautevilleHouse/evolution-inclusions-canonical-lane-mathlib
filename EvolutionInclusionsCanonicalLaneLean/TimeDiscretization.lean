import HautevilleHouse.EvolutionInclusionsCanonicalLaneLean.EvolutionInclusionStructure

namespace HautevilleHouse
namespace EvolutionInclusionsCanonicalLaneLean

structure TimeDiscretizationPackage (H : EvolutionInclusionSpace) where
  implicitEulerScheme : Type u
  resolventStep : Type v
  discreteConvergence : Prop
  consistency : Prop
  stabilityAnalysis : Prop
  errorEstimate : Prop

structure TimeDiscretizationEvidence {H : EvolutionInclusionSpace}
    (T : TimeDiscretizationPackage H) where
  discreteConvergenceClosed : T.discreteConvergence
  consistencyClosed : T.consistency
  stabilityAnalysisClosed : T.stabilityAnalysis
  errorEstimateClosed : T.errorEstimate

def TimeDiscretizationClosed {H : EvolutionInclusionSpace}
    (T : TimeDiscretizationPackage H) : Prop :=
  T.discreteConvergence ∧ T.consistency ∧
  T.stabilityAnalysis ∧ T.errorEstimate

theorem time_discretization_closed_from_evidence
    {H : EvolutionInclusionSpace} (T : TimeDiscretizationPackage H)
    (E : TimeDiscretizationEvidence T) : TimeDiscretizationClosed T := by
  exact And.intro E.discreteConvergenceClosed
    (And.intro E.consistencyClosed
      (And.intro E.stabilityAnalysisClosed E.errorEstimateClosed))

end EvolutionInclusionsCanonicalLaneLean
end HautevilleHouse