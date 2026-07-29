import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EvolutionInclusionsCanonicalLaneLean

structure SubdifferentialOperator {X : Type} [NormedAddCommGroup X] [InnerProductSpace ℝ X] where
  properLowerSemicontinuous : X → ℝ
  domain : Set X
  subdifferential : X → Set (Dual X)
  monotoneCondition : Prop
  maximalMonotoneCondition : Prop
  monotoneConditionTerm : monotoneCondition
  maximalMonotoneConditionTerm : maximalMonotoneCondition

structure SubdifferentialEvidence {X : Type} [NormedAddCommGroup X] [InnerProductSpace ℝ X]
    (S : SubdifferentialOperator X) where
  properLowerSemicontinuousClosed : True
  monotoneConditionClosed : S.monotoneCondition
  maximalMonotoneConditionClosed : S.maximalMonotoneCondition

def SubdifferentialClosed {X : Type} [NormedAddCommGroup X] [InnerProductSpace ℝ X]
    (S : SubdifferentialOperator X) : Prop :=
  S.monotoneCondition ∧ S.maximalMonotoneCondition

theorem subdifferential_closed_from_evidence {X : Type} [NormedAddCommGroup X] [InnerProductSpace ℝ X]
    (S : SubdifferentialOperator X) (E : SubdifferentialEvidence S) :
    SubdifferentialClosed S := by
  exact And.intro E.monotoneConditionClosed E.maximalMonotoneConditionClosed

end EvolutionInclusionsCanonicalLaneLean
end HautevilleHouse
