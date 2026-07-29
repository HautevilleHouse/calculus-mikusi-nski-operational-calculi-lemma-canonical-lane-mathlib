import canonicalLaneMathlib.AdmissibleClass
import CalculusMikusiNskiOperationalCalculiLemmaCanonicalLaneLean.TitchmarshTheorem

namespace HautevilleHouse
namespace CalculusMikusiNskiOperationalCalculiLemmaCanonicalLaneLean

structure OperationalCalculusLemma where
  differential_equation_solving : Prop
  operational_calculus_defined : Prop
  mikusinski_operators_correspondence : Prop

structure OperationalCalculusLemmaEvidence (L : OperationalCalculusLemma) where
  differential_equation_solving_closed : L.differential_equation_solving
  operational_calculus_defined_closed : L.operational_calculus_defined
  mikusinski_operators_correspondence_closed : L.mikusinski_operators_correspondence

def OperationalCalculusLemmaClosed (L : OperationalCalculusLemma) : Prop :=
  L.differential_equation_solving ∧ L.operational_calculus_defined ∧ L.mikusinski_operators_correspondence

theorem operational_calculus_lemma_closed_from_evidence (L : OperationalCalculusLemma) (E : OperationalCalculusLemmaEvidence L) :
    OperationalCalculusLemmaClosed L :=
  And.intro E.differential_equation_solving_closed (And.intro E.operational_calculus_defined_closed E.mikusinski_operators_correspondence_closed)

end CalculusMikusiNskiOperationalCalculiLemmaCanonicalLaneLean
end HautevilleHouse