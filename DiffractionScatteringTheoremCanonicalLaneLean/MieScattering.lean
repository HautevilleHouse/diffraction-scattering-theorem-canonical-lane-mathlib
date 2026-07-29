import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffractionScatteringTheoremCanonicalLaneLean

structure MieScatteringPackage where
  sphericalParticle : Prop
  sizeParameter : Prop
  refractiveIndex : Prop
  scatteringEfficiency : Prop
  extinctionEfficiency : Prop

structure MieScatteringEvidence (M : MieScatteringPackage) where
  sphericalParticleClosed : M.sphericalParticle
  sizeParameterClosed : M.sizeParameter
  refractiveIndexClosed : M.refractiveIndex
  scatteringEfficiencyClosed : M.scatteringEfficiency
  extinctionEfficiencyClosed : M.extinctionEfficiency

def MieScatteringClosed (M : MieScatteringPackage) : Prop :=
  M.sphericalParticle ∧ M.sizeParameter ∧ M.refractiveIndex ∧
  M.scatteringEfficiency ∧ M.extinctionEfficiency

theorem mie_scattering_closed_from_evidence (M : MieScatteringPackage)
    (E : MieScatteringEvidence M) : MieScatteringClosed M := by
  exact And.intro E.sphericalParticleClosed
    (And.intro E.sizeParameterClosed
      (And.intro E.refractiveIndexClosed
        (And.intro E.scatteringEfficiencyClosed E.extinctionEfficiencyClosed)))

end DiffractionScatteringTheoremCanonicalLaneLean
end HautevilleHouse