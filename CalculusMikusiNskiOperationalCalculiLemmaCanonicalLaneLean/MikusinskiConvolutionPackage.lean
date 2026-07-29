import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MikusinskiCalculi

structure MikusinskiConvolutionPackage where
  functionSpace : Type u
  zeroFunction : functionSpace
  add : functionSpace → functionSpace → functionSpace
  convolution : functionSpace → functionSpace → functionSpace
  convolutionAssociative : Prop
  convolutionCommutative : Prop
  convolutionDistributive : Prop
  hasNoZeroDivisors : Prop  -- Titchmarsh theorem
  heavisideStep : functionSpace
  integrationOperator : functionSpace → functionSpace
  integrationAsConvolution : integrationOperator = convolution heavisideStep

structure MikusinskiConvolutionEvidence (P : MikusinskiConvolutionPackage) where
  convolutionAssociativeClosed : P.convolutionAssociative
  convolutionCommutativeClosed : P.convolutionCommutative
  convolutionDistributiveClosed : P.convolutionDistributive
  hasNoZeroDivisorsClosed : P.hasNoZeroDivisors
  integrationAsConvolutionClosed : P.integrationAsConvolution

def MikusinskiConvolutionClosed (P : MikusinskiConvolutionPackage) : Prop :=
  P.convolutionAssociative ∧ P.convolutionCommutative ∧ P.convolutionDistributive ∧
  P.hasNoZeroDivisors ∧ P.integrationAsConvolution

theorem mikusinski_convolution_closed_from_evidence (P : MikusinskiConvolutionPackage)
    (E : MikusinskiConvolutionEvidence P) : MikusinskiConvolutionClosed P := by
  exact And.intro E.convolutionAssociativeClosed
    (And.intro E.convolutionCommutativeClosed
      (And.intro E.convolutionDistributiveClosed
        (And.intro E.hasNoZeroDivisorsClosed E.integrationAsConvolutionClosed)))

end MikusinskiCalculi
end HautevilleHouse