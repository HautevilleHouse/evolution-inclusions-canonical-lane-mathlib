import HautevilleHouse.EvolutionInclusionsCanonicalLaneLean.EvolutionInclusionStructure

namespace HautevilleHouse
namespace EvolutionInclusionsCanonicalLaneLean

structure PerturbedEvolutionPackage (H : EvolutionInclusionSpace) where
  maximalMonotonePart : Type u
  perturbationPart : Type v
  perturbationProperties : Prop
  wellPosedness : Prop
  stabilityEstimates : Prop
  asymptoticBehavior : Prop

structure PerturbedEvolutionEvidence {H : EvolutionInclusionSpace}
    (P : PerturbedEvolutionPackage H) where
  perturbationPropertiesClosed : P.perturbationProperties
  wellPosednessClosed : P.wellPosedness
  stabilityEstimatesClosed : P.stabilityEstimates
  asymptoticBehaviorClosed : P.asymptoticBehavior

def PerturbedEvolutionClosed {H : EvolutionInclusionSpace}
    (P : PerturbedEvolutionPackage H) : Prop :=
  P.perturbationProperties ∧ P.wellPosedness ∧
  P.stabilityEstimates ∧ P.asymptoticBehavior

theorem perturbed_evolution_closed_from_evidence
    {H : EvolutionInclusionSpace} (P : PerturbedEvolutionPackage H)
    (E : PerturbedEvolutionEvidence P) : PerturbedEvolutionClosed P := by
  exact And.intro E.perturbationPropertiesClosed
    (And.intro E.wellPosednessClosed
      (And.intro E.stabilityEstimatesClosed E.asymptoticBehaviorClosed))

end EvolutionInclusionsCanonicalLaneLean
end HautevilleHouse