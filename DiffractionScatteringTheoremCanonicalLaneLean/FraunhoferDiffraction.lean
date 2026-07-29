import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffractionScatteringTheoremCanonicalLaneLean

structure FraunhoferDiffractionPackage where
  farFieldDistance : Prop
  apertureGeometry : Type u
  intensityPattern : Prop
  sincSquaredLaw : Prop
  angularResolutionLimit : Prop

structure FraunhoferDiffractionEvidence (F : FraunhoferDiffractionPackage) where
  farFieldDistanceClosed : F.farFieldDistance
  apertureGeometryClosed : F.apertureGeometry
  intensityPatternClosed : F.intensityPattern
  sincSquaredLawClosed : F.sincSquaredLaw
  angularResolutionLimitClosed : F.angularResolutionLimit

def FraunhoferDiffractionClosed (F : FraunhoferDiffractionPackage) : Prop :=
  F.farFieldDistance ∧ F.apertureGeometry ∧
  F.intensityPattern ∧ F.sincSquaredLaw ∧ F.angularResolutionLimit

theorem fraunhofer_diffraction_closed_from_evidence (F : FraunhoferDiffractionPackage)
    (E : FraunhoferDiffractionEvidence F) : FraunhoferDiffractionClosed F := by
  exact And.intro E.farFieldDistanceClosed
    (And.intro E.apertureGeometryClosed
      (And.intro E.intensityPatternClosed
        (And.intro E.sincSquaredLawClosed E.angularResolutionLimitClosed)))

end DiffractionScatteringTheoremCanonicalLaneLean
end HautevilleHouse
