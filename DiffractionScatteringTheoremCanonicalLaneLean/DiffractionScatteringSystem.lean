import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffractionScatteringTheoremCanonicalLaneLean

structure DiffractionScatteringSystem where
  obstacle : Type u
  topology : TopologicalSpace obstacle
  boundaryCondition : Type v
  incidentWave : Type w
  waveNumber : Type x
  farFieldPattern : Type y
  obstacleSmooth : Prop
  boundaryConditionSatisfied : Prop
  incidentWavePrescribed : Prop
  scatteredWaveComputed : Prop
  farFieldMeasured : Prop

structure DiffractionScatteringEvidence (D : DiffractionScatteringSystem) where
  obstacleSmoothClosed : D.obstacleSmooth
  boundaryConditionSatisfiedClosed : D.boundaryConditionSatisfied
  incidentWavePrescribedClosed : D.incidentWavePrescribed
  scatteredWaveComputedClosed : D.scatteredWaveComputed
  farFieldMeasuredClosed : D.farFieldMeasured

def DiffractionScatteringClosed (D : DiffractionScatteringSystem) : Prop :=
  D.obstacleSmooth ∧ D.boundaryConditionSatisfied ∧
  D.incidentWavePrescribed ∧ D.scatteredWaveComputed ∧
  D.farFieldMeasured

theorem diffraction_scattering_closed_from_evidence
    (D : DiffractionScatteringSystem) (E : DiffractionScatteringEvidence D) :
    DiffractionScatteringClosed D := by
  exact And.intro E.obstacleSmoothClosed
    (And.intro E.boundaryConditionSatisfiedClosed
      (And.intro E.incidentWavePrescribedClosed
        (And.intro E.scatteredWaveComputedClosed
          E.farFieldMeasuredClosed)))

end DiffractionScatteringTheoremCanonicalLaneLean
end HautevilleHouse