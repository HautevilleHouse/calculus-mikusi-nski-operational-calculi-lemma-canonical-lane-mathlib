import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CalculusMikusiNskiOperationalCalculiLemmaCanonicalLaneLean

structure MikusinskiSpace where
  carrier : Type
  topology : TopologicalSpace carrier

definition MikusinskiConvolutionAlgebra (M : MikusinskiSpace) : Type := M.carrier → M.carrier → M.carrier

structure MikusinskiObject where
  space : MikusinskiSpace
  convolutionProduct : MikusinskiConvolutionAlgebra space
  identityElement : space.carrier
  differentiationOperator : space.carrier
  integralOperator : space.carrier
  operationalCalculusLemmaHolds : Prop

end CalculusMikusiNskiOperationalCalculiLemmaCanonicalLaneLean
end HautevilleHouse