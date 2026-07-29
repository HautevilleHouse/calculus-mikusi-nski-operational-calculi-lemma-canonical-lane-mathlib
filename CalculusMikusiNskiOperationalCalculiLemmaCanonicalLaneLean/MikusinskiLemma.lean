import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CalculusMikusinskiOperationalCalculiLemmaCanonicalLaneLean.ConvolutionAlgebra
import HautevilleHouse.CalculusMikusinskiOperationalCalculiLemmaCanonicalLaneLean.OperationalCalculusField

namespace HautevilleHouse
namespace CalculusMikusinskiOperationalCalculiLemmaCanonicalLaneLean

structure MikusinskiLemma (A : AdmissibleClass) (C : ConvolutionAlgebra A) (F : OperationalCalculusField A C) where
  statement : Prop
  proof : statement

structure MikusinskiLemmaEvidence (A : AdmissibleClass) (C : ConvolutionAlgebra A) (F : OperationalCalculusField A C) (M : MikusinskiLemma A C F) where
  statement_closed : M.statement
  proof_closed : M.proof

def MikusinskiLemmaClosed (A : AdmissibleClass) (C : ConvolutionAlgebra A) (F : OperationalCalculusField A C) (M : MikusinskiLemma A C F) : Prop :=
  M.statement ∧ M.proof

theorem mikusinski_lemma_closed_from_evidence (A : AdmissibleClass) (C : ConvolutionAlgebra A) (F : OperationalCalculusField A C) (M : MikusinskiLemma A C F) (E : MikusinskiLemmaEvidence A C F M) : MikusinskiLemmaClosed A C F M := by
  exact And.intro E.statement_closed E.proof_closed

end CalculusMikusinskiOperationalCalculiLemmaCanonicalLaneLean
end HautevilleHouse