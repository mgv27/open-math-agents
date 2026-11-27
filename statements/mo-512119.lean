import Mathlib

/-!
# Do there exist polynomials of degree and height $M$ taking prime values at $1, 2, \dots, M$?

Source: https://mathoverflow.net/questions/512119/do-there-exist-polynomials-of-degree-and-height-m-taking-prime-values-at-1-2
Credit: @mgv27

For a positive integer $M$, consider polynomials of the form
$$f(x) = 1 + \sum_{i=1}^M a_i x^i, \qquad a_i \in \{0, 1, \dots, M\},$$
not all $a_i$ equal to $0$. Is it true that for every positive integer $M$ there exists such a
polynomial $f$ with $f(1), f(2), \dots, f(M)$ all prime?

Formalization notes:
* The coefficients are a function `a : ℕ → ℕ`; only `a 1, …, a M` are used, each `≤ M`,
  and at least one of them is nonzero.
* `f(x)` is written directly as the natural number `1 + ∑_{i=1}^M a_i x^i`.
* The asker reports examples for `M ≤ 15` and exhaustive counts for `M ≤ 10`
  (all positive); the question for all `M` is open.
-/

namespace OMA.S_mo_512119

/-- The value `f(x) = 1 + ∑_{i=1}^M a_i x^i`. -/
def evalPoly (M : ℕ) (a : ℕ → ℕ) (x : ℕ) : ℕ :=
  1 + ∑ i ∈ Finset.Icc 1 M, a i * x ^ i

/-- `a` gives an admissible polynomial for `M`: coefficients `a_1, …, a_M ∈ {0, …, M}`,
not all zero, and `f(1), …, f(M)` are all prime. -/
def Good (M : ℕ) (a : ℕ → ℕ) : Prop :=
  (∀ i ∈ Finset.Icc 1 M, a i ≤ M) ∧
  (∃ i ∈ Finset.Icc 1 M, a i ≠ 0) ∧
  ∀ x ∈ Finset.Icc 1 M, (evalPoly M a x).Prime

/-- For every positive integer `M` such a polynomial exists. -/
theorem main : ∀ M : ℕ, 0 < M → ∃ a : ℕ → ℕ, Good M a := by
  sorry

end OMA.S_mo_512119
