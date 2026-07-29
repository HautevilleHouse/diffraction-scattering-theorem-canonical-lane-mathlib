import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffractionScatteringTheoremCanonicalLaneLean

structure OpticalTheoremPackage where
  totalCrossSection : Prop
  forwardScatteringAmplitude : Prop
  opticalRelation : Prop
  unitarityConsequence : Prop

structure OpticalTheoremEvidence (O : OpticalTheoremPackage) where
  totalCrossSectionClosed : O.totalCrossSection
  forwardScatteringAmplitudeClosed : O.forwardScatteringAmplitude
  opticalRelationClosed : O.opticalRelation
  unitarityConsequenceClosed : O.unitarityConsequence

def OpticalTheoremClosed (O : OpticalTheoremPackage) : Prop :=
  O.totalCrossSection ∧ O.forwardScatteringAmplitude ∧ O.opticalRelation ∧ O.unitarityConsequence

theorem optical_theorem_closed_from_evidence (O : OpticalTheoremPackage)
    (E : OpticalTheoremEvidence O) : OpticalTheoremClosed O := by
  exact And.intro E.totalCrossSectionClosed
    (And.intro E.forwardScatteringAmplitudeClosed
      (And.intro E.opticalRelationClosed E.unitarityConsequenceClosed))

end DiffractionScatteringTheoremCanonicalLaneLean
end HautevilleHouse