import HautevilleHouse.CalculusMikusiNskiOperationalCalculiLemmaCanonicalLaneLean.ConvolutionAlgebraPackage

namespace HautevilleHouse
namespace CalculusMikusiNskiOperationalCalculiLemmaCanonicalLaneLean

structure OperationalCalculusPackage {M : MikusinskiSpace}
    (C : ConvolutionAlgebraPackage M) where
  differentiationOperator : M.carrier
  integralOperator : M.carrier
  commutationRelation : Prop
  operationalCalculusLemma : Prop
  fundamentalIdentity : Prop

structure OperationalCalculusEvidence {M : MikusinskiSpace}
    {C : ConvolutionAlgebraPackage M} (O : OperationalCalculusPackage C) where
  commutationRelationClosed : O.commutationRelation
  operationalCalculusLemmaClosed : O.operationalCalculusLemma
  fundamentalIdentityClosed : O.fundamentalIdentity

def OperationalCalculusClosed {M : MikusinskiSpace}
    {C : ConvolutionAlgebraPackage M} (O : OperationalCalculusPackage C) : Prop :=
  O.commutationRelation ∧ O.operationalCalculusLemma ∧ O.fundamentalIdentity

theorem operational_calculus_closed_from_evidence
    {M : MikusinskiSpace} {C : ConvolutionAlgebraPackage M}
    (O : OperationalCalculusPackage C) (E : OperationalCalculusEvidence O) :
    OperationalCalculusClosed O := by
  exact And.intro E.commutationRelationClosed
    (And.intro E.operationalCalculusLemmaClosed E.fundamentalIdentityClosed)

end CalculusMikusiNskiOperationalCalculiLemmaCanonicalLaneLean
end HautevilleHouse