import canonicalLaneMathlib.AdmissibleClass

/-!
# Time Discretization Scheme Package for Evolution Inclusions
-/

namespace HautevilleHouse
namespace EvolutionInclusionsCanonicalLaneLean

structure DiscretizationScheme (M : EvolutionInclusionModel) where
  timeStep : ℝ
  gridFunction : ℕ → M.stateSpace
  resolvent : M.stateSpace → M.stateSpace
  consistencyCondition : Prop
  stabilityCondition : Prop
  resolventClosed : ∀ x, resolvent x ∈ resolvent x

structure DiscretizationEvidence {M : EvolutionInclusionModel} (D : DiscretizationScheme M) where
  consistencyConditionClosed : D.consistencyCondition
  stabilityConditionClosed : D.stabilityCondition
  resolventClosedClosed : ∀ x, D.resolventClosed x

def DiscretizationSchemeClosed {M : EvolutionInclusionModel} (D : DiscretizationScheme M) : Prop :=
  D.consistencyCondition ∧ D.stabilityCondition ∧ (∀ x, D.resolventClosed x)

theorem discretization_scheme_closed_from_evidence
    {M : EvolutionInclusionModel} (D : DiscretizationScheme M)
    (E : DiscretizationEvidence D) : DiscretizationSchemeClosed D := by
  exact And.intro E.consistencyConditionClosed
    (And.intro E.stabilityConditionClosed E.resolventClosedClosed)

end EvolutionInclusionsCanonicalLaneLean
end HautevilleHouse
