import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EvolutionInclusionsCanonicalLaneLean

structure CauchyProblemEvolution {X : Type} [NormedAddCommGroup X] [InnerProductSpace ℝ X] where
  initialCondition : X
  timeDomain : Set ℝ
  subdifferential : SubdifferentialOperator X
  solution : ℝ → X
  weakSolution : Prop
  existence : Prop
  uniqueness : Prop
  weakSolutionTerm : weakSolution
  existenceTerm : existence
  uniquenessTerm : uniqueness

structure CauchyEvolutionEvidence {X : Type} [NormedAddCommGroup X] [InnerProductSpace ℝ X]
    (C : CauchyProblemEvolution X) where
  weakSolutionClosed : C.weakSolution
  existenceClosed : C.existence
  uniquenessClosed : C.uniqueness

def CauchyEvolutionClosed {X : Type} [NormedAddCommGroup X] [InnerProductSpace ℝ X]
    (C : CauchyProblemEvolution X) : Prop :=
  C.weakSolution ∧ C.existence ∧ C.uniqueness

theorem cauchy_evolution_closed_from_evidence {X : Type} [NormedAddCommGroup X] [InnerProductSpace ℝ X]
    (C : CauchyProblemEvolution X) (E : CauchyEvolutionEvidence C) :
    CauchyEvolutionClosed C := by
  exact And.intro E.weakSolutionClosed (And.intro E.existenceClosed E.uniquenessClosed)

end EvolutionInclusionsCanonicalLaneLean
end HautevilleHouse
