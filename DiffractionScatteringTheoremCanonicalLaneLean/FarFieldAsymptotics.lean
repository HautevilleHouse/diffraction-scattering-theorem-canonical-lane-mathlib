import DiffractionScatteringTheoremCanonicalLaneLean.ScatteringPDE

namespace HautevilleHouse
namespace DiffractionScatteringTheoremCanonicalLaneLean

structure FarFieldAsymptoticsPackage {G : RiemannianCurvaturePackage} (F : ScatteringPDEPackage G) where
  farFieldPattern : Type u
  angularDependence : Prop
  decayRate : Prop
  uniformBound : Prop

structure FarFieldAsymptoticsEvidence {G : RiemannianCurvaturePackage} {F : ScatteringPDEPackage G} (A : FarFieldAsymptoticsPackage F) where
  farFieldPatternClosed : A.farFieldPattern
  angularDependenceClosed : A.angularDependence
  decayRateClosed : A.decayRate
  uniformBoundClosed : A.uniformBound

def FarFieldAsymptoticsClosed {G : RiemannianCurvaturePackage} {F : ScatteringPDEPackage G} (A : FarFieldAsymptoticsPackage F) : Prop :=
  A.farFieldPattern ∧ A.angularDependence ∧ A.decayRate ∧ A.uniformBound

theorem far_field_asymptotics_closed_from_evidence {G : RiemannianCurvaturePackage} {F : ScatteringPDEPackage G} (A : FarFieldAsymptoticsPackage F) (E : FarFieldAsymptoticsEvidence A) :
    FarFieldAsymptoticsClosed A := by
  exact And.intro E.farFieldPatternClosed (And.intro E.angularDependenceClosed (And.intro E.decayRateClosed E.uniformBoundClosed))

end DiffractionScatteringTheoremCanonicalLaneLean
end HautevilleHouse