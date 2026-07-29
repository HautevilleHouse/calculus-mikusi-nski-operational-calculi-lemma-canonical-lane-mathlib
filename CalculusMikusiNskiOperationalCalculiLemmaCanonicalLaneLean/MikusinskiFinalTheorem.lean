import canonicalLaneMathlib.AdmissibleClass
import MikusinskiCore

namespace HautevilleHouse
namespace MikusinskiCalculi

def ConstrainedMikusinskiCalculiClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_mikusinski_endgame (A : AdmissibleClass) :
    ConstrainedMikusinskiCalculiClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end MikusinskiCalculi
end HautevilleHouse