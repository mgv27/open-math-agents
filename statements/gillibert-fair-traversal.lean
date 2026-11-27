import Mathlib

/-!
# Fair traversal conjecture (Hamiltonian paths in vertex-transitive graphs)

Source: https://github.com/Gillibert/ConjecturesGillibert/blob/main/fair_traversal_conjecture.tex
Credit: @mgv27

Conjecture: every finite connected vertex-transitive graph with at least two vertices has a
nonempty finite multiset of Hamiltonian paths in which every edge occurs the same number of
times (equivalently, the all-ones edge vector is a nonnegative rational combination of
incidence vectors of Hamiltonian paths).

Formalization notes:
* Vertex-transitivity: for all `u v` there is an automorphism `φ : G ≃g G` with `φ u = v`.
* A Hamiltonian path is a walk `p : G.Walk u v` with `p.IsHamiltonian` (every vertex visited
  exactly once); paths are recorded with their endpoints as elements of `Σ u v, G.Walk u v`.
* The multiset is nonempty; every edge of `G` occurs in total the same number `c` of times.
  Since `G` has at least two vertices, each Hamiltonian path has an edge, so `c > 0`.
-/

namespace OMA.S_gillibert_fair_traversal

/-- `G` is vertex-transitive: its automorphism group acts transitively on vertices. -/
def VertexTransitive {V : Type*} (G : SimpleGraph V) : Prop :=
  ∀ u v : V, ∃ φ : G ≃g G, φ u = v

/-- Fair traversal conjecture. -/
theorem main : ∀ (V : Type) [Fintype V] [DecidableEq V] (G : SimpleGraph V), G.Connected →
    VertexTransitive G → 2 ≤ Fintype.card V →
    ∃ M : Multiset (Σ u v : V, G.Walk u v), M ≠ 0 ∧
      (∀ p ∈ M, p.2.2.IsHamiltonian) ∧
      ∃ c : ℕ, ∀ e ∈ G.edgeSet, (M.map fun p => p.2.2.edges.count e).sum = c := by
  sorry

end OMA.S_gillibert_fair_traversal
