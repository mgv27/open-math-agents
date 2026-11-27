import Mathlib

/-!
# Are there any $3$-Fermat-pseudoprimes of the form $k^4+1$?

Source: https://math.stackexchange.com/questions/3336724/are-there-any-3-fermat-pseudoprimes-of-the-form-k41
Credit: @mgv27

Suppose $k$ is a positive integer and $N := k^4 + 1$ is composite. Can $N$ be a
$3$-Fermat-pseudoprime; that is, can the congruence $3^{N-1} \equiv 1 \pmod N$ hold?
(The asker checked up to $k = 10^8$, later extended in comments to $k < 2 \cdot 10^{11}$,
and found no example.)

Formalization notes:
* `main` states the natural "yes" reading of the title: some positive `k` gives a composite
  `N = k^4 + 1` with `3^(N-1) ≡ 1 (mod N)`. Since `N - 1 = k^4`, the exponent is `k^4`.
* `k ≥ 1` excludes the trivial `k = 0` (`N = 1`). For `k ≥ 1`, `N ≥ 2`, so "not prime"
  means composite.
-/

namespace OMA.S_mse_3336724

/-- `N = k^4 + 1` is a composite base-3 Fermat pseudoprime. -/
def IsPsp3 (k : ℕ) : Prop :=
  ¬ (k ^ 4 + 1).Prime ∧ 3 ^ (k ^ 4) ≡ 1 [MOD k ^ 4 + 1]

/-- There is a positive integer `k` with `k^4 + 1` a composite 3-Fermat-pseudoprime. -/
theorem main : ∃ k : ℕ, 0 < k ∧ IsPsp3 k := by
  sorry

end OMA.S_mse_3336724
