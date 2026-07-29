import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EvolutionInclusionsCanonicalLaneLean

structure YosidaRegularization {X : Type} [NormedAddCommGroup X] [InnerProductSpace ℝ X] where
  parameter : ℝ
  resolvent : X → X
  yosidaApprox : X → X
  lipschitzConstant : ℝ
  convergentAsParameterToZero : Prop
  lipschitzConstantTerm : lipschitzConstant > 0
  convergentAsParameterToZeroTerm : convergentAsParameterToZero

structure YosidaEvidence {X : Type} [NormedAddCommGroup X] [InnerProductSpace ℝ X]
    (Y : YosidaRegularization X) where
  lipschitzConstantClosed : Y.lipschitzConstant > 0
  convergentAsParameterToZeroClosed : Y.convergentAsParameterToZero

def YosidaRegularizationClosed {X : Type} [NormedAddCommGroup X] [InnerProductSpace ℝ X]
    (Y : YosidaRegularization X) : Prop :=
  Y.lipschitzConstant > 0 ∧ Y.convergentAsParameterToZero

theorem yosida_regularization_closed_from_evidence {X : Type} [NormedAddCommGroup X] [InnerProductSpace ℝ X]
    (Y : YosidaRegularization X) (E : YosidaEvidence Y) :
    YosidaRegularizationClosed Y := by
  exact And.intro E.lipschitzConstantClosed E.convergentAsParameterToZeroClosed

end EvolutionInclusionsCanonicalLaneLean
end HautevilleHouse
