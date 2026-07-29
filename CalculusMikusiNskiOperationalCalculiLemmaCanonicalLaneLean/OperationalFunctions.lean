import CalculusMikusiNskiOperationalCalculiLemmaCanonicalLaneLean.ConvolutionAlgebra

namespace HautevilleHouse
namespace CalculusMikusiNskiOperationalCalculiLemmaCanonicalLaneLean

structure OperationalFunctions (F : MikusinskiOperatorField) (C : ConvolutionAlgebra F) where
  functionSpace : Type u
  topology : TopologicalSpace functionSpace
  differentiation : functionSpace → functionSpace
  integration : functionSpace → functionSpace
  translation : ℝ → functionSpace → functionSpace
  operationalCalculus : functionSpace → F.carrier
  operationalCalculusHomomorphism : operationalCalculus (differentiation f) = F.differentiation (operationalCalculus f)
  translationProperty : ∀ a f, operationalCalculus (translation a f) = someExpression a (operationalCalculus f)

structure OperationalFunctionsEvidence {F : MikusinskiOperatorField} {C : ConvolutionAlgebra F} (O : OperationalFunctions F C) where
  operationalCalculusHomomorphismClosed : ∀ f, O.operationalCalculus (O.differentiation f) = F.differentiation (O.operationalCalculus f)
  translationPropertyClosed : ∀ a f, O.operationalCalculus (O.translation a f) = someExpression a (O.operationalCalculus f)

def OperationalFunctionsClosed {F : MikusinskiOperatorField} {C : ConvolutionAlgebra F} (O : OperationalFunctions F C) : Prop :=
  (∀ f, O.operationalCalculus (O.differentiation f) = F.differentiation (O.operationalCalculus f)) ∧
  (∀ a f, O.operationalCalculus (O.translation a f) = someExpression a (O.operationalCalculus f))

theorem operational_functions_closed_from_evidence {F : MikusinskiOperatorField} {C : ConvolutionAlgebra F} (O : OperationalFunctions F C) (E : OperationalFunctionsEvidence O) : OperationalFunctionsClosed O :=
  And.intro E.operationalCalculusHomomorphismClosed E.translationPropertyClosed

end CalculusMikusiNskiOperationalCalculiLemmaCanonicalLaneLean
end HautevilleHouse