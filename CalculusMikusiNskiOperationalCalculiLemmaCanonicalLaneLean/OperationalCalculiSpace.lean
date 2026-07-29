import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CalculusMikusiNskiOperationalCalculiLemmaCanonicalLaneLean

structure OperationalCalculiSpace where
  carrier : Type
  continuousFunctions : Prop
  convolutionAlgebra : Prop
  diracDelta : carrier
  heavisideStep : carrier
  derivationOperator : carrier → carrier
  integrationOperator : carrier → carrier

def mikusinskiField : Prop :=
  (∀ f : OperationalCalculiSpace, f.continuousFunctions) ∧ (∀ f : OperationalCalculiSpace, f.convolutionAlgebra)

end CalculusMikusiNskiOperationalCalculiLemmaCanonicalLaneLean
end HautevilleHouse