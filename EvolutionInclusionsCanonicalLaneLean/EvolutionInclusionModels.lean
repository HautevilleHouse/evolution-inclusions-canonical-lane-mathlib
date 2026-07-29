import canonicalLaneMathlib.AdmissibleClass

/-!
# Evolution Inclusion Models Package
-/

namespace HautevilleHouse
namespace EvolutionInclusionsCanonicalLaneLean

structure EvolutionInclusionModel where
  stateSpace : Type u
  timeDomain : Type v
  initialCondition : stateSpace
  monotoneOperator : stateSpace → Set (stateSpace)
  maximalMonotone : Prop
  weaklyContinuous : Prop
  initialConditionClosed : initialCondition ∈ maximalMonotone

structure EvolutionInclusionEvidence (M : EvolutionInclusionModel) where
  maximalMonotoneClosed : M.maximalMonotone
  weaklyContinuousClosed : M.weaklyContinuous
  initialConditionClosed : M.initialConditionClosed

def EvolutionInclusionModelClosed (M : EvolutionInclusionModel) : Prop :=
  M.maximalMonotone ∧ M.weaklyContinuous ∧ M.initialConditionClosed

theorem evolution_inclusion_model_closed_from_evidence
    (M : EvolutionInclusionModel) (E : EvolutionInclusionEvidence M) :
    EvolutionInclusionModelClosed M := by
  exact And.intro E.maximalMonotoneClosed (And.intro E.weaklyContinuousClosed E.initialConditionClosed)

end EvolutionInclusionsCanonicalLaneLean
end HautevilleHouse
