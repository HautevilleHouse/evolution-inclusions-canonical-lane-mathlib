import HautevilleHouse.EvolutionInclusionsCanonicalLaneLean.AdmissibleClass
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace EvolutionInclusionsCanonicalLaneLean

structure EvolutionInclusionSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure EvolutionInclusionAdmittedObject where
  space : EvolutionInclusionSpace
  hilbertSpace : Prop
  maximalMonotoneOperator : Prop
  solutionExistence : Prop
  conclusion : solutionExistence

structure EvolutionInclusionEndgameState where
  object : EvolutionInclusionAdmittedObject

def EvolutionInclusionWitnessClosed (O : EvolutionInclusionAdmittedObject) : Prop :=
  O.solutionExistence

end EvolutionInclusionsCanonicalLaneLean
end HautevilleHouse