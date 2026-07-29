import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EvolutionInclusionsCanonicalLaneLean

structure SubdifferentialFlowPackage {E : EvolutionInclusionPackage} where
  convexPotential : E.domainType → ℝ
  subdifferential : E.domainType → Set (E.domainType)
  flowEquation : Prop
  uniqueness : Prop
  regularization : Prop

structure SubdifferentialFlowEvidence {E : EvolutionInclusionPackage}
    (S : SubdifferentialFlowPackage E) where
  flowEquationClosed : S.flowEquation
  uniquenessClosed : S.uniqueness
  regularizationClosed : S.regularization

def SubdifferentialFlowClosed {E : EvolutionInclusionPackage}
    (S : SubdifferentialFlowPackage E) : Prop :=
  S.flowEquation ∧ S.uniqueness ∧ S.regularization

theorem subdifferential_flow_closed_from_evidence
    {E : EvolutionInclusionPackage} (S : SubdifferentialFlowPackage E)
    (Ev : SubdifferentialFlowEvidence S) : SubdifferentialFlowClosed S := by
  exact And.intro Ev.flowEquationClosed
    (And.intro Ev.uniquenessClosed Ev.regularizationClosed)

end EvolutionInclusionsCanonicalLaneLean
end HautevilleHouse
