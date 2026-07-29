import canonicalLaneMathlib.AdmissibleClass
import CalculusMikusiNskiOperationalCalculiLemmaCanonicalLaneLean.OperationalCalculusAdmissibleClass

namespace HautevilleHouse
namespace CalculusMikusiNskiOperationalCalculiLemmaCanonicalLaneLean

structure MikusinskiAlgebraConvolution where
  baseSpace : Type u
  convolution : (baseSpace → ℂ) → (baseSpace → ℂ) → (baseSpace → ℂ)
  associativity : ∀ f g h : baseSpace → ℂ, convolution (convolution f g) h = convolution f (convolution g h)
  identityElement : baseSpace → ℂ
  identityLeft : ∀ f : baseSpace → ℂ, convolution identityElement f = f
  identityRight : ∀ f : baseSpace → ℂ, convolution f identityElement = f

structure MikusinskiAlgebraConstructionPackage where
  convolutionAlgebra : MikusinskiAlgebraConvolution
  fieldOfFractions : Prop
  embeddingInjective : Prop
  fieldOfFractionsConstructed : fieldOfFractions
  embeddingInjectiveConstructed : embeddingInjective

structure MikusinskiAlgebraConstructionEvidence (P : MikusinskiAlgebraConstructionPackage) where
  fieldOfFractionsClosed : P.fieldOfFractions
  embeddingInjectiveClosed : P.embeddingInjective

def MikusinskiAlgebraConstructionClosed (P : MikusinskiAlgebraConstructionPackage) : Prop :=
  P.fieldOfFractions ∧ P.embeddingInjective

theorem mikusinski_algebra_construction_closed_from_evidence
    (P : MikusinskiAlgebraConstructionPackage) (E : MikusinskiAlgebraConstructionEvidence P) :
    MikusinskiAlgebraConstructionClosed P := by
  exact And.intro E.fieldOfFractionsClosed E.embeddingInjectiveClosed

end CalculusMikusiNskiOperationalCalculiLemmaCanonicalLaneLean
end HautevilleHouse