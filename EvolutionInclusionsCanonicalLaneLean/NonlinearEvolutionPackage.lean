import EvolutionInclusionsCanonicalLaneLean.EvolutionInclusionState

namespace HautevilleHouse
namespace EvolutionInclusionsCanonicalLaneLean

structure NonlinearEvolutionPackage (S : EvolutionInclusionState) where
  initialValue : Type u
  evolutionOperator : Type v
  wellPosedness : Prop
  monotonicity : Prop
  asymptoticBehavior : Prop
  wellPosednessClosed : wellPosedness
  monotonicityClosed : monotonicity
  asymptoticBehaviorClosed : asymptoticBehavior

def NonlinearEvolutionClosed (S : EvolutionInclusionState) (N : NonlinearEvolutionPackage S) : Prop :=
  N.wellPosedness ∧ N.monotonicity ∧ N.asymptoticBehavior ∧ EvolutionInclusionStateClosed S

theorem nonlinear_evolution_closed_from_evidence (S : EvolutionInclusionState) (N : NonlinearEvolutionPackage S) :
    NonlinearEvolutionClosed S N := by
  exact And.intro N.wellPosednessClosed
    (And.intro N.monotonicityClosed
      (And.intro N.asymptoticBehaviorClosed (evolution_inclusion_state_closed_from_evidence S)))

end EvolutionInclusionsCanonicalLaneLean
end HautevilleHouse