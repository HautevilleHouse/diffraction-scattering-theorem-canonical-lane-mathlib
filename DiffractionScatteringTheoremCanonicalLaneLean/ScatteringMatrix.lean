import DiffractionScatteringTheoremCanonicalLaneLean.ScatteringTheoryCore

namespace HautevilleHouse
namespace DiffractionScatteringTheoremCanonicalLaneLean

structure ScatteringMatrixPackage (M : DiffractionScatteringSpace) where
  sMatrix : ℂ → Matrix (Fin n) (Fin n) ℂ
  energyRange : ℝ
  unitarity : Prop
  analyticity : Prop
  polesLocation : Prop

structure ScatteringMatrixEvidence (M : DiffractionScatteringSpace)
    (S : ScatteringMatrixPackage M) where
  unitarityClosed : S.unitarity
  analyticityClosed : S.analyticity
  polesLocationClosed : S.polesLocation

df ScatteringMatrixClosed (M : DiffractionScatteringSpace)
    (S : ScatteringMatrixPackage M) : Prop :=
  S.unitarity ∧ S.analyticity ∧ S.polesLocation

theorem scattering_matrix_closed_from_evidence
    {M : DiffractionScatteringSpace} {S : ScatteringMatrixPackage M}
    (E : ScatteringMatrixEvidence M S) : ScatteringMatrixClosed M S := by
  exact And.intro E.unitarityClosed
    (And.intro E.analyticityClosed E.polesLocationClosed)

end DiffractionScatteringTheoremCanonicalLaneLean
end HautevilleHouse