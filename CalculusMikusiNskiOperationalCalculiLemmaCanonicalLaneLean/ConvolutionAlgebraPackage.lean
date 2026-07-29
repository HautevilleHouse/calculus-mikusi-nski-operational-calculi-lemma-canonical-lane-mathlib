import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CalculusMikusiNskiOperationalCalculiLemmaCanonicalLaneLean.OperationalCalculiSpace

namespace HautevilleHouse
namespace CalculusMikusiNskiOperationalCalculiLemmaCanonicalLaneLean

structure ConvolutionAlgebraPackage (S : OperationalCalculiSpace) where
  convolutionProduct : S.carrier → S.carrier → S.carrier
  associativity : Prop
  commutativity : Prop
  identityElement : S.carrier
  identityElementIsDirac : S.carrier = S.diracDelta → identityElement = S.diracDelta
  closureUnderConvolution : ∀ f g : S.carrier, convolutionProduct f g ∈ S.carrier

structure ConvolutionAlgebraEvidence {S : OperationalCalculiSpace} (C : ConvolutionAlgebraPackage S) where
  associativityClosed : C.associativity
  commutativityClosed : C.commutativity
  closureClosed : ∀ f g : S.carrier, C.convolutionProduct f g ∈ S.carrier

def ConvolutionAlgebraClosed {S : OperationalCalculiSpace} (C : ConvolutionAlgebraPackage S) : Prop :=
  C.associativity ∧ C.commutativity ∧ (∀ f g : S.carrier, C.convolutionProduct f g ∈ S.carrier)

theorem convolution_algebra_closed_from_evidence
    {S : OperationalCalculiSpace} (C : ConvolutionAlgebraPackage S)
    (E : ConvolutionAlgebraEvidence C) : ConvolutionAlgebraClosed C := by
  exact And.intro E.associativityClosed (And.intro E.commutativityClosed E.closureClosed)

end CalculusMikusiNskiOperationalCalculiLemmaCanonicalLaneLean
end HautevilleHouse