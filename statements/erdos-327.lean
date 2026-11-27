import Mathlib

/-!
# Erdős Problem 327

Source: https://www.erdosproblems.com/327
Credit: @mgv27

Suppose $A\subseteq \{1,\ldots,N\}$ is such that if $a,b\in A$ and $a\neq b$ then
$a+b\nmid ab$. Can $A$ be 'substantially more' than the odd numbers? What if $a,b\in A$ with
$a\neq b$ implies $a+b\nmid 2ab$? Must $\lvert A\rvert=o(N)$?

Formalization notes:
* `main` states the last question, the only one with a precise meaning ("substantially more"
  is not defined).
* `|A| = o(N)` over all such `A` is stated as: for every `ε > 0`, if `N` is large enough then
  every such `A ⊆ {1, …, N}` has `|A| ≤ ε N`.
* Sanity check: the odd numbers are not such a set, since `3 + 15 = 18` divides `2 · 3 · 15 = 90`.
-/

namespace OMA.S_erdos_327

open Filter

/-- Erdős Problem 327: if `a + b ∤ 2ab` for all distinct `a, b ∈ A ⊆ {1, …, N}`, must
`|A| = o(N)`? -/
theorem main : ∀ ε > (0 : ℝ), ∀ᶠ N : ℕ in atTop, ∀ A : Finset ℕ, A ⊆ Finset.Icc 1 N →
    (∀ a ∈ A, ∀ b ∈ A, a ≠ b → ¬ (a + b ∣ 2 * a * b)) → (A.card : ℝ) ≤ ε * N := by
  sorry

end OMA.S_erdos_327
