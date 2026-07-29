import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EvolutionInclusionsCanonicalLaneLean

structure EvolutionInclusionAdmittedObject where
  state : Type u
  inclusionSet : Type v
  closureProp : Prop
  conclusion : closureProp

def EvolutionInclusionWitnessClosed (O : EvolutionInclusionAdmittedObject) : Prop :=
  O.closureProp

structure ConstrainedEvolutionInclusionClosure (A : AdmissibleClass) : Prop where
  bridge : bridgeClosed A
  gate : gateClosed A

theorem constrained_evolution_inclusion_endgame (A : AdmissibleClass) :
    ConstrainedEvolutionInclusionClosure A := by
  exact { bridge := bridge_from_admissible_class A, gate := gate_from_admissible_class A }

end EvolutionInclusionsCanonicalLaneLean
end HautevilleHouse