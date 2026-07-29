import HautevilleHouse.DiffractionScatteringTheoremCanonicalLaneLean.BornApproximation

namespace HautevilleHouse
namespace DiffractionScatteringTheoremCanonicalLaneLean

structure DiffractionPatternPackage {S : ScatteringAmplitudePackage}
    {B : BornApproximationPackage S} where
  farFieldPattern : Prop
  intensityDistribution : Prop
  braggCondition : Prop
  crystalStructure : Type u

structure DiffractionPatternEvidence {S : ScatteringAmplitudePackage}
    {B : BornApproximationPackage S} (D : DiffractionPatternPackage B) where
  farFieldPatternClosed : D.farFieldPattern
  intensityDistributionClosed : D.intensityDistribution
  braggConditionClosed : D.braggCondition

def DiffractionPatternClosed {S : ScatteringAmplitudePackage}
    {B : BornApproximationPackage S} (D : DiffractionPatternPackage B) : Prop :=
  D.farFieldPattern ∧ D.intensityDistribution ∧ D.braggCondition

theorem diffraction_pattern_closed_from_evidence {S : ScatteringAmplitudePackage}
    {B : BornApproximationPackage S} (D : DiffractionPatternPackage B)
    (E : DiffractionPatternEvidence D) : DiffractionPatternClosed D := by
  exact And.intro E.farFieldPatternClosed (And.intro E.intensityDistributionClosed E.braggConditionClosed)

end DiffractionScatteringTheoremCanonicalLaneLean
end HautevilleHouse