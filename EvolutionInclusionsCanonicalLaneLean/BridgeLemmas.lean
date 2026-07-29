import HautevilleHouse.EvolutionInclusionsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace EvolutionInclusionsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  EvolutionInclusionWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end EvolutionInclusionsCanonicalLaneLean
end HautevilleHouse