import Mathlib

/-!
# Ideal solutions of the Prouhet–Tarry–Escott problem

Source: https://en.wikipedia.org/wiki/Prouhet%E2%80%93Tarry%E2%80%93Escott_problem
Credit: @mgv27

For every n, are there two disjoint multisets of n + 1 integers with equal sums of k-th powers
for every k = 1,…,n (an ideal solution of degree n)? Ideal solutions are known only for n ≤ 9
and n = 11.

Formalization notes:
* `main` asserts the affirmative answer for every `n ≥ 1`.
* Multisets are `Multiset ℤ`; "disjoint" means no integer occurs in both (`Disjoint`), which
  rules out trivial solutions such as `A = B`.
-/

namespace OMA.S_wpc_prouhet_tarry_escott

/-- `A, B` form an ideal PTE solution of degree `n`: disjoint multisets of `n + 1` integers with
`∑_{a ∈ A} a^k = ∑_{b ∈ B} b^k` for `k = 1, …, n`. -/
def IdealSolution (n : ℕ) (A B : Multiset ℤ) : Prop :=
  A.card = n + 1 ∧ B.card = n + 1 ∧ Disjoint A B ∧
    ∀ k ∈ Finset.Icc 1 n, (A.map (· ^ k)).sum = (B.map (· ^ k)).sum

/-- Every degree `n ≥ 1` admits an ideal solution of the Prouhet–Tarry–Escott problem. -/
theorem main : ∀ n : ℕ, 1 ≤ n → ∃ A B : Multiset ℤ, IdealSolution n A B := by
  sorry

end OMA.S_wpc_prouhet_tarry_escott
