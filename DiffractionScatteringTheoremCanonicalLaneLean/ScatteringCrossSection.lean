import DiffractionScatteringTheoremCanonicalLaneLean.FarFieldAsymptotics

namespace HautevilleHouse
namespace DiffractionScatteringTheoremCanonicalLaneLean

structure ScatteringCrossSectionPackage {G : RiemannianCurvaturePackage} {F : ScatteringPDEPackage G} (A : FarFieldAsymptoticsPackage F) where
  totalCrossSection : Prop
  differentialCrossSection : Prop
  opticalTheorem : Prop
  unitarity : Prop

structure ScatteringCrossSectionEvidence {G : RiemannianCurvaturePackage} {F : ScatteringPDEPackage G} {A : FarFieldAsymptoticsPackage F} (C : ScatteringCrossSectionPackage A) where
  totalCrossSectionClosed : C.totalCrossSection
  differentialCrossSectionClosed : C.differentialCrossSection
  opticalTheoremClosed : C.opticalTheorem
  unitarityClosed : C.unitarity

def ScatteringCrossSectionClosed {G : RiemannianCurvaturePackage} {F : ScatteringPDEPackage G} {A : FarFieldAsymptoticsPackage F} (C : ScatteringCrossSectionPackage A) : Prop :=
  C.totalCrossSection ∧ C.differentialCrossSection ∧ C.opticalTheorem ∧ C.unitarity

theorem scattering_cross_section_closed_from_evidence {G : RiemannianCurvaturePackage} {F : ScatteringPDEPackage G} {A : FarFieldAsymptoticsPackage F} (C : ScatteringCrossSectionPackage A) (E : ScatteringCrossSectionEvidence C) :
    ScatteringCrossSectionClosed C := by
  exact And.intro E.totalCrossSectionClosed (And.intro E.differentialCrossSectionClosed (And.intro E.opticalTheoremClosed E.unitarityClosed))

end DiffractionScatteringTheoremCanonicalLaneLean
end HautevilleHouse