import DiffractionScatteringTheoremCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace DiffractionScatteringTheoremCanonicalLaneLean

def ConstrainedScatteringClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_scattering_endgame (A : AdmissibleClass) :
    ConstrainedScatteringClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DiffractionScatteringTheoremCanonicalLaneLean
end HautevilleHouse