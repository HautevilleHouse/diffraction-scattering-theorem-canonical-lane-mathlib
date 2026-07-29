import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiffractionScatteringTheoremCanonicalLaneLean

structure KirchhoffIntegralPackage where
  boundaryValues : Prop
  GreenFunction : Prop
  integralRepresentation : Prop
  farFieldAsymptotics : Prop

structure KirchhoffIntegralEvidence (K : KirchhoffIntegralPackage) where
  boundaryValuesClosed : K.boundaryValues
  greenFunctionClosed : K.GreenFunction
  integralRepresentationClosed : K.integralRepresentation
  farFieldAsymptoticsClosed : K.farFieldAsymptotics

def KirchhoffIntegralClosed (K : KirchhoffIntegralPackage) : Prop :=
  K.boundaryValues ∧ K.GreenFunction ∧ K.integralRepresentation ∧ K.farFieldAsymptotics

theorem kirchhoff_integral_closed_from_evidence (K : KirchhoffIntegralPackage)
    (E : KirchhoffIntegralEvidence K) : KirchhoffIntegralClosed K := by
  exact And.intro E.boundaryValuesClosed
    (And.intro E.greenFunctionClosed
      (And.intro E.integralRepresentationClosed E.farFieldAsymptoticsClosed))

end DiffractionScatteringTheoremCanonicalLaneLean
end HautevilleHouse