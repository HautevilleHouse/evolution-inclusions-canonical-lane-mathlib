import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EvolutionInclusionsCanonicalLaneLean

structure PerturbationResult {X : Type} [NormedAddCommGroup X] [InnerProductSpace ℝ X] where
  baseOperator : SubdifferentialOperator X
  perturbation : X → Dual X
  perturbedOperator : SubdifferentialOperator X
  sumMaximalMonotone : Prop
  stabilityUnderPerturbation : Prop
  sumMaximalMonotoneTerm : sumMaximalMonotone
  stabilityUnderPerturbationTerm : stabilityUnderPerturbation

structure PerturbationEvidence {X : Type} [NormedAddCommGroup X] [InnerProductSpace ℝ X]
    (P : PerturbationResult X) where
  sumMaximalMonotoneClosed : P.sumMaximalMonotone
  stabilityUnderPerturbationClosed : P.stabilityUnderPerturbation

def PerturbationClosed {X : Type} [NormedAddCommGroup X] [InnerProductSpace ℝ X]
    (P : PerturbationResult X) : Prop :=
  P.sumMaximalMonotone ∧ P.stabilityUnderPerturbation

theorem perturbation_closed_from_evidence {X : Type} [NormedAddCommGroup X] [InnerProductSpace ℝ X]
    (P : PerturbationResult X) (E : PerturbationEvidence P) :
    PerturbationClosed P := by
  exact And.intro E.sumMaximalMonotoneClosed E.stabilityUnderPerturbationClosed

end EvolutionInclusionsCanonicalLaneLean
end HautevilleHouse
