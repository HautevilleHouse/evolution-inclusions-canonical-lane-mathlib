import EvolutionInclusionsCanonicalLaneLean.NonlinearEvolutionPackage

namespace HautevilleHouse
namespace EvolutionInclusionsCanonicalLaneLean

structure SweepingProcessPackage {S : EvolutionInclusionState} (N : NonlinearEvolutionPackage S) where
  convexConstraint : Prop
  normalConeInclusion : Prop
  uniquenessOfTrajectory : Prop
  viability : Prop
  convexConstraintClosed : convexConstraint
  normalConeInclusionClosed : normalConeInclusion
  uniquenessOfTrajectoryClosed : uniquenessOfTrajectory
  viabilityClosed : viability

def SweepingProcessClosed {S : EvolutionInclusionState} (N : NonlinearEvolutionPackage S) (P : SweepingProcessPackage N) : Prop :=
  P.convexConstraint ∧ P.normalConeInclusion ∧ P.uniquenessOfTrajectory ∧ P.viability ∧ NonlinearEvolutionClosed S N

theorem sweeping_process_closed_from_evidence {S : EvolutionInclusionState} {N : NonlinearEvolutionPackage S} (P : SweepingProcessPackage N) :
    SweepingProcessClosed N P := by
  exact And.intro P.convexConstraintClosed
    (And.intro P.normalConeInclusionClosed
      (And.intro P.uniquenessOfTrajectoryClosed
        (And.intro P.viabilityClosed (nonlinear_evolution_closed_from_evidence S N))))

end EvolutionInclusionsCanonicalLaneLean
end HautevilleHouse