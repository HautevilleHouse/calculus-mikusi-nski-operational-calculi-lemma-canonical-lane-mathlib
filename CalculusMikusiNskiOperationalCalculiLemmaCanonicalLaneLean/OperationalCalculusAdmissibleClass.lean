import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CalculusMikusiNskiOperationalCalculiLemmaCanonicalLaneLean

structure MikusinskiOperator where
  carrier : Type
  addition : carrier → carrier → carrier
  multiplication : carrier → carrier → carrier
  zero : carrier
  one : carrier
  addAssoc : ∀ a b c : carrier, addition (addition a b) c = addition a (addition b c)
  addComm : ∀ a b : carrier, addition a b = addition b a
  zeroAdd : ∀ a : carrier, addition zero a = a
  addZero : ∀ a : carrier, addition a zero = a
  mulAssoc : ∀ a b c : carrier, multiplication (multiplication a b) c = multiplication a (multiplication b c)
  oneMul : ∀ a : carrier, multiplication one a = a
  mulOne : ∀ a : carrier, multiplication a one = a
  distribLeft : ∀ a b c : carrier, multiplication a (addition b c) = addition (multiplication a b) (multiplication a c)
  distribRight : ∀ a b c : carrier, multiplication (addition a b) c = addition (multiplication a c) (multiplication b c)

structure MikusinskiField where
  operator : MikusinskiOperator
  invertibleNonZero : ∀ a : operator.carrier, a ≠ operator.zero → ∃ b : operator.carrier, operator.multiplication a b = operator.one ∧ operator.multiplication b a = operator.one

structure AdmissibleClass where
  object : MikusinskiField
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  (∀ a : A.object.operator.carrier, A.object.operator.multiplication A.object.operator.one a = a) ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CalculusMikusiNskiOperationalCalculiLemmaCanonicalLaneLean
end HautevilleHouse