import CalculusMikusiNskiOperationalCalculiLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CalculusMikusiNskiOperationalCalculiLemmaCanonicalLaneLean

structure MikusinskiOperatorField where
  carrier : Type u
  addition : carrier → carrier → carrier
  multiplication : carrier → carrier → carrier
  zero : carrier
  one : carrier
  convolutionIdentity : carrier
  differentiation : carrier → carrier
  integration : carrier → carrier
  fieldAxioms : Field carrier addition multiplication zero one
  convIdentityAxioms : IsConvolutionIdentity convolutionIdentity multiplication
  diffIntRelation : ∀ f, differentiation (integration f) = f

structure MikusinskiOperatorFieldEvidence (F : MikusinskiOperatorField) where
  fieldAxiomsClosed : F.fieldAxioms
  convIdentityAxiomsClosed : F.convIdentityAxioms
  diffIntRelationClosed : ∀ f, F.differentiation (F.integration f) = f

def MikusinskiAlgebraClosed (F : MikusinskiOperatorField) : Prop :=
  F.fieldAxioms ∧ F.convIdentityAxioms ∧ (∀ f, F.differentiation (F.integration f) = f)

theorem mikusinski_algebra_closed_from_evidence (F : MikusinskiOperatorField) (E : MikusinskiOperatorFieldEvidence F) : MikusinskiAlgebraClosed F :=
  And.intro E.fieldAxiomsClosed (And.intro E.convIdentityAxiomsClosed E.diffIntRelationClosed)

end CalculusMikusiNskiOperationalCalculiLemmaCanonicalLaneLean
end HautevilleHouse