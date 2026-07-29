import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CalculusMikusiNskiOperationalCalculiLemmaCanonicalLaneLean.OperationalCalculiPackage

namespace HautevilleHouse
namespace CalculusMikusiNskiOperationalCalculiLemmaCanonicalLaneLean

structure OperationalCalculiEvidencePackage {K : Type} [Field K] {A : ConvolutionAlgebra K} (P : OperationalCalculiPackage A) where
  fieldAxiomsSatisfied : ∀ x y z : P.fieldOfOperators,
    P.addOp (P.addOp x y) z = P.addOp x (P.addOp y z) ∧
    P.addOp x P.zero = x ∧
    P.addOp x (P.invOp x) = P.zero ∧
    P.addOp x y = P.addOp y x ∧
    P.mulOp (P.mulOp x y) z = P.mulOp x (P.mulOp y z) ∧
    P.mulOp x P.one = x ∧
    P.mulOp x (P.invOp x) = P.one ∧
    P.mulOp x (P.addOp y z) = P.addOp (P.mulOp x y) (P.mulOp x z)
  algebraMapInjective : Function.Injective P.algebraMap

end CalculusMikusiNskiOperationalCalculiLemmaCanonicalLaneLean
end HautevilleHouse
