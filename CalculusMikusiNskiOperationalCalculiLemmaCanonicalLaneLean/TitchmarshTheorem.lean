import canonicalLaneMathlib.AdmissibleClass
import CalculusMikusiNskiOperationalCalculiLemmaCanonicalLaneLean.MikusinskiField

namespace HautevilleHouse
namespace CalculusMikusiNskiOperationalCalculiLemmaCanonicalLaneLean

structure TitchmarshTheorem where
  convolution_support : Prop
  support_intersection_property : Prop
  implies_invertibility : Prop

structure TitchmarshTheoremEvidence (T : TitchmarshTheorem) where
  convolution_support_closed : T.convolution_support
  support_intersection_property_closed : T.support_intersection_property
  implies_invertibility_closed : T.implies_invertibility

def TitchmarshTheoremClosed (T : TitchmarshTheorem) : Prop :=
  T.convolution_support ∧ T.support_intersection_property ∧ T.implies_invertibility

theorem titchmarsh_theorem_closed_from_evidence (T : TitchmarshTheorem) (E : TitchmarshTheoremEvidence T) :
    TitchmarshTheoremClosed T :=
  And.intro E.convolution_support_closed (And.intro E.support_intersection_property_closed E.implies_invertibility_closed)

end CalculusMikusiNskiOperationalCalculiLemmaCanonicalLaneLean
end HautevilleHouse