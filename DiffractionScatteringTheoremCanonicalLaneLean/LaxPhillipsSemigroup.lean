import DiffractionScatteringTheoremCanonicalLaneLean.ScatteringTheoryCore

namespace HautevilleHouse
namespace DiffractionScatteringTheoremCanonicalLaneLean

structure LaxPhillipsSemigroup (M : DiffractionScatteringSpace) where
  timeShift : ℝ → (M.carrier → ℂ) → (M.carrier → ℂ)
  semigroupProperty : Prop
  contractionProperty : Prop
  orthogonalDecomposition : Prop

structure LaxPhillipsEvidence (M : DiffractionScatteringSpace)
    (L : LaxPhillipsSemigroup M) where
  semigroupClosed : L.semigroupProperty
  contractionClosed : L.contractionProperty
  orthogonalDecompositionClosed : L.orthogonalDecomposition

df LaxPhillipsClosed (M : DiffractionScatteringSpace) (L : LaxPhillipsSemigroup M) : Prop :=
  L.semigroupProperty ∧ L.contractionProperty ∧ L.orthogonalDecomposition

theorem lax_phillips_closed_from_evidence
    {M : DiffractionScatteringSpace} {L : LaxPhillipsSemigroup M}
    (E : LaxPhillipsEvidence M L) : LaxPhillipsClosed M L := by
  exact And.intro E.semigroupClosed
    (And.intro E.contractionClosed E.orthogonalDecompositionClosed)

end DiffractionScatteringTheoremCanonicalLaneLean
end HautevilleHouse