import HautevilleHouse.DiffractionScatteringTheoremCanonicalLaneLean.InverseScattering

namespace HautevilleHouse
namespace DiffractionScatteringTheoremCanonicalLaneLean

structure DiffractionScatteringFoundation where
  system : DiffractionScatteringSystem
  systemEvidence : DiffractionScatteringEvidence system
  helmholtzSolver : HelmholtzSolver system
  helmholtzSolverEvidence : HelmholtzSolverEvidence helmholtzSolver
  asymptoticExpansion : AsymptoticExpansion helmholtzSolver
  asymptoticExpansionEvidence : AsymptoticExpansionEvidence asymptoticExpansion
  inverseScattering : InverseScattering asymptoticExpansion
  inverseScatteringEvidence : InverseScatteringEvidence inverseScattering

def DiffractionScatteringFoundationClosed (F : DiffractionScatteringFoundation) : Prop :=
  DiffractionScatteringClosed F.system ∧
  HelmholtzSolverClosed F.helmholtzSolver ∧
  AsymptoticExpansionClosed F.asymptoticExpansion ∧
  InverseScatteringClosed F.inverseScattering

theorem diffraction_scattering_foundation_closed_from_evidence
    (F : DiffractionScatteringFoundation) :
    DiffractionScatteringFoundationClosed F := by
  exact And.intro (diffraction_scattering_closed_from_evidence F.system F.systemEvidence)
    (And.intro (helmholtz_solver_closed_from_evidence F.helmholtzSolver F.helmholtzSolverEvidence)
      (And.intro (asymptotic_expansion_closed_from_evidence F.asymptoticExpansion F.asymptoticExpansionEvidence)
        (inverse_scattering_closed_from_evidence F.inverseScattering F.inverseScatteringEvidence)))

end DiffractionScatteringTheoremCanonicalLaneLean
end HautevilleHouse