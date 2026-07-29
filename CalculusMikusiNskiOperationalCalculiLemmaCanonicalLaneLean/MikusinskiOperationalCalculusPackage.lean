import canonicalLaneMathlib.AdmissibleClass
import MikusinskiConvolutionPackage

namespace HautevilleHouse
namespace MikusinskiCalculi

structure MikusinskiOperationalCalculusPackage (P : MikusinskiConvolutionPackage) where
  operatorField : Type
  fieldOperations : Prop
  embedding : P.functionSpace → operatorField
  inverseIntegration : operatorField
  integrationInvertible : embedding P.integrationOperator * inverseIntegration = 1
  differentialEquationSolution : Prop

structure MikusinskiOperationalCalculusEvidence {P : MikusinskiConvolutionPackage}
    (Q : MikusinskiOperationalCalculusPackage P) where
  fieldOperationsClosed : Q.fieldOperations
  integrationInvertibleClosed : Q.integrationInvertible
  differentialEquationSolutionClosed : Q.differentialEquationSolution

def MikusinskiOperationalCalculusClosed {P : MikusinskiConvolutionPackage}
    (Q : MikusinskiOperationalCalculusPackage P) : Prop :=
  Q.fieldOperations ∧ Q.integrationInvertible ∧ Q.differentialEquationSolution

theorem mikusinski_operational_calculus_closed_from_evidence
    {P : MikusinskiConvolutionPackage} (Q : MikusinskiOperationalCalculusPackage P)
    (E : MikusinskiOperationalCalculusEvidence Q) : MikusinskiOperationalCalculusClosed Q := by
  exact And.intro E.fieldOperationsClosed
    (And.intro E.integrationInvertibleClosed E.differentialEquationSolutionClosed)

end MikusinskiCalculi
end HautevilleHouse