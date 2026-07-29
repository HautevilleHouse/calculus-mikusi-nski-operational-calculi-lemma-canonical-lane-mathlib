import HautevilleHouse.CalculusMikusiNskiOperationalCalculiLemmaCanonicalLaneLean.OperationalCalculusPackage

namespace HautevilleHouse
namespace CalculusMikusiNskiOperationalCalculiLemmaCanonicalLaneLean

structure QuotientFieldPackage {M : MikusinskiSpace}
    {C : ConvolutionAlgebraPackage M} (O : OperationalCalculusPackage C) where
  fieldStructure : Prop
  embeddingOfConvolutionAlgebra : Prop
  identityField : Prop
  differentiationInField : Prop
  integralInField : Prop

structure QuotientFieldEvidence {M : MikusinskiSpace}
    {C : ConvolutionAlgebraPackage M} {O : OperationalCalculusPackage C}
    (Q : QuotientFieldPackage O) where
  fieldStructureClosed : Q.fieldStructure
  embeddingOfConvolutionAlgebraClosed : Q.embeddingOfConvolutionAlgebra
  identityFieldClosed : Q.identityField
  differentiationInFieldClosed : Q.differentiationInField
  integralInFieldClosed : Q.integralInField

def QuotientFieldClosed {M : MikusinskiSpace}
    {C : ConvolutionAlgebraPackage M} {O : OperationalCalculusPackage C}
    (Q : QuotientFieldPackage O) : Prop :=
  Q.fieldStructure ∧ Q.embeddingOfConvolutionAlgebra ∧
  Q.identityField ∧ Q.differentiationInField ∧ Q.integralInField

theorem quotient_field_closed_from_evidence
    {M : MikusinskiSpace} {C : ConvolutionAlgebraPackage M}
    {O : OperationalCalculusPackage C} (Q : QuotientFieldPackage O)
    (E : QuotientFieldEvidence Q) : QuotientFieldClosed Q := by
  exact And.intro E.fieldStructureClosed
    (And.intro E.embeddingOfConvolutionAlgebraClosed
      (And.intro E.identityFieldClosed
        (And.intro E.differentiationInFieldClosed E.integralInFieldClosed)))

end CalculusMikusiNskiOperationalCalculiLemmaCanonicalLaneLean
end HautevilleHouse