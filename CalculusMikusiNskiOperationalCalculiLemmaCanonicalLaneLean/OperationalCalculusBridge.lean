import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CalculusMikusinskiOperationalCalculiLemmaCanonicalLaneLean.ConvolutionAlgebra

namespace HautevilleHouse
namespace CalculusMikusinskiOperationalCalculiLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ConvolutionAlgebraClosed A (someConvolutionAlgebra A)

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  unfold bridgeClosed
  -- Use the lemma that admissible classes yield closed convolution algebras
  apply AdmissibleClass.convolutionAlgebra_closed (someConvolutionAlgebra A)

end CalculusMikusinskiOperationalCalculiLemmaCanonicalLaneLean
end HautevilleHouse