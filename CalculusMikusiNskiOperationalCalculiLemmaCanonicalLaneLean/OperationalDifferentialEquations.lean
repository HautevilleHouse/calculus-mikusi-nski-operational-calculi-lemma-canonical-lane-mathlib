import CalculusMikusiNskiOperationalCalculiLemmaCanonicalLaneLean.OperationalFunctions

namespace HautevilleHouse
namespace CalculusMikusiNskiOperationalCalculiLemmaCanonicalLaneLean

structure OperationalDifferentialEquation (F : MikusinskiOperatorField) (C : ConvolutionAlgebra F) (O : OperationalFunctions F C) where
  equation : O.functionSpace → O.functionSpace
  solutionSpace : Set O.functionSpace
  operationalForm : F.carrier → F.carrier
  operationalEquivalence : ∀ f, O.operationalCalculus (equation f) = operationalForm (O.operationalCalculus f)
  solvabilityCondition : ∃ g ∈ solutionSpace, equation g = O.zero

structure OperationalDifferentialEquationEvidence {F : MikusinskiOperatorField} {C : ConvolutionAlgebra F} {O : OperationalFunctions F C} (D : OperationalDifferentialEquation F C O) where
  operationalEquivalenceClosed : ∀ f, O.operationalCalculus (D.equation f) = D.operationalForm (O.operationalCalculus f)
  solvabilityConditionClosed : ∃ g ∈ D.solutionSpace, D.equation g = O.zero

def OperationalDifferentialEquationClosed {F : MikusinskiOperatorField} {C : ConvolutionAlgebra F} {O : OperationalFunctions F C} (D : OperationalDifferentialEquation F C O) : Prop :=
  (∀ f, O.operationalCalculus (D.equation f) = D.operationalForm (O.operationalCalculus f)) ∧
  (∃ g ∈ D.solutionSpace, D.equation g = O.zero)

theorem operational_differential_equation_closed_from_evidence {F : MikusinskiOperatorField} {C : ConvolutionAlgebra F} {O : OperationalFunctions F C} (D : OperationalDifferentialEquation F C O) (E : OperationalDifferentialEquationEvidence D) : OperationalDifferentialEquationClosed D :=
  And.intro E.operationalEquivalenceClosed E.solvabilityConditionClosed

end CalculusMikusiNskiOperationalCalculiLemmaCanonicalLaneLean
end HautevilleHouse