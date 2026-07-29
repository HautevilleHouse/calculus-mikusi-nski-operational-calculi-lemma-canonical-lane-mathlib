import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CalculusMikusiNskiOperationalCalculiLemmaCanonicalLaneLean

structure ConvolutionAlgebra where
  carrier : Type u
  zero : carrier
  add : carrier → carrier → carrier
  smul : ℂ → carrier → carrier
  mul : carrier → carrier → carrier
  zero_add : ∀ a : carrier, add zero a = a
  add_zero : ∀ a : carrier, add a zero = a
  add_assoc : ∀ a b c : carrier, add (add a b) c = add a (add b c)
  add_comm : ∀ a b : carrier, add a b = add b a
  smul_one : ∀ a : carrier, smul 1 a = a
  smul_assoc : ∀ (α β : ℂ) (a : carrier), smul (α * β) a = smul α (smul β a)
  mul_assoc : ∀ a b c : carrier, mul (mul a b) c = mul a (mul b c)
  distrib_left : ∀ a b c : carrier, mul a (add b c) = add (mul a b) (mul a c)
  distrib_right : ∀ a b c : carrier, mul (add a b) c = add (mul a c) (mul b c)
  zero_mul : ∀ a : carrier, mul zero a = zero
  mul_zero : ∀ a : carrier, mul a zero = zero
  convolution_defined : Prop
  support_finiteness : Prop

structure ConvolutionAlgebraEvidence (C : ConvolutionAlgebra) where
  convolution_defined_closed : C.convolution_defined
  support_finiteness_closed : C.support_finiteness

def ConvolutionAlgebraClosed (C : ConvolutionAlgebra) : Prop :=
  C.convolution_defined ∧ C.support_finiteness

theorem convolution_algebra_closed_from_evidence (C : ConvolutionAlgebra) (E : ConvolutionAlgebraEvidence C) :
    ConvolutionAlgebraClosed C :=
  And.intro E.convolution_defined_closed E.support_finiteness_closed

end CalculusMikusiNskiOperationalCalculiLemmaCanonicalLaneLean
end HautevilleHouse