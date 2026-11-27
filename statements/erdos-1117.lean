import Mathlib

/-!
# Erdős Problem 1117

Source: https://www.erdosproblems.com/1117
Credit: @mgv27

Let $f(z)$ be an entire function which is not a monomial. Let $\nu(r)$ count the number of $z$
with $\lvert z\rvert=r$ such that $\lvert f(z)\rvert=\max_{\lvert z\rvert=r}\lvert f(z)\rvert$.
(This is a finite quantity if $f$ is not a monomial.) Is it possible for
\[\limsup \nu(r)=\infty?\]
Is it possible for
\[\liminf \nu(r)=\infty?\]

Formalization notes:
* `main` states the second question, which is open. The first was answered yes by Herzog and
  Piranian.
* Entire: `Differentiable ℂ f`. A monomial is a function `z ↦ c zⁿ`; this includes the constant
  functions and `0`.
* `ν(r)` is the number of points of the circle `|z| = r` where `|f|` attains its maximum over
  that circle, as a `Set.ncard`. As the source says, it is finite for `r > 0` when `f` is not a
  monomial, so `ncard` counts it exactly there.
* For a natural-number valued function, `liminf ν(r) = ∞` (as `r → ∞`) means `ν(r) → ∞`.
-/

namespace OMA.S_erdos_1117

open Filter

/-- `ν(r)`: the number of `z` with `|z| = r` at which `|f(z)|` is the maximum of `|f|` on that
circle. -/
noncomputable def ν (f : ℂ → ℂ) (r : ℝ) : ℕ :=
  {z : ℂ | ‖z‖ = r ∧ ‖f z‖ = sSup ((fun w => ‖f w‖) '' Metric.sphere 0 r)}.ncard

/-- Erdős Problem 1117: is there an entire non-monomial `f` with `liminf ν(r) = ∞`? -/
theorem main : ∃ f : ℂ → ℂ, Differentiable ℂ f ∧ (¬ ∃ (c : ℂ) (n : ℕ), ∀ z, f z = c * z ^ n) ∧
    Tendsto (ν f) atTop atTop := by
  sorry

end OMA.S_erdos_1117
