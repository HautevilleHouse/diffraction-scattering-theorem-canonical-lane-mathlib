import DiffractionScatteringTheoremCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace DiffractionScatteringTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ScatteringWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end DiffractionScatteringTheoremCanonicalLaneLean
end HautevilleHouse