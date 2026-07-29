import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CalculusMikusiNskiOperationalCalculiLemmaCanonicalLaneLean.ConvolutionAlgebra

namespace HautevilleHouse
namespace CalculusMikusiNskiOperationalCalculiLemmaCanonicalLaneLean

structure OperationalCalculiPackage {K : Type} [Field K] (A : ConvolutionAlgebra K) where
  fieldOfOperators : Type
  zero : fieldOfOperators
  one : fieldOfOperators
  addOp : fieldOfOperators → fieldOfOperators → fieldOfOperators
  mulOp : fieldOfOperators → fieldOfOperators → fieldOfOperators
  invOp : fieldOfOperators → fieldOfOperators
  algebraMap : A.carrier → fieldOfOperators  -- embedding of functions into operators
  deltaMapped : algebraMap A.delta = one
  convolutionToMultiplication : ∀ f g : A.carrier, algebraMap (A.convolution f g) = mulOp (algebraMap f) (algebraMap g)

structure OperationalCalculiEvidence {K : Type} [Field K] {A : ConvolutionAlgebra K} (P : OperationalCalculiPackage A) where
  fieldAxioms : ∀ x y z : P.fieldOfOperators,
    P.addOp (P.addOp x y) z = P.addOp x (P.addOp y z) ∧
    P.addOp x P.zero = x ∧
    P.addOp x (P.invOp x) = P.zero ∧
    P.addOp x y = P.addOp y x ∧
    P.mulOp (P.mulOp x y) z = P.mulOp x (P.mulOp y z) ∧
    P.mulOp x P.one = x ∧
    P.mulOp x (P.invOp x) = P.one ∧
    P.mulOp x (P.addOp y z) = P.addOp (P.mulOp x y) (P.mulOp x z)
  algebraMapInjective : Function.Injective P.algebraMap

def OperationalCalculiClosed {K : Type} [Field K] {A : ConvolutionAlgebra K} (P : OperationalCalculiPackage A) : Prop :=
  ∀ f : P.fieldOfOperators, f = P.zero ∨ ∃ g : P.fieldOfOperators, P.mulOp g f = P.one

end CalculusMikusiNskiOperationalCalculiLemmaCanonicalLaneLean
end HautevilleHouse
