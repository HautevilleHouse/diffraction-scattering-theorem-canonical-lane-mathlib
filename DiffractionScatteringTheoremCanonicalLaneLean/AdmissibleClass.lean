import DiffractionScatteringTheoremCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace DiffractionScatteringTheoremCanonicalLaneLean

structure AdmissibleClass where
  object : ScatteringAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  ScatteringWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DiffractionScatteringTheoremCanonicalLaneLean
end HautevilleHouse