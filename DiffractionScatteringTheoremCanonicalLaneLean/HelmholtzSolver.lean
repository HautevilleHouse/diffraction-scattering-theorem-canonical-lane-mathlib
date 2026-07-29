import HautevilleHouse.DiffractionScatteringTheoremCanonicalLaneLean.DiffractionScatteringSystem

namespace HautevilleHouse
namespace DiffractionScatteringTheoremCanonicalLaneLean

structure HelmholtzSolver {D : DiffractionScatteringSystem} where
  frequencyDomain : Type u
  helmholtzEquation : Prop
  boundaryIntegralOperator : Type v
  numericalDiscretization : Prop
  convergenceAnalysis : Prop
  radiationConditionEnforced : Prop

structure HelmholtzSolverEvidence {D : DiffractionScatteringSystem}
    (H : HelmholtzSolver D) where
  helmholtzEquationClosed : H.helmholtzEquation
  numericalDiscretizationClosed : H.numericalDiscretization
  convergenceAnalysisClosed : H.convergenceAnalysis
  radiationConditionEnforcedClosed : H.radiationConditionEnforced

def HelmholtzSolverClosed {D : DiffractionScatteringSystem}
    (H : HelmholtzSolver D) : Prop :=
  H.helmholtzEquation ∧ H.numericalDiscretization ∧
  H.convergenceAnalysis ∧ H.radiationConditionEnforced

theorem helmholtz_solver_closed_from_evidence
    {D : DiffractionScatteringSystem} (H : HelmholtzSolver D)
    (E : HelmholtzSolverEvidence H) : HelmholtzSolverClosed H := by
  exact And.intro E.helmholtzEquationClosed
    (And.intro E.numericalDiscretizationClosed
      (And.intro E.convergenceAnalysisClosed
        E.radiationConditionEnforcedClosed))

end DiffractionScatteringTheoremCanonicalLaneLean
end HautevilleHouse