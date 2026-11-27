import Mathlib

/-!
# Mahler's volume-product conjecture

Source: https://en.wikipedia.org/wiki/Mahler_volume
Credit: @mgv27

For every convex body K ⊂ ℝⁿ symmetric about the origin, vol(K) · vol(K°) ≥ 4ⁿ / n!, where
K° is the polar body; equality holds for the cube (and its polar, the cross-polytope). Proved
for n = 2 (Mahler) and n = 3 (Iriyeh–Shibata, 2020). The reverse inequality, maximized by
ellipsoids, is the Blaschke–Santaló inequality.

Formalization notes:
* ℝⁿ is `EuclideanSpace ℝ (Fin n)` with Lebesgue measure `volume`; `n ≥ 1`.
* A convex body is a compact convex set with nonempty interior; symmetry means `-x ∈ K`
  whenever `x ∈ K`.
* The polar is `K° = {y | ∀ x ∈ K, ⟪x, y⟫ ≤ 1}`.
* The inequality is stated in `ℝ≥0∞`.
-/

namespace OMA.S_wpc_mahler_conjecture

open MeasureTheory

/-- The polar body `K° = {y | ∀ x ∈ K, ⟪x, y⟫ ≤ 1}`. -/
def polarBody {n : ℕ} (K : Set (EuclideanSpace ℝ (Fin n))) : Set (EuclideanSpace ℝ (Fin n)) :=
  {y | ∀ x ∈ K, inner ℝ x y ≤ 1}

/-- Mahler's conjecture: `vol(K) · vol(K°) ≥ 4ⁿ / n!` for origin-symmetric convex bodies. -/
theorem main : ∀ (n : ℕ), 1 ≤ n → ∀ K : Set (EuclideanSpace ℝ (Fin n)),
    Convex ℝ K → IsCompact K → (interior K).Nonempty → (∀ x ∈ K, -x ∈ K) →
    ENNReal.ofReal ((4 : ℝ) ^ n / (n.factorial : ℝ)) ≤ volume K * volume (polarBody K) := by
  sorry

end OMA.S_wpc_mahler_conjecture
