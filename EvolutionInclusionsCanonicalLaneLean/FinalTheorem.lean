import canonicalLaneMathlib.AdmissibleClass
import canonicalLaneMathlib.BridgeLemmas
import canonicalLaneMathlib.GateLemmas

namespace HautevilleHouse
namespace EvolutionInclusionsCanonicalLaneLean

def ConstrainedEvolutionInclusionClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_evolution_inclusion_endgame (A : AdmissibleClass) :
    ConstrainedEvolutionInclusionClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end EvolutionInclusionsCanonicalLaneLean
end HautevilleHouse
