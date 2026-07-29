import canonicalLaneMathlib.AdmissibleClass
import CalculusMikusiNskiOperationalCalculiLemmaCanonicalLaneLean.ConvolutionAlgebra

namespace HautevilleHouse
namespace CalculusMikusiNskiOperationalCalculiLemmaCanonicalLaneLean

structure MikusinskiField (C : ConvolutionAlgebra) where
  carrier : Type u
  zero : carrier
  one : carrier
  add : carrier → carrier → carrier
  mul : carrier → carrier → carrier
  inv : carrier → carrier
  field_axioms : Prop
  contains_function_algebra : Prop
  titchmarsh_property : Prop

structure MikusinskiFieldEvidence {C : ConvolutionAlgebra} (M : MikusinskiField C) where
  field_axioms_closed : M.field_axioms
  contains_function_algebra_closed : M.contains_function_algebra
  titchmarsh_property_closed : M.titchmarsh_property

def MikusinskiFieldClosed {C : ConvolutionAlgebra} (M : MikusinskiField C) : Prop :=
  M.field_axioms ∧ M.contains_function_algebra ∧ M.titchmarsh_property

theorem mikusinski_field_closed_from_evidence {C : ConvolutionAlgebra} (M : MikusinskiField C) (E : MikusinskiFieldEvidence M) :
    MikusinskiFieldClosed M :=
  And.intro E.field_axioms_closed (And.intro E.contains_function_algebra_closed E.titchmarsh_property_closed)

end CalculusMikusiNskiOperationalCalculiLemmaCanonicalLaneLean
end HautevilleHouse