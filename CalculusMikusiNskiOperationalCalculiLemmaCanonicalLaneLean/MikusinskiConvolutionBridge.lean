import canonicalLaneMathlib.AdmissibleClass
import CalculusMikusiNskiOperationalCalculiLemmaCanonicalLaneLean.MikusinskiAlgebraConstruction

namespace HautevilleHouse
namespace CalculusMikusiNskiOperationalCalculiLemmaCanonicalLaneLean

structure ConvolutionBridgePackage where
  sourceAlgebra : MikusinskiAlgebraConvolution
  targetField : MikusinskiField
  embeddingMap : (sourceAlgebra.baseSpace → ℂ) → targetField.operator.carrier
  embeddingInjective : Prop
  embeddingRespectsConvolution : Prop
  embeddingRespectsIdentity : Prop
  embeddingInjectiveConstructed : embeddingInjective
  embeddingRespectsConvolutionConstructed : embeddingRespectsConvolution
  embeddingRespectsIdentityConstructed : embeddingRespectsIdentity

structure ConvolutionBridgeEvidence (P : ConvolutionBridgePackage) where
  embeddingInjectiveClosed : P.embeddingInjective
  embeddingRespectsConvolutionClosed : P.embeddingRespectsConvolution
  embeddingRespectsIdentityClosed : P.embeddingRespectsIdentity

def ConvolutionBridgeClosed (P : ConvolutionBridgePackage) : Prop :=
  P.embeddingInjective ∧ P.embeddingRespectsConvolution ∧ P.embeddingRespectsIdentity

theorem convolution_bridge_closed_from_evidence
    (P : ConvolutionBridgePackage) (E : ConvolutionBridgeEvidence P) :
    ConvolutionBridgeClosed P := by
  exact And.intro E.embeddingInjectiveClosed
    (And.intro E.embeddingRespectsConvolutionClosed E.embeddingRespectsIdentityClosed)

theorem convolution_bridge_supports_bridge_lemma (P : ConvolutionBridgePackage) :
    (∀ a : P.targetField.operator.carrier, P.targetField.operator.multiplication P.targetField.operator.one a = a) := by
  intro a
  exact P.targetField.operator.oneMul a

end CalculusMikusiNskiOperationalCalculiLemmaCanonicalLaneLean
end HautevilleHouse