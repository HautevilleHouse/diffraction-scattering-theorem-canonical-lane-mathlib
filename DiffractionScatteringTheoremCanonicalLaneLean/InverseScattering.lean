import HautevilleHouse.DiffractionScatteringTheoremCanonicalLaneLean.AsymptoticExpansion

namespace HautevilleHouse
namespace DiffractionScatteringTheoremCanonicalLaneLean

structure InverseScattering {D : DiffractionScatteringSystem}
    {H : HelmholtzSolver D} {A : AsymptoticExpansion H} where
  unknownObstacleReconstructor : Type u
  farFieldMeasurements : Type v
  uniqueness : Prop
  stability : Prop
  reconstructionAlgorithmValid : Prop

structure InverseScatteringEvidence {D : DiffractionScatteringSystem}
    {H : HelmholtzSolver D} {A : AsymptoticExpansion H}
    (I : InverseScattering A) where
  uniquenessClosed : I.uniqueness
  stabilityClosed : I.stability
  reconstructionAlgorithmValidClosed : I.reconstructionAlgorithmValid

def InverseScatteringClosed {D : DiffractionScatteringSystem}
    {H : HelmholtzSolver D} {A : AsymptoticExpansion H}
    (I : InverseScattering A) : Prop :=
  I.uniqueness ∧ I.stability ∧ I.reconstructionAlgorithmValid

theorem inverse_scattering_closed_from_evidence
    {D : DiffractionScatteringSystem} {H : HelmholtzSolver D}
    {A : AsymptoticExpansion H} (I : InverseScattering A)
    (E : InverseScatteringEvidence I) : InverseScatteringClosed I := by
  exact And.intro E.uniquenessClosed
    (And.intro E.stabilityClosed
      E.reconstructionAlgorithmValidClosed)

end DiffractionScatteringTheoremCanonicalLaneLean
end HautevilleHouse