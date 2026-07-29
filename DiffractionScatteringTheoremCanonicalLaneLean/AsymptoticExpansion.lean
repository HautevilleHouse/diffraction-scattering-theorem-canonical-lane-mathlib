import HautevilleHouse.DiffractionScatteringTheoremCanonicalLaneLean.HelmholtzSolver

namespace HautevilleHouse
namespace DiffractionScatteringTheoremCanonicalLaneLean

structure AsymptoticExpansion {D : DiffractionScatteringSystem}
    {H : HelmholtzSolver D} where
  farFieldAsymptotics : Prop
  diffractionCoefficients : Prop
  geometricOpticsLimit : Prop
  errorEstimates : Prop

structure AsymptoticExpansionEvidence {D : DiffractionScatteringSystem}
    {H : HelmholtzSolver D} (A : AsymptoticExpansion H) where
  farFieldAsymptoticsClosed : A.farFieldAsymptotics
  diffractionCoefficientsClosed : A.diffractionCoefficients
  geometricOpticsLimitClosed : A.geometricOpticsLimit
  errorEstimatesClosed : A.errorEstimates

def AsymptoticExpansionClosed {D : DiffractionScatteringSystem}
    {H : HelmholtzSolver D} (A : AsymptoticExpansion H) : Prop :=
  A.farFieldAsymptotics ∧ A.diffractionCoefficients ∧
  A.geometricOpticsLimit ∧ A.errorEstimates

theorem asymptotic_expansion_closed_from_evidence
    {D : DiffractionScatteringSystem} {H : HelmholtzSolver D}
    (A : AsymptoticExpansion H) (E : AsymptoticExpansionEvidence A) :
    AsymptoticExpansionClosed A := by
  exact And.intro E.farFieldAsymptoticsClosed
    (And.intro E.diffractionCoefficientsClosed
      (And.intro E.geometricOpticsLimitClosed
        E.errorEstimatesClosed))

end DiffractionScatteringTheoremCanonicalLaneLean
end HautevilleHouse