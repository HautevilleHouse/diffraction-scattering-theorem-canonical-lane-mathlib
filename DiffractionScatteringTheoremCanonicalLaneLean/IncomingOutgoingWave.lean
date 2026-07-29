import DiffractionScatteringTheoremCanonicalLaneLean.ScatteringTheoryCore

namespace HautevilleHouse
namespace DiffractionScatteringTheoremCanonicalLaneLean

structure IncomingWavePackage (M : DiffractionScatteringSpace) where
  planeWaveDirection : M.carrier
  amplitude : ℂ
  waveNumberMatches : waveNumber M = waveNumber M
  incomingRegularity : Prop

structure OutgoingWavePackage (M : DiffractionScatteringSpace) where
  scatteringDirection : M.carrier
  farFieldPattern : ℂ → ℂ
  outgoingRadiationCondition : Prop
  decayAtInfinity : Prop

structure RadiationConditionEvidence {M : DiffractionScatteringSpace}
    (I : IncomingWavePackage M) (O : OutgoingWavePackage M) where
  radiationConditionClosed : I.incomingRegularity ∧ O.outgoingRadiationCondition

df RadiationConditionClosed {M : DiffractionScatteringSpace}
    {I : IncomingWavePackage M} {O : OutgoingWavePackage M} : Prop :=
  I.incomingRegularity ∧ O.outgoingRadiationCondition

theorem radiation_condition_closed_from_evidence
    {M : DiffractionScatteringSpace} {I : IncomingWavePackage M} {O : OutgoingWavePackage M}
    (E : RadiationConditionEvidence I O) : RadiationConditionClosed := by
  exact E.radiationConditionClosed

end DiffractionScatteringTheoremCanonicalLaneLean
end HautevilleHouse