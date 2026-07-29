import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CalculusMikusiNskiOperationalCalculiLemmaCanonicalLaneLean.OperationalCalculiSpace

namespace HautevilleHouse
namespace CalculusMikusiNskiOperationalCalculiLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  mikusinskiField

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  have H : mikusinskiField := by
    unfold mikusinskiField
    exact And.intro (fun _ => A.object.space.continuousFunctions) (fun _ => A.object.space.convolutionAlgebra)
  exact H

end CalculusMikusiNskiOperationalCalculiLemmaCanonicalLaneLean
end HautevilleHouse