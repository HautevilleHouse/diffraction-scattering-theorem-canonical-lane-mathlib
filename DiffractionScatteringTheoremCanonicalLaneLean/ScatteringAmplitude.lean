import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffractionScatteringTheoremCanonicalLaneLean

structure ScatteringAmplitudePackage where
  incidentWave : Type u
  scatteredAmplitude : Type v
  momentumTransfer : Type w
  farFieldPattern : Prop
  differentialCrossSection : Prop
  opticalTheoremRelation : Prop

structure ScatteringAmplitudeEvidence (S : ScatteringAmplitudePackage) where
  farFieldPatternClosed : S.farFieldPattern
  differentialCrossSectionClosed : S.differentialCrossSection
  opticalTheoremRelationClosed : S.opticalTheoremRelation

def ScatteringAmplitudeClosed (S : ScatteringAmplitudePackage) : Prop :=
  S.farFieldPattern ∧ S.differentialCrossSection ∧ S.opticalTheoremRelation

theorem scattering_amplitude_closed_from_evidence (S : ScatteringAmplitudePackage)
    (E : ScatteringAmplitudeEvidence S) : ScatteringAmplitudeClosed S := by
  exact And.intro E.farFieldPatternClosed
    (And.intro E.differentialCrossSectionClosed E.opticalTheoremRelationClosed)

end DiffractionScatteringTheoremCanonicalLaneLean
end HautevilleHouse
