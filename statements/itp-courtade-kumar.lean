import Mathlib

/-!
# Courtade–Kumar conjecture (most informative Boolean function)

Source: https://github.com/gokhanmergen/information-theory-problems/blob/main/problems/courtade-kumar.md
Credit: @mgv27

Let X be uniform on {0,1}ⁿ and Y the output of a binary symmetric channel with crossover
probability α ∈ (0, 1/2) applied to each coordinate of X. Conjecture: every Boolean function
f : {0,1}ⁿ → {0,1} satisfies I(f(X); Y) ≤ 1 − h(α), where h is the binary entropy function;
dictator functions f(x) = xᵢ attain it. Known in the high-noise regime (α close to 1/2,
Samorodnitsky 2016); open in general.

Formalization notes:
* `{0,1}ⁿ` is `Fin n → Bool`. The channel law is
  `P(y | x) = ∏ᵢ (α if xᵢ ≠ yᵢ else 1 − α)`.
* The joint law of `(f(X), Y)` is `p(b, y) = 2^{-n} Σ_{x : f x = b} P(y | x)`, and the mutual
  information is `Σ_{b,y} p(b,y) log₂ (p(b,y) / (p(b) p(y)))` with marginals `p(b)`, `p(y)`.
  Zero-probability terms contribute `0` (Mathlib's `Real.log 0 = 0`).
* `h(α) = −α log₂ α − (1−α) log₂ (1−α)`. Only the inequality is stated (attainment by
  dictators is a known fact).
-/

namespace OMA.S_itp_courtade_kumar

/-- Transition probability of `n` independent BSC(α) uses: `P(y | x)`. -/
noncomputable def channel {n : ℕ} (α : ℝ) (x y : Fin n → Bool) : ℝ :=
  ∏ i, if x i = y i then 1 - α else α

/-- Joint law of `(f(X), Y)` with `X` uniform on `{0,1}ⁿ`. -/
noncomputable def joint {n : ℕ} (α : ℝ) (f : (Fin n → Bool) → Bool) (b : Bool)
    (y : Fin n → Bool) : ℝ :=
  (1 / (2 : ℝ) ^ n) * ∑ x : Fin n → Bool, if f x = b then channel α x y else 0

/-- Marginal law of `f(X)`. -/
noncomputable def margF {n : ℕ} (α : ℝ) (f : (Fin n → Bool) → Bool) (b : Bool) : ℝ :=
  ∑ y : Fin n → Bool, joint α f b y

/-- Marginal law of `Y`. -/
noncomputable def margY {n : ℕ} (α : ℝ) (f : (Fin n → Bool) → Bool) (y : Fin n → Bool) : ℝ :=
  ∑ b : Bool, joint α f b y

/-- Mutual information `I(f(X); Y)` in bits. -/
noncomputable def mutualInfo {n : ℕ} (α : ℝ) (f : (Fin n → Bool) → Bool) : ℝ :=
  ∑ b : Bool, ∑ y : Fin n → Bool,
    joint α f b y * Real.logb 2 (joint α f b y / (margF α f b * margY α f y))

/-- Binary entropy function in bits. -/
noncomputable def binEntropy2 (α : ℝ) : ℝ :=
  -α * Real.logb 2 α - (1 - α) * Real.logb 2 (1 - α)

/-- The Courtade–Kumar conjecture. -/
theorem main : ∀ α : ℝ, 0 < α → α < 1 / 2 → ∀ n : ℕ, ∀ f : (Fin n → Bool) → Bool,
    mutualInfo α f ≤ 1 - binEntropy2 α := by
  sorry

end OMA.S_itp_courtade_kumar
