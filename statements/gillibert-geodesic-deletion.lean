import Mathlib

/-!
# Geodesic deletion conjecture (vertex-transitive graphs)

Source: https://github.com/Gillibert/ConjecturesGillibert/blob/main/geodesic_deletion_conjecture.tex
Credit: @mgv27

Let G be a finite connected vertex-transitive graph with at least three vertices.
Conjecture: for every geodesic (shortest path) P in G, deleting all vertices of P leaves a
connected graph.

Formalization notes:
* Vertex-transitivity: for all `u v` there is a graph automorphism `φ : G ≃g G` with `φ u = v`.
* A geodesic from `u` to `v` is a walk of length `G.dist u v` (automatically a path).
* "Deleting all vertices of P" is the induced subgraph on the complement of `p.support`.
  Mathlib's `Connected` requires nonemptiness; with at least three vertices a geodesic never
  covers every vertex of a connected vertex-transitive graph, so this is not an extra demand.
-/

namespace OMA.S_gillibert_geodesic_deletion

/-- `G` is vertex-transitive: its automorphism group acts transitively on vertices. -/
def VertexTransitive {V : Type*} (G : SimpleGraph V) : Prop :=
  ∀ u v : V, ∃ φ : G ≃g G, φ u = v

/-- Geodesic deletion conjecture. -/
theorem main : ∀ (V : Type) [Fintype V] (G : SimpleGraph V), G.Connected →
    VertexTransitive G → 3 ≤ Fintype.card V →
    ∀ (u v : V) (p : G.Walk u v), p.length = G.dist u v →
    (G.induce {x | x ∉ p.support}).Connected := by
  sorry

end OMA.S_gillibert_geodesic_deletion
