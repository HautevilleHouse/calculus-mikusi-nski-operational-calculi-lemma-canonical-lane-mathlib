import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CalculusMikusinskiOperationalCalculiLemmaCanonicalLaneLean.ConvolutionAlgebra

namespace HautevilleHouse
namespace CalculusMikusinskiOperationalCalculiLemmaCanonicalLaneLean

structure OperationalCalculusField (A : AdmissibleClass) (C : ConvolutionAlgebra A) where
  numerator : C.carrier
  denominator : C.carrier
  nonzero_denom : denominator ≠ C.zero
  equiv : (numerator, denominator) → (C.carrier × C.carrier) → Prop

def FieldOperator (A : AdmissibleClass) (C : ConvolutionAlgebra A) : Type u :=
  (f : C.carrier × C.carrier) × (f.2 ≠ C.zero)

structure OperationalCalculusFieldEvidence (A : AdmissibleClass) (C : ConvolutionAlgebra A) (F : OperationalCalculusField A C) where
  nonzero_denom_closed : F.nonzero_denom

def OperationalCalculusFieldClosed (A : AdmissibleClass) (C : ConvolutionAlgebra A) (F : OperationalCalculusField A C) : Prop :=
  F.nonzero_denom

theorem operational_calculus_field_closed_from_evidence (A : AdmissibleClass) (C : ConvolutionAlgebra A) (F : OperationalCalculusField A C) (E : OperationalCalculusFieldEvidence A C F) : OperationalCalculusFieldClosed A C F := by
  exact E.nonzero_denom_closed

end CalculusMikusinskiOperationalCalculiLemmaCanonicalLaneLean
end HautevilleHouse