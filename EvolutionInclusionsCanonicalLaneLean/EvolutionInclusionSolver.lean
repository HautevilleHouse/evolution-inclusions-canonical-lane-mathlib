import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EvolutionInclusionsCanonicalLaneLean

structure EvolutionInclusionPackage where
  domainType : Type u
  multivaluedOperator : domainType → Set (domainType)
  timeDependence : ℝ → domainType → Set (domainType)
  initialCondition : domainType
  absoluteContinuity : Prop
  differentialInclusion : Prop
  maximalSolution : Prop

structure EvolutionInclusionEvidence (E : EvolutionInclusionPackage) where
  absoluteContinuityClosed : E.absoluteContinuity
  differentialInclusionClosed : E.differentialInclusion
  maximalSolutionClosed : E.maximalSolution

def EvolutionInclusionClosed (E : EvolutionInclusionPackage) : Prop :=
  E.absoluteContinuity ∧ E.differentialInclusion ∧ E.maximalSolution

theorem evolution_inclusion_closed_from_evidence
    (E : EvolutionInclusionPackage) (Ev : EvolutionInclusionEvidence E) :
    EvolutionInclusionClosed E := by
  exact And.intro Ev.absoluteContinuityClosed
    (And.intro Ev.differentialInclusionClosed Ev.maximalSolutionClosed)

end EvolutionInclusionsCanonicalLaneLean
end HautevilleHouse
