import canonicalLaneMathlib.AdmissibleClass

/-!
# Endpoint Stability Package for Evolution Inclusions
-/

namespace HautevilleHouse
namespace EvolutionInclusionsCanonicalLaneLean

structure EndpointStability (M : EvolutionInclusionModel) (D : DiscretizationScheme M) (C : ConvergenceAnalysis M D) where
  limitPoint : M.stateSpace
  isSolution : Prop
  uniqueness : Prop
  attractivity : Prop
  stabilityUnderPerturbations : Prop
  limitPointClosed : isSolution → uniqueness → attractivity

structure EndpointStabilityEvidence {M : EvolutionInclusionModel} {D : DiscretizationScheme M}
    {C : ConvergenceAnalysis M D} (E : EndpointStability M D C) where
  isSolutionClosed : E.isSolution
  uniquenessClosed : E.uniqueness
  attractivityClosed : E.attractivity
  stabilityUnderPerturbationsClosed : E.stabilityUnderPerturbations

def EndpointStabilityClosed {M : EvolutionInclusionModel} {D : DiscretizationScheme M}
    {C : ConvergenceAnalysis M D} (E : EndpointStability M D C) : Prop :=
  E.isSolution ∧ E.uniqueness ∧ E.attractivity ∧ E.stabilityUnderPerturbations

theorem endpoint_stability_closed_from_evidence
    {M : EvolutionInclusionModel} {D : DiscretizationScheme M}
    {C : ConvergenceAnalysis M D} (E : EndpointStability M D C)
    (Ev : EndpointStabilityEvidence E) : EndpointStabilityClosed E := by
  exact And.intro Ev.isSolutionClosed
    (And.intro Ev.uniquenessClosed
      (And.intro Ev.attractivityClosed Ev.stabilityUnderPerturbationsClosed))

end EvolutionInclusionsCanonicalLaneLean
end HautevilleHouse
