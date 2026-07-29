import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EvolutionInclusionsCanonicalLaneLean

structure YosidaApproximationPackage {E : EvolutionInclusionPackage} where
  resolvent : ℝ → E.domainType → E.domainType
  yosidaOperator : ℝ → E.domainType → E.domainType
  approximationProperty : Prop
  convergenceRate : Prop
  strongConvergence : Prop

structure YosidaApproximationEvidence {E : EvolutionInclusionPackage}
    (Y : YosidaApproximationPackage E) where
  approximationPropertyClosed : Y.approximationProperty
  convergenceRateClosed : Y.convergenceRate
  strongConvergenceClosed : Y.strongConvergence

def YosidaApproximationClosed {E : EvolutionInclusionPackage}
    (Y : YosidaApproximationPackage E) : Prop :=
  Y.approximationProperty ∧ Y.convergenceRate ∧ Y.strongConvergence

theorem yosida_approximation_closed_from_evidence
    {E : EvolutionInclusionPackage} (Y : YosidaApproximationPackage E)
    (Ev : YosidaApproximationEvidence Y) : YosidaApproximationClosed Y := by
  exact And.intro Ev.approximationPropertyClosed
    (And.intro Ev.convergenceRateClosed Ev.strongConvergenceClosed)

end EvolutionInclusionsCanonicalLaneLean
end HautevilleHouse
