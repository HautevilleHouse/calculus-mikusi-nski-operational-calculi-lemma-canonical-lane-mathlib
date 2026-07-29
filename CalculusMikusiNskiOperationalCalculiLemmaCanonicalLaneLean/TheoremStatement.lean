import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CalculusMikusiNskiOperationalCalculiLemmaCanonicalLaneLean

structure MikusinskiAdmittedObject where
  carrier : Type
  topology : TopologicalSpace carrier
  operationalCalculiProperty : Prop
  conclusion : operationalCalculiProperty

def MikusinskiWitnessClosed (O : MikusinskiAdmittedObject) : Prop :=
  O.operationalCalculiProperty

end CalculusMikusiNskiOperationalCalculiLemmaCanonicalLaneLean
end HautevilleHouse