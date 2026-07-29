import HautevilleHouse.EvolutionInclusionsCanonicalLaneLean.EvolutionInclusionStructure

namespace HautevilleHouse
namespace EvolutionInclusionsCanonicalLaneLean

structure SubdifferentialFlowPackage (H : EvolutionInclusionSpace) where
  properCvxFunction : Type u
  subdifferentialOperator : Type v
  maximalMonotonicityProof : Prop
  resolventWellDefined : Prop
  yosidaApproximation : Prop
  flowExistence : Prop

structure SubdifferentialFlowEvidence {H : EvolutionInclusionSpace}
    (S : SubdifferentialFlowPackage H) where
  maximalMonotonicityClosed : S.maximalMonotonicityProof
  resolventWellDefinedClosed : S.resolventWellDefined
  yosidaApproximationClosed : S.yosidaApproximation
  flowExistenceClosed : S.flowExistence

def SubdifferentialFlowClosed {H : EvolutionInclusionSpace}
    (S : SubdifferentialFlowPackage H) : Prop :=
  S.maximalMonotonicityProof ∧ S.resolventWellDefined ∧
  S.yosidaApproximation ∧ S.flowExistence

theorem subdifferential_flow_closed_from_evidence
    {H : EvolutionInclusionSpace} (S : SubdifferentialFlowPackage H)
    (E : SubdifferentialFlowEvidence S) : SubdifferentialFlowClosed S := by
  exact And.intro E.maximalMonotonicityClosed
    (And.intro E.resolventWellDefinedClosed
      (And.intro E.yosidaApproximationClosed E.flowExistenceClosed))

end EvolutionInclusionsCanonicalLaneLean
end HautevilleHouse