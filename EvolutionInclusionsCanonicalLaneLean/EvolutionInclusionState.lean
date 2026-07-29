import EvolutionInclusionsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace EvolutionInclusionsCanonicalLaneLean

structure EvolutionInclusionState where
  object : EvolutionInclusionAdmittedObject
  inclusionMap : Prop
  closureUnderFlow : Prop
  endpointMatch : Prop
  flowInvariance : Prop
  inclusionMapClosed : inclusionMap
  closureUnderFlowClosed : closureUnderFlow
  endpointMatchClosed : endpointMatch
  flowInvarianceClosed : flowInvariance

def EvolutionInclusionStateClosed (S : EvolutionInclusionState) : Prop :=
  S.inclusionMap ∧ S.closureUnderFlow ∧ S.endpointMatch ∧ S.flowInvariance

theorem evolution_inclusion_state_closed_from_evidence (S : EvolutionInclusionState) :
    EvolutionInclusionStateClosed S := by
  exact And.intro S.inclusionMapClosed
    (And.intro S.closureUnderFlowClosed
      (And.intro S.endpointMatchClosed S.flowInvarianceClosed))

end EvolutionInclusionsCanonicalLaneLean
end HautevilleHouse