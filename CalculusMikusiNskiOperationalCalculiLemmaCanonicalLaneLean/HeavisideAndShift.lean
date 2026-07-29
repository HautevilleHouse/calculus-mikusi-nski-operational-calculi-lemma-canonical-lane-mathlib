import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CalculusMikusinskiOperationalCalculiLemmaCanonicalLaneLean.ConvolutionAlgebra

namespace HautevilleHouse
namespace CalculusMikusinskiOperationalCalculiLemmaCanonicalLaneLean

structure HeavisideFunction (A : AdmissibleClass) (C : ConvolutionAlgebra A) where
  H : C.carrier
  derivative_property : C.convolution C.one H = H
  scaling : ∀ a : ℕ, C.convolution (C.one ^ a) H = C.one ^ (a + 1) / (C.one ^ (a + 1))

structure ShiftOperator (A : AdmissibleClass) (C : ConvolutionAlgebra A) where
  shift : ℕ → C.carrier → C.carrier
  shift_convolution : ∀ n f g, shift n (C.convolution f g) = C.convolution (shift n f) g
  shift_composition : ∀ m n, shift m ∘ shift n = shift (m + n)

structure HeavisideAndShiftEvidence (A : AdmissibleClass) (C : ConvolutionAlgebra A) (H : HeavisideFunction A C) (S : ShiftOperator A C) where
  derivative_property_closed : H.derivative_property
  scaling_closed : H.scaling
  shift_convolution_closed : S.shift_convolution
  shift_composition_closed : S.shift_composition

def HeavisideAndShiftClosed (A : AdmissibleClass) (C : ConvolutionAlgebra A) (H : HeavisideFunction A C) (S : ShiftOperator A C) : Prop :=
  H.derivative_property ∧ H.scaling ∧ S.shift_convolution ∧ S.shift_composition

theorem heaviside_and_shift_closed_from_evidence (A : AdmissibleClass) (C : ConvolutionAlgebra A) (H : HeavisideFunction A C) (S : ShiftOperator A C) (E : HeavisideAndShiftEvidence A C H S) : HeavisideAndShiftClosed A C H S := by
  exact And.intro E.derivative_property_closed (And.intro E.scaling_closed (And.intro E.shift_convolution_closed E.shift_composition_closed))

end CalculusMikusinskiOperationalCalculiLemmaCanonicalLaneLean
end HautevilleHouse