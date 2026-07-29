import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffractionScatteringTheoremCanonicalLaneLean

structure DiffractionScatteringSpace where
  carrier : Type
  topology : TopologicalSpace carrier
  potential : carrier → ℂ
  waveNumber : ℝ
  farFieldPattern : carrier → ℂ → ℂ

structure ScatteringAdmittedObject where
  space : DiffractionScatteringSpace
  boundedPotential : Prop
  outgoingCondition : Prop
  scatteringAmplitudeDefined : Prop
  conclusion : scatteringAmplitudeDefined

structure ScatteringAdmissibleClass where
  object : ScatteringAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def scatteringWitnessClosed (O : ScatteringAdmittedObject) : Prop :=
  O.scatteringAmplitudeDefined

df admittedClosure (A : ScatteringAdmissibleClass) : Prop :=
  scatteringWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DiffractionScatteringTheoremCanonicalLaneLean
end HautevilleHouse