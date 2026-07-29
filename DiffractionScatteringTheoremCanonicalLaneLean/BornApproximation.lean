import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffractionScatteringTheoremCanonicalLaneLean

structure BornApproximationPackage {S : ScatteringAmplitudePackage} where
  weakPotentialAssumption : Prop
  firstOrderSeriesTruncation : Prop
  amplitudeLinearInPotential : Prop
  validityCondition : Prop

structure BornApproximationEvidence {S : ScatteringAmplitudePackage}
    (B : BornApproximationPackage S) where
  weakPotentialAssumptionClosed : B.weakPotentialAssumption
  firstOrderSeriesTruncationClosed : B.firstOrderSeriesTruncation
  amplitudeLinearInPotentialClosed : B.amplitudeLinearInPotential
  validityConditionClosed : B.validityCondition

def BornApproximationClosed {S : ScatteringAmplitudePackage}
    (B : BornApproximationPackage S) : Prop :=
  B.weakPotentialAssumption ∧ B.firstOrderSeriesTruncation ∧
  B.amplitudeLinearInPotential ∧ B.validityCondition

theorem born_approximation_closed_from_evidence {S : ScatteringAmplitudePackage}
    (B : BornApproximationPackage S) (E : BornApproximationEvidence B) :
    BornApproximationClosed B := by
  exact And.intro E.weakPotentialAssumptionClosed
    (And.intro E.firstOrderSeriesTruncationClosed
      (And.intro E.amplitudeLinearInPotentialClosed E.validityConditionClosed))

end DiffractionScatteringTheoremCanonicalLaneLean
end HautevilleHouse
