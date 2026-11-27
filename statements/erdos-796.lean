import Mathlib

/-!
# Erdős Problem 796

Source: https://www.erdosproblems.com/796
Credit: @mgv27

Let $k\geq 2$ and let $g_k(n)$ be the largest possible size of $A\subseteq \{1,\ldots,n\}$ such
that every $m$ has $<k$ solutions to $m=a_1a_2$ with $a_1<a_2\in A$. Is it true that
\[g_3(n)=\frac{\log\log n}{\log n}n+(c+o(1))\frac{n}{\log n}\]
for some constant $c$?

Formalization notes:
* A solution of `m = a₁a₂` is an ordered pair `(a₁, a₂) ∈ A × A` with `a₁ < a₂` and `a₁ * a₂ = m`.
  For `k = 2` this says that the products `a₁a₂` (`a₁ < a₂`) are distinct, the condition of
  Problem 425, as the source page says.
* `g₃(n) = (log log n / log n) n + (c + o(1)) n / log n` is stated as
  `(g₃(n) - n log log n / log n) / (n / log n) → c`, which is the same thing.
* The source page explains that the `(log n)²` in one reference is a typo for `log n`; the
  statement above follows the page.
-/

namespace OMA.S_erdos_796

open Filter Real

/-- `A` has the property: every `m` has fewer than `k` solutions to `m = a₁a₂` with `a₁ < a₂` in `A`. -/
def FewProducts (k : ℕ) (A : Finset ℕ) : Prop :=
  ∀ m : ℕ, ((A ×ˢ A).filter (fun p => p.1 < p.2 ∧ p.1 * p.2 = m)).card < k

/-- `g_k(n)`: the largest size of `A ⊆ {1, …, n}` with `FewProducts k A`. -/
noncomputable def g (k n : ℕ) : ℕ :=
  sSup {s : ℕ | ∃ A : Finset ℕ, A ⊆ Finset.Icc 1 n ∧ FewProducts k A ∧ A.card = s}

/-- Erdős Problem 796: is `g₃(n) = (log log n / log n) n + (c + o(1)) n / log n` for some `c`? -/
theorem main : ∃ c : ℝ, Tendsto
    (fun n : ℕ => ((g 3 n : ℝ) - n * log (log n) / log n) / (n / log n)) atTop (nhds c) := by
  sorry

end OMA.S_erdos_796
