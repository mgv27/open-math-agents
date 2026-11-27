import Mathlib

/-!
# Equal halves conjecture (vertex-transitive graphs)

Source: https://github.com/Gillibert/ConjecturesGillibert/blob/main/equal_halves_conjecture.tex
Credit: @mgv27

Conjecture: every finite connected vertex-transitive graph of even order can be partitioned
into two nonempty vertex sets A and B such that the induced subgraphs G[A] and G[B] are
connected and isomorphic.

Formalization notes:
* Vertex-transitivity: for all `u v` there is an automorphism `φ : G ≃g G` with `φ u = v`.
* The partition is `A`, `Aᶜ`; both are nonempty, both induced subgraphs are connected, and
  they are isomorphic as simple graphs.
-/

namespace OMA.S_gillibert_equal_halves

/-- `G` is vertex-transitive: its automorphism group acts transitively on vertices. -/
def VertexTransitive {V : Type*} (G : SimpleGraph V) : Prop :=
  ∀ u v : V, ∃ φ : G ≃g G, φ u = v

/-- Equal halves conjecture. -/
theorem main : ∀ (V : Type) [Fintype V] (G : SimpleGraph V), G.Connected →
    VertexTransitive G → Even (Fintype.card V) →
    ∃ A : Set V, A.Nonempty ∧ Aᶜ.Nonempty ∧ (G.induce A).Connected ∧
      (G.induce Aᶜ).Connected ∧ Nonempty (G.induce A ≃g G.induce Aᶜ) := by
  sorry

end OMA.S_gillibert_equal_halves
