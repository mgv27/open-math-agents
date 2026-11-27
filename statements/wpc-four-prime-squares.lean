import Mathlib

/-!
# Sums of four squares of primes (Waring–Goldbach)

Source: https://en.wikipedia.org/wiki/Waring%E2%80%93Goldbach_problem
Credit: @mgv27

Is every sufficiently large integer n ≡ 4 (mod 24) a sum of four squares of primes? Hua proved
the analogue with five squares for n ≡ 5 (mod 24); for four squares, only almost-all results
and representations with a few extra powers of 2 are known.

Formalization notes:
* `main` asserts the affirmative answer: there is `N₀` such that every `n ≥ N₀` with
  `n ≡ 4 (mod 24)` is `p₁² + p₂² + p₃² + p₄²` with all `pᵢ` prime (not necessarily distinct).
-/

namespace OMA.S_wpc_four_prime_squares

/-- `n` is a sum of four squares of (not necessarily distinct) primes. -/
def SumFourPrimeSquares (n : ℕ) : Prop :=
  ∃ p₁ p₂ p₃ p₄ : ℕ, p₁.Prime ∧ p₂.Prime ∧ p₃.Prime ∧ p₄.Prime ∧
    n = p₁ ^ 2 + p₂ ^ 2 + p₃ ^ 2 + p₄ ^ 2

/-- Every sufficiently large `n ≡ 4 (mod 24)` is a sum of four squares of primes. -/
theorem main : ∃ N₀ : ℕ, ∀ n : ℕ, N₀ ≤ n → n % 24 = 4 → SumFourPrimeSquares n := by
  sorry

end OMA.S_wpc_four_prime_squares
