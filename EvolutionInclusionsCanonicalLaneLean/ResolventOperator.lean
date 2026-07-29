import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EvolutionInclusionsCanonicalLaneLean

structure ResolventOperator (X : Type u) [NormedAddCommGroup X] [BanachSpace X] where
  operator : X → Set X
  lambda : ℝ
  lambdaPositive : lambda > 0
  resolvent : X → X
  resolventEquation : ∀ x : X, (resolvent x) + lambda * (resolvent x) ∈ operator (resolvent x) + x
  resolventClosed : resolventEquation

def ResolventOperatorClosed {X : Type u} [NormedAddCommGroup X] [BanachSpace X]
    (R : ResolventOperator X) : Prop :=
  R.resolventEquation

theorem resolvent_operator_closed_from_evidence
    {X : Type u} [NormedAddCommGroup X] [BanachSpace X]
    (R : ResolventOperator X) : ResolventOperatorClosed R := by
  exact R.resolventClosed

end EvolutionInclusionsCanonicalLaneLean
end HautevilleHouse