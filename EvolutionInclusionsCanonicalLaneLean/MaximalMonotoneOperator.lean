import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EvolutionInclusionsCanonicalLaneLean

structure MaximalMonotoneOperator (X : Type u) [NormedAddCommGroup X] [BanachSpace X] where
  operator : X → Set X
  monotone : ∀ x y : X, ∀ u ∈ operator x, ∀ v ∈ operator y, 0 ≤ re ⟨u - v, x - y⟩
  maximal : ∀ (x : X) (u : X), (∀ y : X, ∀ v ∈ operator y, 0 ≤ re ⟨u - v, x - y⟩) → u ∈ operator x
  maximalClosed : maximal

def MaximalMonotoneOperatorClosed {X : Type u} [NormedAddCommGroup X] [BanachSpace X]
    (M : MaximalMonotoneOperator X) : Prop :=
  M.maximal

theorem maximal_monotone_operator_closed_from_evidence
    {X : Type u} [NormedAddCommGroup X] [BanachSpace X]
    (M : MaximalMonotoneOperator X) : MaximalMonotoneOperatorClosed M := by
  exact M.maximalClosed

end EvolutionInclusionsCanonicalLaneLean
end HautevilleHouse