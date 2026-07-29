import DiffractionScatteringTheoremCanonicalLaneLean.RiemannianCurvature

namespace HautevilleHouse
namespace DiffractionScatteringTheoremCanonicalLaneLean

structure ScatteringPDEPackage (G : RiemannianCurvaturePackage) where
  waveField : Type u
  helmholtzEquation : Prop
  incidentField : Prop
  scatteredField : Prop
  radiationCondition : Prop

structure ScatteringPDEEvidence {G : RiemannianCurvaturePackage} (F : ScatteringPDEPackage G) where
  helmholtzEquationClosed : F.helmholtzEquation
  incidentFieldClosed : F.incidentField
  scatteredFieldClosed : F.scatteredField
  radiationConditionClosed : F.radiationCondition

def ScatteringPDEClosed {G : RiemannianCurvaturePackage} (F : ScatteringPDEPackage G) : Prop :=
  F.helmholtzEquation ∧ F.incidentField ∧ F.scatteredField ∧ F.radiationCondition

theorem scattering_pde_closed_from_evidence {G : RiemannianCurvaturePackage} (F : ScatteringPDEPackage G) (E : ScatteringPDEEvidence F) :
    ScatteringPDEClosed F := by
  exact And.intro E.helmholtzEquationClosed (And.intro E.incidentFieldClosed (And.intro E.scatteredFieldClosed E.radiationConditionClosed))

end DiffractionScatteringTheoremCanonicalLaneLean
end HautevilleHouse