import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CalculusMikusiNskiOperationalCalculiLemmaCanonicalLaneLean.ConvolutionAlgebraPackage
import HautevilleHouse.CalculusMikusiNskiOperationalCalculiLemmaCanonicalLaneLean.GateLemmas
import HautevilleHouse.CalculusMikusiNskiOperationalCalculiLemmaCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace CalculusMikusiNskiOperationalCalculiLemmaCanonicalLaneLean

def ConstrainedMikusinskiClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_mikusinski_endgame (A : AdmissibleClass) :
    ConstrainedMikusinskiClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CalculusMikusiNskiOperationalCalculiLemmaCanonicalLaneLean
end HautevilleHouse