/-
STRUCTURAL FLOW UNIVERSAL MACHINE KERNEL v0.5
Consolidated Lean 4 audit kernel

Authority:
  Structural Flow T.O.E. v1.64
  Entropy theorem source:
    Field Notes From The Substrate — Translations no. 9:
    Entropy, Derived
      machine-source snapshot: v1.2
      current public artifact: v1.8

Purpose
-------
Consolidate the already-passing machine translations of the current
Structural Flow foundational closure AND the first downstream universal layer
into ONE Lean source file so that the encoded universal stack is attacked by
the same elaboration / proof-kernel run.

This consolidation adds NO new substantive foundational claim. It packages
the previously checked modules and preserves their authority boundaries.

Architecture preserved in this file:
  * Persistence -> Boundary -> Cascade -> Authorization is the foundational
    closure segment.
  * PAA is NOT a hinge. It is a post-Authorization no-free-reset validity
    corollary governing warranted continuation lineage.
  * Recognition and Coherence are downstream hinges:
        Authorization -> Recognition -> Coherence
    where each arrow is prerequisite / burden-opening, not deterministic
    production.

The previously checked modules are:

  1. Entropy / no-free-immunity
  2. Foundational hinge separation:
       Persistence -> Boundary -> Cascade -> Authorization
  3. Foundational first-break / five-regime closure
  4. Austerity / no-hidden-primitive audit
  5. Six-face primitive-signature closure
  6. Primitive minimality as least-sufficient commitment structure
  7. C0 -> foundational burden bridge from lower passage semantics
  8. Post-Authorization Answerability (PAA) as no-free-reset validity guard
  9. Recognition as same-binding transport across admitted local variation
 10. Coherence as one whole-owned hold with shared invariant content

Governance / scope
------------------
A clean run means only that all encoded theorem statements in this file are
accepted together at their declared formal scopes.

It does NOT mean:
  * Lean has empirically validated Structural Flow;
  * every downstream SF theorem is formalized;
  * the declared model / signature language cannot be challenged;
  * future counterexamples cannot reopen a closure;
  * metaphysical uniqueness beyond stated scope has been proved.

The reopening conditions preserved in the component kernels remain active.

Machine-checked foundational closure map
----------------------------------------
The consolidated file includes, among others, these explicit closure theorems:

  FailureClosure.no_sixth_irreducible_first_break_regime_inside_current_architecture
    Any irreducible first-break candidate inside the declared four-hinge
    architecture collapses into Dissolution, Shear, Drift, Echo, or Lock.

  SixFaceClosure.six_face_signature_closure
    The five named primitive commitments plus Austerity match the canonical
    Chance primitive signature and admit no seventh independent primitive
    commitment inside the declared signature architecture.

  PrimitiveMinimality.primitive_minimality_closure
    Chance is least sufficient under commitment inclusion at the declared
    primitive-signature scope; every sufficient rival is commitment-equivalent
    or strictly richer.

  C0Bridge.c0_to_foundational_burden_bridge
    From lower passage semantics, C0 leaves Persistence live; each successful
    prior burden leaves the next foundational burden live but unguaranteed;
    and incorporated carried consequence requires all four foundational
    capacities P / B / C / A.

  PAA.paa_machine_closure
    Post-Authorization Answerability is a necessary source-lineage guard:
    warranted continuation cannot free-reset behind the authorized post-state,
    while continuation, conservation, irreversibility, and unique succession
    are not required.

  Recognition.recognition_machine_closure
    Authorization plus PAA-compatible lineage does not entail Recognition;
    Recognition remains a distinct downstream burden requiring lawful
    transport/comparison with same binding identity across admitted local
    variation.

  Coherence.coherence_machine_closure
    Recognized compatible local pieces do not entail Coherence; one-system
    whole-hold requires global fit, whole-hold, and shared whole-owned invariant
    content while local distinctions remain retained.

These are scope-bound formal closure results. They are not inferred from the
Entropy capacity datatype.

Consolidation discipline
------------------------
Intermediate proof-engineering versions are intentionally omitted.
The stronger later failure-closure kernel supersedes the earlier standalone
first-break checkpoint. Known linter-only cleanup from the standalone failure
kernel has been repaired here rather than hidden or disabled.
-/

namespace StructuralFlow
namespace Entropy

/-
Structural Flow Foundational Formalization — Entropy Kernel v0.5

Authority: Structural Flow T.O.E. v1.64
Source theorem: Field Notes From The Substrate — Translations no. 9:
                Entropy, Derived
                  machine-source snapshot: v1.2
                  current public artifact: v1.8
Target: Lean 4
Status: previously clean standalone Lean pass; imported into consolidated audit.

Purpose
-------
Machine-translate the logical-scope burden behind Structural Entropy without
encoding structural immunity failure as an axiom.

This file targets the following source claims:
1. Eventfulness does not entail Persistence.
2. Persistence establishes availability, not free immunity.
3. No individual canonical hinge capacity entails immunity merely by being
   achieved.
4. Completion of the canonical capacity package does not entail immunity
   without an additional bridge.

Formal strategy
---------------
Non-entailment is established by explicit countermodel. The machine is not
asked to accept a prose rule saying that "no bridge was supplied." Instead,
the relevant universal entailments are stated and then refuted by models in
which the antecedent succeeds while the stronger conclusion fails.

Scope note
----------
Each Model tracks ONE interaction-produced distinction. `admissible` describes
possible continuations in the declared model space, not realized future
history. A reachable state is therefore a possibility-space witness, not a
prediction that the universe will realize that continuation.

Anti-smuggling note — Entropy module only
-------------------------------------------
The six capacity constructors below are the CURRENT ACCEPTED canonical capacity
vocabulary used as premises by the Entropy theorem. This Entropy module does NOT
infer hinge, failure-regime, or Chance-face cardinality from that datatype.

Those are separate burdens handled later in THIS consolidated kernel:
* FailureClosure proves the current four-hinge first-break partition and
  no sixth irreducible first-break regime inside that architecture.
* SixFaceClosure proves six-face primitive-signature closure at declared scope.

Therefore this local Entropy-module warning must not be read as a scope limit
on the consolidated kernel as a whole.
-/



/--
Canonical capacities used by the current hinge grammar.

These names are imported vocabulary for the Entropy audit only:
Persistence   -> availability
Boundary      -> discrimination
Cascade       -> inheritance
Authorization -> incorporation
Recognition   -> recognition
Coherence     -> coherence
-/
inductive Capacity
  | availability
  | discrimination
  | inheritance
  | incorporation
  | recognition
  | coherence
  deriving DecidableEq

/--
A minimal admissible-continuation model for one tracked interaction-produced
distinction.
-/
structure Model where
  State : Type
  admissible : State → State → Prop
  occurred : State → Prop
  capacity : Capacity → State → Prop

/-- Reflexive-transitive reachability through admissible continuations. -/
inductive Reachable (M : Model) : M.State → M.State → Prop
  | refl (s : M.State) : Reachable M s s
  | tail {s t u : M.State} :
      Reachable M s t → M.admissible t u → Reachable M s u

/-- Eventfulness at the selected state. -/
def OccurrenceAt (M : Model) (s : M.State) : Prop :=
  M.occurred s

/--
A canonical capacity is realized beyond s when there is a DISTINCT admissibly
reachable continuation in which that capacity is present.
-/
def CapacityRealizedAt (M : Model) (c : Capacity) (s : M.State) : Prop :=
  ∃ t : M.State, Reachable M s t ∧ t ≠ s ∧ M.capacity c t

/-- Persistence is realization of the availability capacity beyond production. -/
def PersistenceAt (M : Model) (s : M.State) : Prop :=
  CapacityRealizedAt M Capacity.availability s

/--
Canonical capacity-package completion: one distinct reachable continuation
realizes every capacity currently used by the canonical hinge grammar.

This is intentionally a conjunction-at-one-witness burden. It does NOT assert
that the capacity list is exhaustive of every possible future SF capacity.
-/
def CanonicalCapacityPackageAt (M : Model) (s : M.State) : Prop :=
  ∃ t : M.State,
    Reachable M s t ∧
    t ≠ s ∧
    ∀ c : Capacity, M.capacity c t

/--
Structural immunity at s: availability of the tracked distinction is secured
throughout the entire admissibly reachable continuation class from s.
-/
def StructuralImmunityAt (M : Model) (s : M.State) : Prop :=
  ∀ t : M.State,
    Reachable M s t → M.capacity Capacity.availability t

/-! ## Universal entailments tested by the Entropy theorem -/

/-- The universal entailment denied by source Lemma 1. -/
def OccurrenceEntailsPersistence : Prop :=
  ∀ (M : Model) (s : M.State),
    OccurrenceAt M s → PersistenceAt M s

/-- Schema: realization of capacity c universally entails structural immunity. -/
def CapacityEntailsImmunity (c : Capacity) : Prop :=
  ∀ (M : Model) (s : M.State),
    CapacityRealizedAt M c s → StructuralImmunityAt M s

/-- The Persistence-specific form denied by source Lemma 2. -/
def PersistenceEntailsImmunity : Prop :=
  ∀ (M : Model) (s : M.State),
    PersistenceAt M s → StructuralImmunityAt M s

/-- The universal entailment denied by source Lemma 4. -/
def CanonicalPackageEntailsImmunity : Prop :=
  ∀ (M : Model) (s : M.State),
    CanonicalCapacityPackageAt M s → StructuralImmunityAt M s

/-! ## Countermodel A: Eventfulness without Persistence -/

/--
There is an occurrence, but no distinct admissible continuation. Availability
at the occurrence itself does not count as Persistence because Persistence
requires availability beyond production.
-/
def eventOnlyModel : Model where
  State := Unit
  admissible := fun _ _ => False
  occurred := fun _ => True
  capacity := fun c _ =>
    match c with
    | Capacity.availability => True
    | _ => False

/-- Eventfulness holds in the event-only model. -/
theorem event_only_occurs : OccurrenceAt eventOnlyModel () := by
  simp [OccurrenceAt, eventOnlyModel]

/-- Persistence does not hold in the event-only model. -/
theorem event_only_has_no_persistence : ¬ PersistenceAt eventOnlyModel () := by
  intro h
  rcases h with ⟨t, _hReach, hDistinct, _hAvailable⟩
  cases t
  exact hDistinct rfl

/--
Source Lemma 1, machine form:
Eventfulness does not universally entail Persistence.
-/
theorem occurrence_does_not_entail_persistence :
    ¬ OccurrenceEntailsPersistence := by
  intro hEntails
  have hPersistence : PersistenceAt eventOnlyModel () :=
    hEntails eventOnlyModel () event_only_occurs
  exact event_only_has_no_persistence hPersistence

/-! ## Countermodel B: Full canonical success without structural immunity -/

inductive EntropyAuditState
  | produced
  | achieved
  | lost
  deriving DecidableEq

open EntropyAuditState

/-- Admissible continuation graph: produced → achieved → lost. -/
def auditAdmissible : EntropyAuditState → EntropyAuditState → Prop
  | produced, achieved => True
  | achieved, lost => True
  | _, _ => False

/-- The tracked interaction occurs at the production state. -/
def auditOccurred : EntropyAuditState → Prop
  | produced => True
  | _ => False

/--
At `achieved`, every current canonical capacity is realized. Availability also
holds at production. At `lost`, availability fails.
-/
def auditCapacity : Capacity → EntropyAuditState → Prop
  | Capacity.availability, produced => True
  | _, achieved => True
  | _, lost => False
  | _, produced => False

def auditModel : Model where
  State := EntropyAuditState
  admissible := auditAdmissible
  occurred := auditOccurred
  capacity := auditCapacity

/-- The achieved state is admissibly reachable from production. -/
theorem achieved_reachable : Reachable auditModel produced achieved := by
  exact Reachable.tail
    (M := auditModel)
    (s := produced)
    (t := produced)
    (u := achieved)
    (Reachable.refl (M := auditModel) produced)
    (show auditAdmissible produced achieved from True.intro)

/-- The lost state is admissibly reachable from production. -/
theorem lost_reachable : Reachable auditModel produced lost := by
  exact Reachable.tail
    (M := auditModel)
    (s := produced)
    (t := achieved)
    (u := lost)
    achieved_reachable
    (show auditAdmissible achieved lost from True.intro)

/-- The achieved continuation is genuinely distinct from production. -/
theorem achieved_ne_produced : achieved ≠ produced := by
  intro h
  cases h

/-- Every imported canonical capacity holds at the achieved state. -/
theorem every_capacity_holds_at_achieved (c : Capacity) :
    auditModel.capacity c achieved := by
  change auditCapacity c achieved
  cases c <;> exact True.intro

/-- Every imported canonical capacity is realized in the audit model. -/
theorem every_capacity_realized (c : Capacity) :
    CapacityRealizedAt auditModel c produced := by
  exact ⟨achieved, achieved_reachable, achieved_ne_produced,
    every_capacity_holds_at_achieved c⟩

/-- Persistence succeeds in the audit model. -/
theorem persistence_succeeds : PersistenceAt auditModel produced := by
  exact every_capacity_realized Capacity.availability

/-- The full current canonical capacity package succeeds in the audit model. -/
theorem canonical_package_succeeds :
    CanonicalCapacityPackageAt auditModel produced := by
  exact ⟨achieved, achieved_reachable, achieved_ne_produced,
    every_capacity_holds_at_achieved⟩

/-- Structural immunity fails in the same model. -/
theorem immunity_fails : ¬ StructuralImmunityAt auditModel produced := by
  intro hImmune
  have hAvailableLost :
      auditModel.capacity Capacity.availability lost :=
    hImmune lost lost_reachable
  change False at hAvailableLost
  exact hAvailableLost

/--
Source Lemma 2, machine form:
Persistence does not universally entail structural immunity.
-/
theorem persistence_does_not_entail_immunity :
    ¬ PersistenceEntailsImmunity := by
  intro hEntails
  have hImmune : StructuralImmunityAt auditModel produced :=
    hEntails auditModel produced persistence_succeeds
  exact immunity_fails hImmune

/--
Source Lemma 3, machine schema:
No individual imported canonical capacity universally entails structural
immunity merely by being realized.
-/
theorem no_individual_capacity_entails_immunity (c : Capacity) :
    ¬ CapacityEntailsImmunity c := by
  intro hEntails
  have hImmune : StructuralImmunityAt auditModel produced :=
    hEntails auditModel produced (every_capacity_realized c)
  exact immunity_fails hImmune

/-- Named projections of the Lemma 3 schema for audit readability. -/
theorem boundary_capacity_does_not_entail_immunity :
    ¬ CapacityEntailsImmunity Capacity.discrimination :=
  no_individual_capacity_entails_immunity Capacity.discrimination

theorem cascade_capacity_does_not_entail_immunity :
    ¬ CapacityEntailsImmunity Capacity.inheritance :=
  no_individual_capacity_entails_immunity Capacity.inheritance

theorem authorization_capacity_does_not_entail_immunity :
    ¬ CapacityEntailsImmunity Capacity.incorporation :=
  no_individual_capacity_entails_immunity Capacity.incorporation

theorem recognition_capacity_does_not_entail_immunity :
    ¬ CapacityEntailsImmunity Capacity.recognition :=
  no_individual_capacity_entails_immunity Capacity.recognition

theorem coherence_capacity_does_not_entail_immunity :
    ¬ CapacityEntailsImmunity Capacity.coherence :=
  no_individual_capacity_entails_immunity Capacity.coherence

/--
Source Lemma 4, machine form:
Completion of the current canonical capacity package does not universally
entail structural immunity.
-/
theorem canonical_package_does_not_entail_immunity :
    ¬ CanonicalPackageEntailsImmunity := by
  intro hEntails
  have hImmune : StructuralImmunityAt auditModel produced :=
    hEntails auditModel produced canonical_package_succeeds
  exact immunity_fails hImmune

/--
Structural Entropy machine core.

This packages the four source burdens as non-entailment results. It does NOT
claim that structural immunity is impossible. A separately added premise or
proved bridge may entail immunity in a narrower model class. The result here is
only that the tested antecedents do not entail immunity over the declared model
class by themselves.
-/
theorem structural_entropy_machine_core :
    (¬ OccurrenceEntailsPersistence) ∧
    (¬ PersistenceEntailsImmunity) ∧
    (∀ c : Capacity, ¬ CapacityEntailsImmunity c) ∧
    (¬ CanonicalPackageEntailsImmunity) := by
  exact ⟨
    occurrence_does_not_entail_persistence,
    persistence_does_not_entail_immunity,
    no_individual_capacity_entails_immunity,
    canonical_package_does_not_entail_immunity
  ⟩

/-!
Reopening rule represented formally
-----------------------------------
The source theorem explicitly remains open to an additional bridge. This file
therefore does NOT prove `¬ StructuralImmunityAt M s` from canonical success in
all models. It proves only failure of the universal entailments above.

A later theory may add an explicit premise/bridge B and prove, for a restricted
model class:

  canonical package + B -> structural immunity

Such a theorem would not contradict this file unless B were itself derivable
from exactly the premises already represented here.
-/

end Entropy


namespace HingeSeparation

/-
Structural Flow Foundational Formalization — Hinge Separation Kernel v0.1

Authority: Structural Flow T.O.E. v1.64
Target: Lean 4
Status: previously clean standalone Lean pass; imported into consolidated audit.

Purpose
-------
Formalize the current foundational hinge segment at the minimum burden needed
for prerequisite order and adjacent-hinge non-absorption:

  Persistence -> Boundary -> Cascade -> Authorization
  available   -> discriminated -> inherited -> incorporated

This HingeSeparation module does NOT by itself prove that these four hinges are
exhaustive and does NOT by itself prove the five-regime failure-space closure.
Those burdens are handled later in the FailureClosure module of this same
consolidated kernel. This module tests only:

1. each later hinge requires the preceding hinge under the declared formal
   definitions; and
2. each preceding hinge can succeed while the adjacent later hinge fails.

The three separating states correspond to the TOE claims:

  P ∧ ¬B
  P ∧ B ∧ ¬C
  P ∧ B ∧ C ∧ ¬A

Anti-smuggling rule
-------------------
The later hinge is defined by the additional structural witness named in the
TOE, not by a bare Boolean label:

Persistence   : retained availability of an interaction-produced update.
Boundary      : retained availability + operative relational cut that
                discriminates the retained update.
Cascade       : Boundary + a producing interaction + a distinct further
                interaction receiving the update as input.
Authorization : Cascade + a bounded carrier whose supplied condition is
                altered by the inherited update and whose altered condition
                remains supplied without continued presentation of that update.

Therefore the separating-model proofs test whether the additional burden can
fail while the prior burden remains satisfied.
-/



/--
A minimal structural passage model for one tracked interaction-produced update.
The fields correspond only to the foundational P/B/C/A burden.
-/
structure HingeModel where
  Update : Type
  Interaction : Type
  Carrier : Type
  Condition : Type
  Cut : Type

  /-- Persistence-facing retained availability. -/
  retained : Update → Prop

  /-- Boundary-facing relational cut and discrimination. -/
  cutActive : Cut → Prop
  discriminates : Cut → Update → Prop

  /-- Cascade-facing production and inherited-input relation. -/
  produces : Interaction → Update → Prop
  receivesAsInput : Interaction → Update → Prop

  /-- Authorization-facing bounded carrier and condition transition. -/
  bounded : Carrier → Prop
  presentedTo : Carrier → Update → Prop
  suppliesBefore : Carrier → Condition → Prop
  alteredBy : Update → Condition → Condition → Prop
  suppliesAfter : Carrier → Condition → Prop
  holdsWithoutPresentation : Carrier → Update → Condition → Prop

/--
Persistence: the tracked interaction-produced update remains structurally
available beyond production at the passage under test.
-/
def Persistence (M : HingeModel) (u : M.Update) : Prop :=
  M.retained u

/--
Boundary: retained carry is discriminated through an operative relational cut.
-/
def Boundary (M : HingeModel) (u : M.Update) : Prop :=
  Persistence M u ∧
  ∃ cut : M.Cut,
    M.cutActive cut ∧ M.discriminates cut u

/--
Cascade: a produced update crosses into a distinct further interaction as
inherited input.
-/
def Cascade (M : HingeModel) (u : M.Update) : Prop :=
  Boundary M u ∧
  ∃ i1 i2 : M.Interaction,
    M.produces i1 u ∧
    i1 ≠ i2 ∧
    M.receivesAsInput i2 u

/--
Authorization: inherited update alters the condition supplied by a bounded
carrier, and the altered condition remains supplied without continued active
presentation of the update merely to keep that condition supplied.
-/
def Authorization (M : HingeModel) (u : M.Update) : Prop :=
  Cascade M u ∧
  ∃ carrier : M.Carrier,
  ∃ p p' : M.Condition,
    M.bounded carrier ∧
    M.presentedTo carrier u ∧
    M.suppliesBefore carrier p ∧
    M.alteredBy u p p' ∧
    p' ≠ p ∧
    M.suppliesAfter carrier p' ∧
    M.holdsWithoutPresentation carrier u p'

/-! ## Prerequisite direction -/

/-- Boundary carries Persistence as prerequisite. -/
theorem boundary_requires_persistence
    (M : HingeModel) (u : M.Update) :
    Boundary M u → Persistence M u := by
  intro h
  exact h.1

/-- Cascade carries Boundary as prerequisite. -/
theorem cascade_requires_boundary
    (M : HingeModel) (u : M.Update) :
    Cascade M u → Boundary M u := by
  intro h
  exact h.1

/-- Authorization carries Cascade as prerequisite. -/
theorem authorization_requires_cascade
    (M : HingeModel) (u : M.Update) :
    Authorization M u → Cascade M u := by
  intro h
  exact h.1

/-- Authorization therefore also carries Boundary. -/
theorem authorization_requires_boundary
    (M : HingeModel) (u : M.Update) :
    Authorization M u → Boundary M u := by
  intro h
  exact cascade_requires_boundary M u h.1

/-- Authorization therefore also carries Persistence. -/
theorem authorization_requires_persistence
    (M : HingeModel) (u : M.Update) :
    Authorization M u → Persistence M u := by
  intro h
  exact boundary_requires_persistence M u
    (cascade_requires_boundary M u h.1)

/-! ## Concrete witness vocabulary -/

inductive DemoUpdate
  | u

inductive DemoInteraction
  | i1
  | i2

inductive DemoCarrier
  | k

inductive DemoCondition
  | p
  | pPrime

inductive DemoCut
  | cut

open DemoUpdate DemoInteraction DemoCarrier DemoCondition DemoCut

/-- Shared exact production relation for Cascade-success models. -/
def demoProduces : DemoInteraction → DemoUpdate → Prop
  | i1, u => True
  | _, _ => False

/-- Shared exact inherited-input relation for Cascade-success models. -/
def demoReceives : DemoInteraction → DemoUpdate → Prop
  | i2, u => True
  | _, _ => False

/-- Shared exact pre-Authorization carrier condition. -/
def demoBefore : DemoCarrier → DemoCondition → Prop
  | k, p => True
  | _, _ => False

/-- Shared exact post-Authorization carrier condition. -/
def demoAfter : DemoCarrier → DemoCondition → Prop
  | k, pPrime => True
  | _, _ => False

/-- Shared exact update-conditioned carrier alteration. -/
def demoAltered : DemoUpdate → DemoCondition → DemoCondition → Prop
  | u, p, pPrime => True
  | _, _, _ => False

/-- Shared exact successful post-update hold without continued presentation. -/
def demoStable : DemoCarrier → DemoUpdate → DemoCondition → Prop
  | k, u, pPrime => True
  | _, _, _ => False

/-! ## Separating model 1: P ∧ ¬B -/

/-- Persistence succeeds; no operative discriminating cut exists. -/
def persistenceOnlyModel : HingeModel where
  Update := DemoUpdate
  Interaction := DemoInteraction
  Carrier := DemoCarrier
  Condition := DemoCondition
  Cut := DemoCut
  retained := fun _ => True
  cutActive := fun _ => False
  discriminates := fun _ _ => False
  produces := fun _ _ => False
  receivesAsInput := fun _ _ => False
  bounded := fun _ => False
  presentedTo := fun _ _ => False
  suppliesBefore := fun _ _ => False
  alteredBy := fun _ _ _ => False
  suppliesAfter := fun _ _ => False
  holdsWithoutPresentation := fun _ _ _ => False

theorem persistence_only_has_persistence :
    Persistence persistenceOnlyModel u := by
  exact True.intro

theorem persistence_only_has_no_boundary :
    ¬ Boundary persistenceOnlyModel u := by
  intro h
  rcases h with ⟨_hP, cutWitness, hActive, _hDisc⟩
  change False at hActive
  exact hActive

/-- Machine witness for P ∧ ¬B. -/
theorem separating_state_P_not_B :
    Persistence persistenceOnlyModel u ∧
    ¬ Boundary persistenceOnlyModel u := by
  exact ⟨persistence_only_has_persistence, persistence_only_has_no_boundary⟩

/-! ## Separating model 2: P ∧ B ∧ ¬C -/

/-- Persistence and Boundary succeed; no producing interaction exists. -/
def boundaryOnlyModel : HingeModel where
  Update := DemoUpdate
  Interaction := DemoInteraction
  Carrier := DemoCarrier
  Condition := DemoCondition
  Cut := DemoCut
  retained := fun _ => True
  cutActive := fun _ => True
  discriminates := fun _ _ => True
  produces := fun _ _ => False
  receivesAsInput := fun _ _ => False
  bounded := fun _ => False
  presentedTo := fun _ _ => False
  suppliesBefore := fun _ _ => False
  alteredBy := fun _ _ _ => False
  suppliesAfter := fun _ _ => False
  holdsWithoutPresentation := fun _ _ _ => False

theorem boundary_only_has_boundary :
    Boundary boundaryOnlyModel u := by
  exact ⟨True.intro, cut, True.intro, True.intro⟩

theorem boundary_only_has_no_cascade :
    ¬ Cascade boundaryOnlyModel u := by
  intro h
  rcases h with ⟨_hB, iFirst, iSecond, hProduces, _hDistinct, _hReceives⟩
  change False at hProduces
  exact hProduces

/-- Machine witness for P ∧ B ∧ ¬C. -/
theorem separating_state_P_B_not_C :
    Persistence boundaryOnlyModel u ∧
    Boundary boundaryOnlyModel u ∧
    ¬ Cascade boundaryOnlyModel u := by
  exact ⟨boundary_requires_persistence boundaryOnlyModel u boundary_only_has_boundary,
    boundary_only_has_boundary,
    boundary_only_has_no_cascade⟩

/-! ## Separating model 3: P ∧ B ∧ C ∧ ¬A -/

/--
Persistence, Boundary, and Cascade succeed. The carrier-facing alteration facts
are available, but the altered condition is NOT self-held without continued
presentation, so Authorization fails.
-/
def cascadeOnlyModel : HingeModel where
  Update := DemoUpdate
  Interaction := DemoInteraction
  Carrier := DemoCarrier
  Condition := DemoCondition
  Cut := DemoCut
  retained := fun _ => True
  cutActive := fun _ => True
  discriminates := fun _ _ => True
  produces := demoProduces
  receivesAsInput := demoReceives
  bounded := fun _ => True
  presentedTo := fun _ _ => True
  suppliesBefore := demoBefore
  alteredBy := demoAltered
  suppliesAfter := demoAfter
  holdsWithoutPresentation := fun _ _ _ => False

theorem i1_ne_i2 : i1 ≠ i2 := by
  intro h
  cases h

theorem cascade_only_has_cascade :
    Cascade cascadeOnlyModel u := by
  refine ⟨?_, i1, i2, ?_, i1_ne_i2, ?_⟩
  · exact ⟨True.intro, cut, True.intro, True.intro⟩
  · exact True.intro
  · exact True.intro

theorem cascade_only_has_no_authorization :
    ¬ Authorization cascadeOnlyModel u := by
  intro h
  rcases h with
    ⟨_hC, carrier, pBefore, pAfter,
      _hBounded, _hPresented, _hBefore, _hAltered,
      _hChanged, _hAfter, hStable⟩
  change False at hStable
  exact hStable

/-- Machine witness for P ∧ B ∧ C ∧ ¬A. -/
theorem separating_state_P_B_C_not_A :
    Persistence cascadeOnlyModel u ∧
    Boundary cascadeOnlyModel u ∧
    Cascade cascadeOnlyModel u ∧
    ¬ Authorization cascadeOnlyModel u := by
  have hC : Cascade cascadeOnlyModel u := cascade_only_has_cascade
  have hB : Boundary cascadeOnlyModel u := cascade_requires_boundary cascadeOnlyModel u hC
  have hP : Persistence cascadeOnlyModel u := boundary_requires_persistence cascadeOnlyModel u hB
  exact ⟨hP, hB, hC, cascade_only_has_no_authorization⟩

/-! ## Satisfiability model: all four foundational hinges can succeed -/

/-- Full local success model for the declared P/B/C/A definitions. -/
def fullSuccessModel : HingeModel where
  Update := DemoUpdate
  Interaction := DemoInteraction
  Carrier := DemoCarrier
  Condition := DemoCondition
  Cut := DemoCut
  retained := fun _ => True
  cutActive := fun _ => True
  discriminates := fun _ _ => True
  produces := demoProduces
  receivesAsInput := demoReceives
  bounded := fun _ => True
  presentedTo := fun _ _ => True
  suppliesBefore := demoBefore
  alteredBy := demoAltered
  suppliesAfter := demoAfter
  holdsWithoutPresentation := demoStable

theorem pPrime_ne_p : pPrime ≠ p := by
  intro h
  cases h

theorem full_success_has_authorization :
    Authorization fullSuccessModel u := by
  refine ⟨?_, k, p, pPrime, ?_, ?_, ?_, ?_, pPrime_ne_p, ?_, ?_⟩
  · refine ⟨?_, i1, i2, ?_, i1_ne_i2, ?_⟩
    · exact ⟨True.intro, cut, True.intro, True.intro⟩
    · exact True.intro
    · exact True.intro
  · exact True.intro
  · exact True.intro
  · exact True.intro
  · exact True.intro
  · exact True.intro
  · exact True.intro

/-- The declared four-hinge package is jointly satisfiable. -/
theorem foundational_hinge_package_is_satisfiable :
    Persistence fullSuccessModel u ∧
    Boundary fullSuccessModel u ∧
    Cascade fullSuccessModel u ∧
    Authorization fullSuccessModel u := by
  have hA : Authorization fullSuccessModel u := full_success_has_authorization
  have hC : Cascade fullSuccessModel u := authorization_requires_cascade fullSuccessModel u hA
  have hB : Boundary fullSuccessModel u := cascade_requires_boundary fullSuccessModel u hC
  have hP : Persistence fullSuccessModel u := boundary_requires_persistence fullSuccessModel u hB
  exact ⟨hP, hB, hC, hA⟩

/-! ## Explicit non-entailment statements -/

def PersistenceEntailsBoundary : Prop :=
  ∀ (M : HingeModel) (u : M.Update),
    Persistence M u → Boundary M u

def BoundaryEntailsCascade : Prop :=
  ∀ (M : HingeModel) (u : M.Update),
    Boundary M u → Cascade M u

def CascadeEntailsAuthorization : Prop :=
  ∀ (M : HingeModel) (u : M.Update),
    Cascade M u → Authorization M u

/-- Persistence does not universally entail Boundary. -/
theorem persistence_does_not_entail_boundary :
    ¬ PersistenceEntailsBoundary := by
  intro hEntails
  have hBoundary : Boundary persistenceOnlyModel u :=
    hEntails persistenceOnlyModel u persistence_only_has_persistence
  exact persistence_only_has_no_boundary hBoundary

/-- Boundary does not universally entail Cascade. -/
theorem boundary_does_not_entail_cascade :
    ¬ BoundaryEntailsCascade := by
  intro hEntails
  have hCascade : Cascade boundaryOnlyModel u :=
    hEntails boundaryOnlyModel u boundary_only_has_boundary
  exact boundary_only_has_no_cascade hCascade

/-- Cascade does not universally entail Authorization. -/
theorem cascade_does_not_entail_authorization :
    ¬ CascadeEntailsAuthorization := by
  intro hEntails
  have hAuthorization : Authorization cascadeOnlyModel u :=
    hEntails cascadeOnlyModel u cascade_only_has_cascade
  exact cascade_only_has_no_authorization hAuthorization

/--
Combined local machine result for the current hinge-separation burden.
This is non-absorption, not exhaustion.
-/
theorem foundational_adjacent_hinges_are_nonabsorbed :
    (¬ PersistenceEntailsBoundary) ∧
    (¬ BoundaryEntailsCascade) ∧
    (¬ CascadeEntailsAuthorization) := by
  exact ⟨persistence_does_not_entail_boundary,
    boundary_does_not_entail_cascade,
    cascade_does_not_entail_authorization⟩

end HingeSeparation


namespace FailureClosure

/-!
Structural Flow — Foundational Failure Closure Kernel v0.2
Lean 4 candidate

Purpose
-------
Strengthen the already-passing first-break partition into an explicit
"no sixth irreducible first-break regime" result at the declared foundational
scope:

  Persistence -> Boundary -> Cascade -> Authorization

The file does NOT define a five-constructor `FailureRegime` datatype and infer
closure by counting constructors. Instead it:

1. represents the independently declared prerequisite capacities as propositions;
2. derives a numerical first-break depth from those capacities;
3. proves that each of the five named regimes occupies one distinct depth;
4. defines an irreducible first-break candidate as a nonempty, well-formed,
   foundational-failure predicate whose instances are homogeneous in first-break
   depth;
5. proves that every such candidate is contained in one of the five already-named
   regimes;
6. proves that a candidate spanning distinct first-break depths is not irreducible
   in this sense and is therefore compound at the first-break level.

Scope / reopening rule
----------------------
This is closure relative to the current four-hinge foundational architecture and
its independently earned two-surface Persistence distinction:

  no establishment / established then lost under load.

A genuinely new necessary foundational capacity changes the architecture and
reopens this theorem. This file is not designed to rule such a capacity out by
fiat.
-/



structure RouteSnapshot where
  produced : Prop
  persistenceEstablished : Prop
  persistenceCarriesUnderLoad : Prop
  boundaryDiscriminates : Prop
  cascadeInherits : Prop
  authorizationIncorporates : Prop

structure WellFormedRoute (s : RouteSnapshot) : Prop where
  loadCarry_requires_establishment :
    s.persistenceCarriesUnderLoad -> s.persistenceEstablished
  boundary_requires_loadCarry :
    s.boundaryDiscriminates -> s.persistenceCarriesUnderLoad
  cascade_requires_boundary :
    s.cascadeInherits -> s.boundaryDiscriminates
  authorization_requires_cascade :
    s.authorizationIncorporates -> s.cascadeInherits

def FoundationalFailure (s : RouteSnapshot) : Prop :=
  s.produced ∧ ¬ s.authorizationIncorporates

def Dissolution (s : RouteSnapshot) : Prop :=
  s.produced ∧ ¬ s.persistenceEstablished

def Shear (s : RouteSnapshot) : Prop :=
  s.produced ∧
  s.persistenceEstablished ∧
  ¬ s.persistenceCarriesUnderLoad

def Drift (s : RouteSnapshot) : Prop :=
  s.produced ∧
  s.persistenceCarriesUnderLoad ∧
  ¬ s.boundaryDiscriminates

def Echo (s : RouteSnapshot) : Prop :=
  s.produced ∧
  s.boundaryDiscriminates ∧
  ¬ s.cascadeInherits

def Lock (s : RouteSnapshot) : Prop :=
  s.produced ∧
  s.cascadeInherits ∧
  ¬ s.authorizationIncorporates

/--
Derived first-break depth.

0 = retained availability never establishes
1 = retained availability establishes but does not carry under relevant load
2 = load-bearing retention survives but Boundary discrimination fails
3 = Boundary succeeds but Cascade inheritance fails
4 = Cascade succeeds but Authorization incorporation fails
5 = Authorization succeeds: no foundational first-break failure remains

The numbers are outputs of the independently stated capacity tests. They are not
introduced as five primitive regime objects.
-/
noncomputable def firstBreakDepth (s : RouteSnapshot) : Nat := by
  classical
  exact
    if s.persistenceEstablished then
      if s.persistenceCarriesUnderLoad then
        if s.boundaryDiscriminates then
          if s.cascadeInherits then
            if s.authorizationIncorporates then 5 else 4
          else 3
        else 2
      else 1
    else 0

/-- Existing first-break exhaustion, retained as the bridge from route failure to
named regime predicates. -/
theorem foundational_failure_exhaustion
    (s : RouteSnapshot)
    (_wf : WellFormedRoute s)
    (hfail : FoundationalFailure s) :
    Dissolution s ∨ Shear s ∨ Drift s ∨ Echo s ∨ Lock s := by
  rcases hfail with ⟨hProduced, hNotAuth⟩
  by_cases hPE : s.persistenceEstablished
  · by_cases hPL : s.persistenceCarriesUnderLoad
    · by_cases hB : s.boundaryDiscriminates
      · by_cases hC : s.cascadeInherits
        · right
          right
          right
          right
          exact ⟨hProduced, hC, hNotAuth⟩
        · right
          right
          right
          left
          exact ⟨hProduced, hB, hC⟩
      · right
        right
        left
        exact ⟨hProduced, hPL, hB⟩
    · right
      left
      exact ⟨hProduced, hPE, hPL⟩
  · left
    exact ⟨hProduced, hPE⟩

/-! Named regimes occupy distinct derived first-break depths. -/

theorem dissolution_depth
    (s : RouteSnapshot)
    (h : Dissolution s) :
    firstBreakDepth s = 0 := by
  rcases h with ⟨_, hNotPE⟩
  simp [firstBreakDepth, hNotPE]

theorem shear_depth
    (s : RouteSnapshot)
    (h : Shear s) :
    firstBreakDepth s = 1 := by
  rcases h with ⟨_, hPE, hNotLoad⟩
  simp [firstBreakDepth, hPE, hNotLoad]

theorem drift_depth
    (s : RouteSnapshot)
    (wf : WellFormedRoute s)
    (h : Drift s) :
    firstBreakDepth s = 2 := by
  rcases h with ⟨_, hLoad, hNotBoundary⟩
  have hPE : s.persistenceEstablished :=
    wf.loadCarry_requires_establishment hLoad
  simp [firstBreakDepth, hPE, hLoad, hNotBoundary]

theorem echo_depth
    (s : RouteSnapshot)
    (wf : WellFormedRoute s)
    (h : Echo s) :
    firstBreakDepth s = 3 := by
  rcases h with ⟨_, hBoundary, hNotCascade⟩
  have hLoad : s.persistenceCarriesUnderLoad :=
    wf.boundary_requires_loadCarry hBoundary
  have hPE : s.persistenceEstablished :=
    wf.loadCarry_requires_establishment hLoad
  simp [firstBreakDepth, hPE, hLoad, hBoundary, hNotCascade]

theorem lock_depth
    (s : RouteSnapshot)
    (wf : WellFormedRoute s)
    (h : Lock s) :
    firstBreakDepth s = 4 := by
  rcases h with ⟨_, hCascade, hNotAuth⟩
  have hBoundary : s.boundaryDiscriminates :=
    wf.cascade_requires_boundary hCascade
  have hLoad : s.persistenceCarriesUnderLoad :=
    wf.boundary_requires_loadCarry hBoundary
  have hPE : s.persistenceEstablished :=
    wf.loadCarry_requires_establishment hLoad
  simp [firstBreakDepth, hPE, hLoad, hBoundary, hCascade, hNotAuth]

/-! Exact characterization of the derived depth values.

These lemmas deliberately exhaust the finite truth-pattern space of the five
capacity propositions used by `firstBreakDepth`. This avoids hiding any
additional inference inside simplification of a partially evaluated `if` tree.
-/

theorem depth_zero_iff
    (s : RouteSnapshot) :
    firstBreakDepth s = 0 ↔ ¬ s.persistenceEstablished := by
  classical
  by_cases hPE : s.persistenceEstablished <;>
  by_cases hLoad : s.persistenceCarriesUnderLoad <;>
  by_cases hBoundary : s.boundaryDiscriminates <;>
  by_cases hCascade : s.cascadeInherits <;>
  by_cases hAuth : s.authorizationIncorporates <;>
  simp [firstBreakDepth, hPE, hLoad, hBoundary, hCascade, hAuth]

theorem depth_one_iff
    (s : RouteSnapshot) :
    firstBreakDepth s = 1 ↔
      s.persistenceEstablished ∧ ¬ s.persistenceCarriesUnderLoad := by
  classical
  by_cases hPE : s.persistenceEstablished <;>
  by_cases hLoad : s.persistenceCarriesUnderLoad <;>
  by_cases hBoundary : s.boundaryDiscriminates <;>
  by_cases hCascade : s.cascadeInherits <;>
  by_cases hAuth : s.authorizationIncorporates <;>
  simp [firstBreakDepth, hPE, hLoad, hBoundary, hCascade, hAuth]

theorem depth_two_iff
    (s : RouteSnapshot) :
    firstBreakDepth s = 2 ↔
      s.persistenceEstablished ∧
      s.persistenceCarriesUnderLoad ∧
      ¬ s.boundaryDiscriminates := by
  classical
  by_cases hPE : s.persistenceEstablished <;>
  by_cases hLoad : s.persistenceCarriesUnderLoad <;>
  by_cases hBoundary : s.boundaryDiscriminates <;>
  by_cases hCascade : s.cascadeInherits <;>
  by_cases hAuth : s.authorizationIncorporates <;>
  simp [firstBreakDepth, hPE, hLoad, hBoundary, hCascade, hAuth]

theorem depth_three_iff
    (s : RouteSnapshot) :
    firstBreakDepth s = 3 ↔
      s.persistenceEstablished ∧
      s.persistenceCarriesUnderLoad ∧
      s.boundaryDiscriminates ∧
      ¬ s.cascadeInherits := by
  classical
  by_cases hPE : s.persistenceEstablished <;>
  by_cases hLoad : s.persistenceCarriesUnderLoad <;>
  by_cases hBoundary : s.boundaryDiscriminates <;>
  by_cases hCascade : s.cascadeInherits <;>
  by_cases hAuth : s.authorizationIncorporates <;>
  simp [firstBreakDepth, hPE, hLoad, hBoundary, hCascade, hAuth]

theorem depth_four_iff
    (s : RouteSnapshot) :
    firstBreakDepth s = 4 ↔
      s.persistenceEstablished ∧
      s.persistenceCarriesUnderLoad ∧
      s.boundaryDiscriminates ∧
      s.cascadeInherits ∧
      ¬ s.authorizationIncorporates := by
  classical
  by_cases hPE : s.persistenceEstablished <;>
  by_cases hLoad : s.persistenceCarriesUnderLoad <;>
  by_cases hBoundary : s.boundaryDiscriminates <;>
  by_cases hCascade : s.cascadeInherits <;>
  by_cases hAuth : s.authorizationIncorporates <;>
  simp [firstBreakDepth, hPE, hLoad, hBoundary, hCascade, hAuth]

theorem depth_five_iff
    (s : RouteSnapshot) :
    firstBreakDepth s = 5 ↔
      s.persistenceEstablished ∧
      s.persistenceCarriesUnderLoad ∧
      s.boundaryDiscriminates ∧
      s.cascadeInherits ∧
      s.authorizationIncorporates := by
  classical
  by_cases hPE : s.persistenceEstablished <;>
  by_cases hLoad : s.persistenceCarriesUnderLoad <;>
  by_cases hBoundary : s.boundaryDiscriminates <;>
  by_cases hCascade : s.cascadeInherits <;>
  by_cases hAuth : s.authorizationIncorporates <;>
  simp [firstBreakDepth, hPE, hLoad, hBoundary, hCascade, hAuth]

/-! Converse direction: a foundational failure at each derived depth is exactly
inside the corresponding existing regime predicate. -/

theorem depth_zero_is_dissolution
    (s : RouteSnapshot)
    (hfail : FoundationalFailure s)
    (hDepth : firstBreakDepth s = 0) :
    Dissolution s := by
  rcases hfail with ⟨hProduced, _⟩
  have hNotPE : ¬ s.persistenceEstablished :=
    (depth_zero_iff s).mp hDepth
  exact ⟨hProduced, hNotPE⟩

theorem depth_one_is_shear
    (s : RouteSnapshot)
    (hfail : FoundationalFailure s)
    (hDepth : firstBreakDepth s = 1) :
    Shear s := by
  rcases hfail with ⟨hProduced, _⟩
  rcases (depth_one_iff s).mp hDepth with ⟨hPE, hNotLoad⟩
  exact ⟨hProduced, hPE, hNotLoad⟩

theorem depth_two_is_drift
    (s : RouteSnapshot)
    (hfail : FoundationalFailure s)
    (hDepth : firstBreakDepth s = 2) :
    Drift s := by
  rcases hfail with ⟨hProduced, _⟩
  rcases (depth_two_iff s).mp hDepth with ⟨_, hLoad, hNotBoundary⟩
  exact ⟨hProduced, hLoad, hNotBoundary⟩

theorem depth_three_is_echo
    (s : RouteSnapshot)
    (hfail : FoundationalFailure s)
    (hDepth : firstBreakDepth s = 3) :
    Echo s := by
  rcases hfail with ⟨hProduced, _⟩
  rcases (depth_three_iff s).mp hDepth with
    ⟨_, _, hBoundary, hNotCascade⟩
  exact ⟨hProduced, hBoundary, hNotCascade⟩

theorem depth_four_is_lock
    (s : RouteSnapshot)
    (hfail : FoundationalFailure s)
    (hDepth : firstBreakDepth s = 4) :
    Lock s := by
  rcases hfail with ⟨hProduced, _⟩
  rcases (depth_four_iff s).mp hDepth with
    ⟨_, _, _, hCascade, hNotAuth⟩
  exact ⟨hProduced, hCascade, hNotAuth⟩

/-- Any current foundational failure has derived first-break depth strictly below
5. Depth 5 is the success side where Authorization incorporation holds. -/
theorem foundational_failure_depth_lt_five
    (s : RouteSnapshot)
    (wf : WellFormedRoute s)
    (hfail : FoundationalFailure s) :
    firstBreakDepth s < 5 := by
  have hClass := foundational_failure_exhaustion s wf hfail
  rcases hClass with hD | hS | hR | hE | hL
  · simp [dissolution_depth s hD]
  · simp [shear_depth s hS]
  · simp [drift_depth s wf hR]
  · simp [echo_depth s wf hE]
  · simp [lock_depth s wf hL]

/--
An irreducible first-break candidate at the current scope.

`homogeneous` encodes the first-break criterion itself: one irreducible regime
cannot contain failures whose earliest broken foundational burden occurs at
multiple derived depths. Such a mixed predicate is compound at this level.
-/
structure FirstBreakCandidate (R : RouteSnapshot -> Prop) : Prop where
  nonempty : ∃ s, R s
  failure : ∀ s, R s -> FoundationalFailure s
  wellFormed : ∀ s, R s -> WellFormedRoute s
  homogeneous :
    ∀ s t, R s -> R t -> firstBreakDepth s = firstBreakDepth t

/--
Core closure theorem.

Every nonempty irreducible first-break candidate inside the present architecture
collapses into one of the five existing regime classes: every instance of the
candidate is contained in that existing regime predicate.

This is stronger than saying each individual failure can be labeled. It says a
putative sixth irreducible predicate cannot occupy a new first-break class while
remaining inside the same architecture and classification rule.
-/
theorem irreducible_candidate_collapses_to_existing_regime
    (R : RouteSnapshot -> Prop)
    (c : FirstBreakCandidate R) :
    (∀ s, R s -> Dissolution s) ∨
    (∀ s, R s -> Shear s) ∨
    (∀ s, R s -> Drift s) ∨
    (∀ s, R s -> Echo s) ∨
    (∀ s, R s -> Lock s) := by
  rcases c.nonempty with ⟨w, hw⟩
  have hWFail : FoundationalFailure w := c.failure w hw
  have hWWf : WellFormedRoute w := c.wellFormed w hw
  have hClass := foundational_failure_exhaustion w hWWf hWFail
  rcases hClass with hD | hS | hR | hE | hL
  · left
    intro s hs
    have hDepthW : firstBreakDepth w = 0 := dissolution_depth w hD
    have hDepthS : firstBreakDepth s = 0 := by
      calc
        firstBreakDepth s = firstBreakDepth w := c.homogeneous s w hs hw
        _ = 0 := hDepthW
    exact depth_zero_is_dissolution s (c.failure s hs) hDepthS
  · right
    left
    intro s hs
    have hDepthW : firstBreakDepth w = 1 := shear_depth w hS
    have hDepthS : firstBreakDepth s = 1 := by
      calc
        firstBreakDepth s = firstBreakDepth w := c.homogeneous s w hs hw
        _ = 1 := hDepthW
    exact depth_one_is_shear s (c.failure s hs) hDepthS
  · right
    right
    left
    intro s hs
    have hDepthW : firstBreakDepth w = 2 := drift_depth w hWWf hR
    have hDepthS : firstBreakDepth s = 2 := by
      calc
        firstBreakDepth s = firstBreakDepth w := c.homogeneous s w hs hw
        _ = 2 := hDepthW
    exact depth_two_is_drift s (c.failure s hs) hDepthS
  · right
    right
    right
    left
    intro s hs
    have hDepthW : firstBreakDepth w = 3 := echo_depth w hWWf hE
    have hDepthS : firstBreakDepth s = 3 := by
      calc
        firstBreakDepth s = firstBreakDepth w := c.homogeneous s w hs hw
        _ = 3 := hDepthW
    exact depth_three_is_echo s (c.failure s hs) hDepthS
  · right
    right
    right
    right
    intro s hs
    have hDepthW : firstBreakDepth w = 4 := lock_depth w hWWf hL
    have hDepthS : firstBreakDepth s = 4 := by
      calc
        firstBreakDepth s = firstBreakDepth w := c.homogeneous s w hs hw
        _ = 4 := hDepthW
    exact depth_four_is_lock s (c.failure s hs) hDepthS

/-- If a proposed predicate contains two current failure instances at genuinely
different first-break depths, it cannot be one irreducible first-break regime.
At this classification level it is compound. -/
theorem cross_depth_predicate_is_not_irreducible
    (R : RouteSnapshot -> Prop)
    (s t : RouteSnapshot)
    (hs : R s)
    (ht : R t)
    (hDifferent : firstBreakDepth s ≠ firstBreakDepth t) :
    ¬ FirstBreakCandidate R := by
  intro c
  exact hDifferent (c.homogeneous s t hs ht)

/-- Public-facing closure statement for the present architecture. -/
theorem no_sixth_irreducible_first_break_regime_inside_current_architecture
    (R : RouteSnapshot -> Prop)
    (c : FirstBreakCandidate R) :
    (∀ s, R s -> Dissolution s) ∨
    (∀ s, R s -> Shear s) ∨
    (∀ s, R s -> Drift s) ∨
    (∀ s, R s -> Echo s) ∨
    (∀ s, R s -> Lock s) := by
  exact irreducible_candidate_collapses_to_existing_regime R c

end FailureClosure


namespace Austerity

/-
Structural Flow — Austerity / No-Hidden-Primitive Kernel v0.1
Lean 4 candidate

Authority:
  Structural Flow T.O.E. v1.64
  Six Faces of Chance:
    Permissive
    Eventful
    Permits Retry
    Does Not Guarantee Persistence
    Non-Teleological
    Austere

Purpose:
  Machine-audit the special job of the Austere face without defining a finite
  catalogue of possible hidden primitives.

Key design:
  `Extra` is an arbitrary type supplied from outside this kernel.
  The kernel does NOT enumerate time, memory, law, symmetry, probability,
  geometry, observerhood, or any other possible added primitive content.
  Any proposed additional primitive-level commitment can be represented by
  an arbitrary `e : Extra`.

  Austerity then means:
      no `Extra` commitment is carried primitively.

  This lets us prove:
    1. the canonical primitive is Austere;
    2. any candidate with the five positive/non-guarantee faces plus any extra
       primitive commitment is strictly richer than the canonical primitive;
    3. any Austere candidate carrying those same five faces is commitment-
       equivalent to the canonical primitive;
    4. Austerity is exactly the absence of an extra primitive commitment.

Scope:
  This is a primitive-signature/minimality audit.
  It does not yet prove the complete six-face closure theorem by itself.
  If a proposed seventh face cannot be represented as either one of the five
  stated primitive commitments or an additional primitive commitment `Extra`,
  that challenges the declared primitive-signature language and reopens the
  closure burden rather than being excluded by this file.
-/

universe u



/-- A primitive specification carries the five non-Austerity face commitments,
    plus an open-ended family of possible additional primitive commitments. -/
structure PrimitiveSpec (Extra : Type u) where
  permissive : Prop
  eventful : Prop
  permitsRetry : Prop
  doesNotGuaranteePersistence : Prop
  nonTeleological : Prop
  extra : Extra → Prop

/-- Commitment vocabulary. `extra e` is deliberately open-ended. -/
inductive Commitment (Extra : Type u) where
  | permissive
  | eventful
  | permitsRetry
  | doesNotGuaranteePersistence
  | nonTeleological
  | extra (e : Extra)

/-- Does primitive specification `p` carry commitment `c`? -/
def Commits {Extra : Type u} (p : PrimitiveSpec Extra) :
    Commitment Extra → Prop
  | .permissive => p.permissive
  | .eventful => p.eventful
  | .permitsRetry => p.permitsRetry
  | .doesNotGuaranteePersistence => p.doesNotGuaranteePersistence
  | .nonTeleological => p.nonTeleological
  | .extra e => p.extra e

/-- The five stated commitments other than the global Austerity foreclosure. -/
def CarriesFive {Extra : Type u} (p : PrimitiveSpec Extra) : Prop :=
  p.permissive ∧
  p.eventful ∧
  p.permitsRetry ∧
  p.doesNotGuaranteePersistence ∧
  p.nonTeleological

/-- Austerity: no additional primitive commitment is carried. -/
def Austere {Extra : Type u} (p : PrimitiveSpec Extra) : Prop :=
  ∀ e, ¬ p.extra e

/-- Commitment inclusion: every primitive commitment of `p` is also carried by `q`. -/
def LeCommit {Extra : Type u} (p q : PrimitiveSpec Extra) : Prop :=
  ∀ c, Commits p c → Commits q c

/-- `richer` carries everything `base` carries and at least something not carried back. -/
def StrictlyRicher {Extra : Type u}
    (richer base : PrimitiveSpec Extra) : Prop :=
  LeCommit base richer ∧ ¬ LeCommit richer base

/-- Canonical five-face content with no hidden primitive commitments. -/
def chanceCore (Extra : Type u) : PrimitiveSpec Extra where
  permissive := True
  eventful := True
  permitsRetry := True
  doesNotGuaranteePersistence := True
  nonTeleological := True
  extra := fun _ => False

theorem chanceCore_carriesFive (Extra : Type u) :
    CarriesFive (chanceCore Extra) := by
  simp [CarriesFive, chanceCore]

theorem chanceCore_austere (Extra : Type u) :
    Austere (chanceCore Extra) := by
  intro e h
  exact h

/-- Austerity is exactly the absence of any extra primitive commitment. -/
theorem austere_iff_no_extra {Extra : Type u} (p : PrimitiveSpec Extra) :
    Austere p ↔ ¬ ∃ e, p.extra e := by
  constructor
  · intro hA hExtra
    rcases hExtra with ⟨e, he⟩
    exact hA e he
  · intro hNo e he
    apply hNo
    exact ⟨e, he⟩

/-- Any specification carrying the five stated faces carries at least everything
    carried by the canonical core. -/
theorem chanceCore_le_of_carriesFive
    {Extra : Type u} {p : PrimitiveSpec Extra}
    (hFive : CarriesFive p) :
    LeCommit (chanceCore Extra) p := by
  intro c hc
  rcases hFive with ⟨hPerm, hEvent, hRetry, hNoPersist, hNonTel⟩
  cases c with
  | permissive =>
      exact hPerm
  | eventful =>
      exact hEvent
  | permitsRetry =>
      exact hRetry
  | doesNotGuaranteePersistence =>
      exact hNoPersist
  | nonTeleological =>
      exact hNonTel
  | extra e =>
      exact False.elim hc

/-- Any Austere specification carries no commitment absent from the canonical core. -/
theorem le_chanceCore_of_austere
    {Extra : Type u} {p : PrimitiveSpec Extra}
    (hA : Austere p) :
    LeCommit p (chanceCore Extra) := by
  intro c hc
  cases c with
  | permissive =>
      exact True.intro
  | eventful =>
      exact True.intro
  | permitsRetry =>
      exact True.intro
  | doesNotGuaranteePersistence =>
      exact True.intro
  | nonTeleological =>
      exact True.intro
  | extra e =>
      exact hA e hc

/-- If a candidate carries the five stated faces and adds any primitive
    commitment, it is strictly richer than the canonical Chance core. -/
theorem extra_primitive_makes_candidate_strictly_richer
    {Extra : Type u} {p : PrimitiveSpec Extra}
    (hFive : CarriesFive p)
    (hExtra : ∃ e, p.extra e) :
    StrictlyRicher p (chanceCore Extra) := by
  constructor
  · exact chanceCore_le_of_carriesFive hFive
  · intro hBack
    rcases hExtra with ⟨e, he⟩
    have hCoreExtra : Commits (chanceCore Extra) (.extra e) :=
      hBack (.extra e) he
    exact hCoreExtra

/-- Austerity blocks every proposed extra primitive commitment, no matter what
    the externally supplied type `Extra` contains. -/
theorem austerity_blocks_arbitrary_extra
    {Extra : Type u} {p : PrimitiveSpec Extra}
    (hA : Austere p) :
    ∀ e : Extra, ¬ p.extra e :=
  hA

/-- Five-face agreement plus Austerity yields commitment equivalence to the
    canonical core. No hidden primitive content remains. -/
theorem five_plus_austere_commitment_equivalent_to_core
    {Extra : Type u} {p : PrimitiveSpec Extra}
    (hFive : CarriesFive p)
    (hA : Austere p) :
    ∀ c, Commits p c ↔ Commits (chanceCore Extra) c := by
  intro c
  constructor
  · exact le_chanceCore_of_austere hA c
  · exact chanceCore_le_of_carriesFive hFive c

/-- If a candidate carries any extra primitive commitment, it is not Austere. -/
theorem any_extra_breaks_austerity
    {Extra : Type u} {p : PrimitiveSpec Extra}
    (hExtra : ∃ e, p.extra e) :
    ¬ Austere p := by
  intro hA
  rcases hExtra with ⟨e, he⟩
  exact hA e he

end Austerity


namespace SixFaceClosure

/-
Structural Flow — Six-Face Signature Closure Kernel v0.1
Lean 4 candidate

Authority:
  Structural Flow T.O.E. v1.64
  Chance contains exactly six non-optional faces:
    1. Permissive
    2. Eventful
    3. Permits Retry
    4. Does Not Guarantee Persistence
    5. Non-Teleological
    6. Austere

Purpose:
  Machine-audit the exact "six faces" burden without proving closure by
  merely defining a six-constructor enumeration.

Architecture of the proof:
  * The first five faces are treated as independently necessary primitive
    commitments.
  * Austerity is not a sixth ordinary positive commitment. It is the global
    closure condition: no additional primitive commitment is carried.
  * `Extra` remains an arbitrary externally supplied type. Therefore no finite
    catalogue of possible hidden primitives is built into the theorem.
  * A "seventh independent primitive face" is represented extensionally as
    any extra primitive commitment beyond the five stated commitments.
  * The theorem proves that such a seventh independent commitment is
    incompatible with Austerity.
  * Conversely, five-face agreement plus Austerity is commitment-equivalent
    to the canonical Chance signature.

What this does NOT claim:
  * It does not prove that no derived, meta-level, explanatory, or redundant
    property can ever be stated about Chance.
  * It does not define every conceivable English predicate over the primitive.
  * It closes only the declared primitive-signature burden:
      five independent primitive commitments + the global no-extra condition.
  * If a challenger produces a purported seventh "face" that is neither one of
    the five primitive commitments nor an additional primitive commitment,
    its status must be adjudicated as derived/meta/redundant or the signature
    language must be reopened.
-/

universe u



/-- The five primitive-level commitments other than the global Austerity closure. -/
structure FiveFaces where
  permissive : Prop
  eventful : Prop
  permitsRetry : Prop
  doesNotGuaranteePersistence : Prop
  nonTeleological : Prop

/-- A full primitive candidate carries the five named commitments plus an
    open-ended family of possible additional primitive commitments. -/
structure PrimitiveCandidate (Extra : Type u) where
  core : FiveFaces
  extra : Extra → Prop

/-- The five current faces all hold. -/
def CarriesFive {Extra : Type u} (p : PrimitiveCandidate Extra) : Prop :=
  p.core.permissive ∧
  p.core.eventful ∧
  p.core.permitsRetry ∧
  p.core.doesNotGuaranteePersistence ∧
  p.core.nonTeleological

/-- Austerity is the global primitive-signature closure condition. -/
def Austere {Extra : Type u} (p : PrimitiveCandidate Extra) : Prop :=
  ∀ e : Extra, ¬ p.extra e

/-- Canonical Chance signature: all five named commitments, no extra primitive content. -/
def chanceSignature (Extra : Type u) : PrimitiveCandidate Extra where
  core := {
    permissive := True
    eventful := True
    permitsRetry := True
    doesNotGuaranteePersistence := True
    nonTeleological := True
  }
  extra := fun _ => False

theorem canonical_carries_five (Extra : Type u) :
    CarriesFive (chanceSignature Extra) := by
  simp [CarriesFive, chanceSignature]

theorem canonical_is_austere (Extra : Type u) :
    Austere (chanceSignature Extra) := by
  intro e he
  exact he

/-
Nonredundancy witnesses.

Each witness preserves the other four core commitments and Austerity while
negating exactly one named face. These are not intended as physical universes;
they are logical separating assignments demonstrating that no one of the five
named primitive commitments is entailed merely by the other four + Austerity.
-/

def withoutPermissive (Extra : Type u) : PrimitiveCandidate Extra where
  core := {
    permissive := False
    eventful := True
    permitsRetry := True
    doesNotGuaranteePersistence := True
    nonTeleological := True
  }
  extra := fun _ => False

def withoutEventful (Extra : Type u) : PrimitiveCandidate Extra where
  core := {
    permissive := True
    eventful := False
    permitsRetry := True
    doesNotGuaranteePersistence := True
    nonTeleological := True
  }
  extra := fun _ => False

def withoutRetry (Extra : Type u) : PrimitiveCandidate Extra where
  core := {
    permissive := True
    eventful := True
    permitsRetry := False
    doesNotGuaranteePersistence := True
    nonTeleological := True
  }
  extra := fun _ => False

def withGuaranteedPersistence (Extra : Type u) : PrimitiveCandidate Extra where
  core := {
    permissive := True
    eventful := True
    permitsRetry := True
    doesNotGuaranteePersistence := False
    nonTeleological := True
  }
  extra := fun _ => False

def withTeleology (Extra : Type u) : PrimitiveCandidate Extra where
  core := {
    permissive := True
    eventful := True
    permitsRetry := True
    doesNotGuaranteePersistence := True
    nonTeleological := False
  }
  extra := fun _ => False

theorem permissive_not_entailed_by_other_four_plus_austerity
    (Extra : Type u) :
    (withoutPermissive Extra).core.eventful ∧
    (withoutPermissive Extra).core.permitsRetry ∧
    (withoutPermissive Extra).core.doesNotGuaranteePersistence ∧
    (withoutPermissive Extra).core.nonTeleological ∧
    Austere (withoutPermissive Extra) ∧
    ¬ (withoutPermissive Extra).core.permissive := by
  simp [withoutPermissive, Austere]

theorem eventful_not_entailed_by_other_four_plus_austerity
    (Extra : Type u) :
    (withoutEventful Extra).core.permissive ∧
    (withoutEventful Extra).core.permitsRetry ∧
    (withoutEventful Extra).core.doesNotGuaranteePersistence ∧
    (withoutEventful Extra).core.nonTeleological ∧
    Austere (withoutEventful Extra) ∧
    ¬ (withoutEventful Extra).core.eventful := by
  simp [withoutEventful, Austere]

theorem retry_not_entailed_by_other_four_plus_austerity
    (Extra : Type u) :
    (withoutRetry Extra).core.permissive ∧
    (withoutRetry Extra).core.eventful ∧
    (withoutRetry Extra).core.doesNotGuaranteePersistence ∧
    (withoutRetry Extra).core.nonTeleological ∧
    Austere (withoutRetry Extra) ∧
    ¬ (withoutRetry Extra).core.permitsRetry := by
  simp [withoutRetry, Austere]

theorem no_guaranteed_persistence_not_entailed_by_other_four_plus_austerity
    (Extra : Type u) :
    (withGuaranteedPersistence Extra).core.permissive ∧
    (withGuaranteedPersistence Extra).core.eventful ∧
    (withGuaranteedPersistence Extra).core.permitsRetry ∧
    (withGuaranteedPersistence Extra).core.nonTeleological ∧
    Austere (withGuaranteedPersistence Extra) ∧
    ¬ (withGuaranteedPersistence Extra).core.doesNotGuaranteePersistence := by
  simp [withGuaranteedPersistence, Austere]

theorem nonteleology_not_entailed_by_other_four_plus_austerity
    (Extra : Type u) :
    (withTeleology Extra).core.permissive ∧
    (withTeleology Extra).core.eventful ∧
    (withTeleology Extra).core.permitsRetry ∧
    (withTeleology Extra).core.doesNotGuaranteePersistence ∧
    Austere (withTeleology Extra) ∧
    ¬ (withTeleology Extra).core.nonTeleological := by
  simp [withTeleology, Austere]

/-- A proposed seventh INDEPENDENT primitive face is represented as an
    additional primitive commitment. Austerity excludes every such commitment,
    regardless of what `Extra` contains. -/
theorem no_seventh_independent_primitive_face_under_austerity
    {Extra : Type u} {p : PrimitiveCandidate Extra}
    (hA : Austere p) :
    ¬ ∃ e : Extra, p.extra e := by
  intro h
  rcases h with ⟨e, he⟩
  exact hA e he

/-- If an extra primitive commitment exists, Austerity is false. -/
theorem seventh_independent_commitment_reopens_austerity
    {Extra : Type u} {p : PrimitiveCandidate Extra}
    (hExtra : ∃ e : Extra, p.extra e) :
    ¬ Austere p := by
  intro hA
  exact no_seventh_independent_primitive_face_under_austerity hA hExtra

/-- Commitment equivalence at primitive-signature scope:
    any candidate with the five named commitments + Austerity carries exactly
    the same primitive commitments as the canonical Chance signature. -/
inductive PrimitiveCommitment (Extra : Type u) where
  | permissive
  | eventful
  | permitsRetry
  | doesNotGuaranteePersistence
  | nonTeleological
  | extra (e : Extra)

def Commits {Extra : Type u}
    (p : PrimitiveCandidate Extra) : PrimitiveCommitment Extra → Prop
  | .permissive => p.core.permissive
  | .eventful => p.core.eventful
  | .permitsRetry => p.core.permitsRetry
  | .doesNotGuaranteePersistence => p.core.doesNotGuaranteePersistence
  | .nonTeleological => p.core.nonTeleological
  | .extra e => p.extra e

theorem five_plus_austerity_exactly_matches_canonical_signature
    {Extra : Type u} {p : PrimitiveCandidate Extra}
    (hFive : CarriesFive p)
    (hA : Austere p) :
    ∀ c : PrimitiveCommitment Extra,
      Commits p c ↔ Commits (chanceSignature Extra) c := by
  intro c
  rcases hFive with ⟨hPerm, hEvent, hRetry, hNoPersist, hNonTel⟩
  cases c with
  | permissive =>
      simp [Commits, chanceSignature, hPerm]
  | eventful =>
      simp [Commits, chanceSignature, hEvent]
  | permitsRetry =>
      simp [Commits, chanceSignature, hRetry]
  | doesNotGuaranteePersistence =>
      simp [Commits, chanceSignature, hNoPersist]
  | nonTeleological =>
      simp [Commits, chanceSignature, hNonTel]
  | extra e =>
      constructor
      · intro he
        exact False.elim (hA e he)
      · intro he
        exact False.elim he

/-- Six-face signature closure at declared primitive scope.

    The five named primitive commitments are separately necessary/nonredundant
    (shown by the witnesses above), and Austerity globally excludes every
    additional independent primitive commitment.

    Therefore a candidate satisfying the current six-face burden has exactly
    the canonical primitive-signature commitments and no seventh independent
    primitive face inside this declared signature architecture. -/
theorem six_face_signature_closure
    {Extra : Type u} {p : PrimitiveCandidate Extra}
    (hFive : CarriesFive p)
    (hA : Austere p) :
    (∀ c : PrimitiveCommitment Extra,
      Commits p c ↔ Commits (chanceSignature Extra) c)
    ∧
    ¬ ∃ e : Extra, p.extra e := by
  constructor
  · exact five_plus_austerity_exactly_matches_canonical_signature hFive hA
  · exact no_seventh_independent_primitive_face_under_austerity hA

end SixFaceClosure


namespace PrimitiveMinimality

/-
Structural Flow — Primitive Minimality Kernel v0.1
Lean 4 candidate

Authority:
  Structural Flow T.O.E. v1.64
  Structural Flow Closure Card v1.4
  Primitive closure claim:
    Chance / non-guarantee is the minimal structural primitive sufficient
    for the universal Structural Flow grammar within declared scope.

Purpose:
  Machine-audit primitive minimality as an order-theoretic "least sufficient"
  claim over primitive commitments.

Anti-smuggling design:
  * The primitive is NOT declared minimal by fiat.
  * Candidates may carry arbitrary additional primitive commitments through
    an externally supplied type `Extra`.
  * Sufficiency requires the five positive/specific primitive commitments
    already established by the six-face audit:
        Permissive
        Eventful
        Permits Retry
        Does Not Guarantee Persistence
        Non-Teleological
    Austerity is then the global no-extra condition, not an extra positive
    commitment.
  * Commitment inclusion defines "no richer than".
  * The canonical Chance signature carries the five required commitments and
    no extras.
  * We prove it is LEAST among all sufficient candidates.
  * Any sufficient candidate with an extra primitive commitment is strictly
    richer.
  * Any sufficient candidate with no extras is commitment-equivalent to
    Chance.
  * A candidate omitting any required commitment is not sufficient.

Scope / honesty boundary:
  This theorem is relative to the declared primitive-signature language and
  sufficiency burden. It does not prove metaphysical uniqueness across every
  conceivable ontology. A proposed primitive whose relevant commitments cannot
  be represented in this signature language challenges the formalization scope
  and reopens primitive closure rather than being excluded by definition.
-/

universe u



/-- Open-ended primitive commitment vocabulary. -/
inductive Commitment (Extra : Type u) where
  | permissive
  | eventful
  | permitsRetry
  | doesNotGuaranteePersistence
  | nonTeleological
  | extra (e : Extra)

/-- A candidate primitive specification. -/
structure PrimitiveCandidate (Extra : Type u) where
  permissive : Prop
  eventful : Prop
  permitsRetry : Prop
  doesNotGuaranteePersistence : Prop
  nonTeleological : Prop
  extra : Extra → Prop

/-- Which primitive commitments does a candidate carry? -/
def Commits {Extra : Type u} (p : PrimitiveCandidate Extra) :
    Commitment Extra → Prop
  | .permissive => p.permissive
  | .eventful => p.eventful
  | .permitsRetry => p.permitsRetry
  | .doesNotGuaranteePersistence => p.doesNotGuaranteePersistence
  | .nonTeleological => p.nonTeleological
  | .extra e => p.extra e

/-- Candidate `p` is no richer than candidate `q` when every commitment of `p`
    is also carried by `q`. -/
def LeCommit {Extra : Type u}
    (p q : PrimitiveCandidate Extra) : Prop :=
  ∀ c, Commits p c → Commits q c

/-- Commitment equivalence. -/
def CommitmentEquivalent {Extra : Type u}
    (p q : PrimitiveCandidate Extra) : Prop :=
  LeCommit p q ∧ LeCommit q p

/-- Strict richness: `richer` contains all commitments of `base` and at least
    one commitment not carried back by `base`. -/
def StrictlyRicher {Extra : Type u}
    (richer base : PrimitiveCandidate Extra) : Prop :=
  LeCommit base richer ∧ ¬ LeCommit richer base

/-- The declared primitive sufficiency burden:
    all five specific Chance commitments must be carried.
    A candidate may carry MORE and still be sufficient, but then it may fail
    minimality. -/
def Sufficient {Extra : Type u} (p : PrimitiveCandidate Extra) : Prop :=
  p.permissive ∧
  p.eventful ∧
  p.permitsRetry ∧
  p.doesNotGuaranteePersistence ∧
  p.nonTeleological

/-- Austerity: no additional primitive commitments. -/
def Austere {Extra : Type u} (p : PrimitiveCandidate Extra) : Prop :=
  ∀ e : Extra, ¬ p.extra e

/-- Canonical Chance signature. -/
def chance (Extra : Type u) : PrimitiveCandidate Extra where
  permissive := True
  eventful := True
  permitsRetry := True
  doesNotGuaranteePersistence := True
  nonTeleological := True
  extra := fun _ => False

/-- Least-sufficient means sufficient and no richer than every other sufficient
    candidate. This is stronger than merely being one minimal element. -/
def LeastSufficient {Extra : Type u}
    (p : PrimitiveCandidate Extra) : Prop :=
  Sufficient p ∧
  ∀ q : PrimitiveCandidate Extra, Sufficient q → LeCommit p q

theorem chance_is_sufficient (Extra : Type u) :
    Sufficient (chance Extra) := by
  simp [Sufficient, chance]

theorem chance_is_austere (Extra : Type u) :
    Austere (chance Extra) := by
  intro e he
  exact he

/-- Core order lemma:
    every sufficient candidate carries every commitment carried by Chance. -/
theorem chance_le_every_sufficient
    {Extra : Type u}
    (q : PrimitiveCandidate Extra)
    (hq : Sufficient q) :
    LeCommit (chance Extra) q := by
  intro c hc
  rcases hq with ⟨hPerm, hEvent, hRetry, hNoPersist, hNonTel⟩
  cases c with
  | permissive =>
      exact hPerm
  | eventful =>
      exact hEvent
  | permitsRetry =>
      exact hRetry
  | doesNotGuaranteePersistence =>
      exact hNoPersist
  | nonTeleological =>
      exact hNonTel
  | extra e =>
      exact False.elim hc

/-- Primitive minimality in the strongest order-theoretic form available here:
    Chance is the least sufficient primitive signature. -/
theorem chance_is_least_sufficient (Extra : Type u) :
    LeastSufficient (chance Extra) := by
  constructor
  · exact chance_is_sufficient Extra
  · intro q hq
    exact chance_le_every_sufficient q hq

/-- Any sufficient primitive candidate that adds at least one extra primitive
    commitment is strictly richer than Chance. -/
theorem sufficient_plus_extra_is_strictly_richer
    {Extra : Type u}
    {q : PrimitiveCandidate Extra}
    (hq : Sufficient q)
    (hExtra : ∃ e : Extra, q.extra e) :
    StrictlyRicher q (chance Extra) := by
  constructor
  · exact chance_le_every_sufficient q hq
  · intro hBack
    rcases hExtra with ⟨e, he⟩
    have hChanceExtra : Commits (chance Extra) (.extra e) :=
      hBack (.extra e) he
    exact hChanceExtra

/-- If a sufficient candidate is Austere, it carries nothing beyond Chance and
    is commitment-equivalent to Chance. -/
theorem sufficient_plus_austere_is_equivalent
    {Extra : Type u}
    {q : PrimitiveCandidate Extra}
    (hq : Sufficient q)
    (hA : Austere q) :
    CommitmentEquivalent q (chance Extra) := by
  constructor
  · intro c hc
    cases c with
    | permissive =>
        exact True.intro
    | eventful =>
        exact True.intro
    | permitsRetry =>
        exact True.intro
    | doesNotGuaranteePersistence =>
        exact True.intro
    | nonTeleological =>
        exact True.intro
    | extra e =>
        exact False.elim (hA e hc)
  · exact chance_le_every_sufficient q hq

/-
Weaker / null-side sufficiency failures.
These prove that removing any one required core commitment leaves the declared
primitive sufficiency class.
-/

theorem missing_permissive_not_sufficient
    {Extra : Type u}
    {q : PrimitiveCandidate Extra}
    (h : ¬ q.permissive) :
    ¬ Sufficient q := by
  intro hs
  exact h hs.1

theorem missing_eventful_not_sufficient
    {Extra : Type u}
    {q : PrimitiveCandidate Extra}
    (h : ¬ q.eventful) :
    ¬ Sufficient q := by
  intro hs
  exact h hs.2.1

theorem missing_retry_not_sufficient
    {Extra : Type u}
    {q : PrimitiveCandidate Extra}
    (h : ¬ q.permitsRetry) :
    ¬ Sufficient q := by
  intro hs
  exact h hs.2.2.1

theorem missing_no_guaranteed_persistence_not_sufficient
    {Extra : Type u}
    {q : PrimitiveCandidate Extra}
    (h : ¬ q.doesNotGuaranteePersistence) :
    ¬ Sufficient q := by
  intro hs
  exact h hs.2.2.2.1

theorem missing_nonteleology_not_sufficient
    {Extra : Type u}
    {q : PrimitiveCandidate Extra}
    (h : ¬ q.nonTeleological) :
    ¬ Sufficient q := by
  intro hs
  exact h hs.2.2.2.2

/-- Explicit null candidate. -/
def nullPrimitive (Extra : Type u) : PrimitiveCandidate Extra where
  permissive := False
  eventful := False
  permitsRetry := False
  doesNotGuaranteePersistence := False
  nonTeleological := False
  extra := fun _ => False

theorem null_is_not_sufficient (Extra : Type u) :
    ¬ Sufficient (nullPrimitive Extra) := by
  simp [Sufficient, nullPrimitive]

/-- Any least-sufficient candidate is commitment-equivalent to Chance.
    Therefore "distinct but equally minimal" candidates collapse to the same
    primitive burden at this signature scope. -/
theorem least_sufficient_unique_up_to_commitment_equivalence
    {Extra : Type u}
    {q : PrimitiveCandidate Extra}
    (hq : LeastSufficient q) :
    CommitmentEquivalent q (chance Extra) := by
  rcases hq with ⟨hqSuff, hLeast⟩
  constructor
  · exact hLeast (chance Extra) (chance_is_sufficient Extra)
  · exact chance_le_every_sufficient q hqSuff

/-- Exhaustion/classification theorem for sufficient rivals:
    every sufficient candidate is either commitment-equivalent to Chance
    (no extra primitive content) or strictly richer than Chance
    (some extra primitive content). -/
theorem every_sufficient_rival_equivalent_or_richer
    {Extra : Type u}
    (q : PrimitiveCandidate Extra)
    (hq : Sufficient q) :
    CommitmentEquivalent q (chance Extra) ∨
    StrictlyRicher q (chance Extra) := by
  classical
  by_cases hExtra : ∃ e : Extra, q.extra e
  · right
    exact sufficient_plus_extra_is_strictly_richer hq hExtra
  · left
    apply sufficient_plus_austere_is_equivalent hq
    intro e he
    apply hExtra
    exact ⟨e, he⟩

/-- Compact primitive closure theorem at declared signature scope. -/
theorem primitive_minimality_closure
    (Extra : Type u) :
    LeastSufficient (chance Extra)
    ∧
    (∀ q : PrimitiveCandidate Extra,
      Sufficient q →
      CommitmentEquivalent q (chance Extra) ∨
      StrictlyRicher q (chance Extra)) := by
  constructor
  · exact chance_is_least_sufficient Extra
  · intro q hq
    exact every_sufficient_rival_equivalent_or_richer q hq

end PrimitiveMinimality

/-!
Consolidated checkpoint
-----------------------
If this file elaborates with no proof errors, all six previously separated
machine-audit layers above survive together in one Lean environment.

No additional theorem is asserted here merely from their conjunction.
-/



/-!
UPSTREAM C0 -> FOUNDATIONAL BURDEN BRIDGE
----------------------------------------
This module addresses the remaining upstream formalization burden identified
after the first consolidated audit.

It does NOT define the foundational route as a four-item nested datatype.
It begins from lower passage semantics and machine-checks that:

  * Persistence is live under Chance / C0;
  * Boundary is live after Persistence;
  * Cascade is live after Persistence + Boundary;
  * Authorization is live after Persistence + Boundary + Cascade;
  * the declared endpoint of incorporated carried consequence requires
    Persistence, Boundary, Cascade, and Authorization;
  * removing any one of those capacities blocks that endpoint.

The arrows therefore remain prerequisite / burden-opening relations rather
than deterministic production rules.
-/

namespace C0Bridge

/-- Lower semantic vocabulary for one candidate foundational passage. -/
structure World (Extra : Type u) where
  /- Primitive / Chance-facing facts -/
  interactionPermitted : Prop
  interactionOccurs : Prop
  retryPermitted : Prop
  persistenceGuaranteed : Prop
  outcomePreferred : Prop
  extraPrimitive : Extra → Prop

  /- Passage facts below hinge naming -/
  differenceProduced : Prop
  retainedBeyondProduction : Prop
  operativeRelationalCut : Prop
  discriminatedUnderCut : Prop
  distinctFurtherInteraction : Prop
  inheritedAsInput : Prop
  boundedCarrier : Prop
  carrierConditionChanged : Prop
  postUpdateHeldWithoutPresentation : Prop

/-- C0 / Chance at the scope needed for the foundational bridge. -/
def Chance {Extra : Type u} (w : World Extra) : Prop :=
  w.interactionPermitted
  ∧ w.interactionOccurs
  ∧ w.retryPermitted
  ∧ ¬ w.persistenceGuaranteed
  ∧ ¬ w.outcomePreferred
  ∧ ∀ e : Extra, ¬ w.extraPrimitive e

/-
The four capacities are defined from lower semantic passage facts.
They are intentionally NOT nested definitions.
-/

/-- Persistence capacity: interaction-produced difference remains available. -/
def Persistence {Extra : Type u} (w : World Extra) : Prop :=
  w.differenceProduced ∧ w.retainedBeyondProduction

/-- Boundary capacity: retained carry is discriminated through an operative cut. -/
def Boundary {Extra : Type u} (w : World Extra) : Prop :=
  w.retainedBeyondProduction
  ∧ w.operativeRelationalCut
  ∧ w.discriminatedUnderCut

/-- Cascade capacity: a produced update becomes inherited input to a distinct
    further interaction. -/
def Cascade {Extra : Type u} (w : World Extra) : Prop :=
  w.differenceProduced
  ∧ w.distinctFurtherInteraction
  ∧ w.inheritedAsInput

/-- Authorization capacity: inherited update changes the bounded carrier-
    supported condition and the post-update condition remains supplied without
    continued active presentation merely to keep it so. -/
def Authorization {Extra : Type u} (w : World Extra) : Prop :=
  w.inheritedAsInput
  ∧ w.boundedCarrier
  ∧ w.carrierConditionChanged
  ∧ w.postUpdateHeldWithoutPresentation

/-- The Closure Card's declared foundational target, stated at the lower
    semantic vocabulary rather than by saying "P ∧ B ∧ C ∧ A". -/
def IncorporatedCarriedConsequence {Extra : Type u} (w : World Extra) : Prop :=
  w.differenceProduced
  ∧ w.retainedBeyondProduction
  ∧ w.operativeRelationalCut
  ∧ w.discriminatedUnderCut
  ∧ w.distinctFurtherInteraction
  ∧ w.inheritedAsInput
  ∧ w.boundedCarrier
  ∧ w.carrierConditionChanged
  ∧ w.postUpdateHeldWithoutPresentation

/-- A capacity is live under C0 when C0-compatible success and failure
    witnesses both exist. -/
def LiveUnderChance {Extra : Type u}
    (cap : World Extra → Prop) : Prop :=
  (∃ w : World Extra, Chance w ∧ cap w)
  ∧
  (∃ w : World Extra, Chance w ∧ ¬ cap w)

/-- Given prior successful jobs, the next job is live when both a success
    continuation and a prior-success/current-failure continuation exist under
    the same primitive grammar. -/
def LiveAfter {Extra : Type u}
    (prior next : World Extra → Prop) : Prop :=
  (∃ w : World Extra, Chance w ∧ prior w ∧ next w)
  ∧
  (∃ w : World Extra, Chance w ∧ prior w ∧ ¬ next w)

/-
Canonical separating witnesses.
These are logical models of the declared semantics, not claims that every
physical system literally has Boolean-valued fields.
-/

def eventOnly (Extra : Type u) : World Extra where
  interactionPermitted := True
  interactionOccurs := True
  retryPermitted := True
  persistenceGuaranteed := False
  outcomePreferred := False
  extraPrimitive := fun _ => False

  differenceProduced := True
  retainedBeyondProduction := False
  operativeRelationalCut := False
  discriminatedUnderCut := False
  distinctFurtherInteraction := False
  inheritedAsInput := False
  boundedCarrier := False
  carrierConditionChanged := False
  postUpdateHeldWithoutPresentation := False

def persistenceOnly (Extra : Type u) : World Extra where
  interactionPermitted := True
  interactionOccurs := True
  retryPermitted := True
  persistenceGuaranteed := False
  outcomePreferred := False
  extraPrimitive := fun _ => False

  differenceProduced := True
  retainedBeyondProduction := True
  operativeRelationalCut := False
  discriminatedUnderCut := False
  distinctFurtherInteraction := False
  inheritedAsInput := False
  boundedCarrier := False
  carrierConditionChanged := False
  postUpdateHeldWithoutPresentation := False

def persistenceBoundary (Extra : Type u) : World Extra where
  interactionPermitted := True
  interactionOccurs := True
  retryPermitted := True
  persistenceGuaranteed := False
  outcomePreferred := False
  extraPrimitive := fun _ => False

  differenceProduced := True
  retainedBeyondProduction := True
  operativeRelationalCut := True
  discriminatedUnderCut := True
  distinctFurtherInteraction := False
  inheritedAsInput := False
  boundedCarrier := False
  carrierConditionChanged := False
  postUpdateHeldWithoutPresentation := False

def persistenceBoundaryCascade (Extra : Type u) : World Extra where
  interactionPermitted := True
  interactionOccurs := True
  retryPermitted := True
  persistenceGuaranteed := False
  outcomePreferred := False
  extraPrimitive := fun _ => False

  differenceProduced := True
  retainedBeyondProduction := True
  operativeRelationalCut := True
  discriminatedUnderCut := True
  distinctFurtherInteraction := True
  inheritedAsInput := True
  boundedCarrier := True
  carrierConditionChanged := False
  postUpdateHeldWithoutPresentation := False

def fullRoute (Extra : Type u) : World Extra where
  interactionPermitted := True
  interactionOccurs := True
  retryPermitted := True
  persistenceGuaranteed := False
  outcomePreferred := False
  extraPrimitive := fun _ => False

  differenceProduced := True
  retainedBeyondProduction := True
  operativeRelationalCut := True
  discriminatedUnderCut := True
  distinctFurtherInteraction := True
  inheritedAsInput := True
  boundedCarrier := True
  carrierConditionChanged := True
  postUpdateHeldWithoutPresentation := True

/-
Basic witness facts.
-/

theorem chance_eventOnly (Extra : Type u) :
    Chance (eventOnly Extra) := by
  simp [Chance, eventOnly]

theorem chance_persistenceOnly (Extra : Type u) :
    Chance (persistenceOnly Extra) := by
  simp [Chance, persistenceOnly]

theorem chance_persistenceBoundary (Extra : Type u) :
    Chance (persistenceBoundary Extra) := by
  simp [Chance, persistenceBoundary]

theorem chance_persistenceBoundaryCascade (Extra : Type u) :
    Chance (persistenceBoundaryCascade Extra) := by
  simp [Chance, persistenceBoundaryCascade]

theorem chance_fullRoute (Extra : Type u) :
    Chance (fullRoute Extra) := by
  simp [Chance, fullRoute]

/-
C0 does not guarantee Persistence.
Persistence is therefore the first live load-bearing burden after occurrence.
-/

theorem persistence_is_live_under_chance (Extra : Type u) :
    LiveUnderChance (Persistence : World Extra → Prop) := by
  constructor
  · exact ⟨persistenceOnly Extra, chance_persistenceOnly Extra, by
      simp [Persistence, persistenceOnly]⟩
  · exact ⟨eventOnly Extra, chance_eventOnly Extra, by
      simp [Persistence, eventOnly]⟩

/-
After Persistence succeeds, Boundary is live but not guaranteed.
-/

def PriorP {Extra : Type u} (w : World Extra) : Prop :=
  Persistence w

theorem boundary_is_live_after_persistence (Extra : Type u) :
    LiveAfter (PriorP : World Extra → Prop) Boundary := by
  constructor
  · exact ⟨persistenceBoundary Extra, chance_persistenceBoundary Extra, by
      simp [PriorP, Persistence, persistenceBoundary], by
      simp [Boundary, persistenceBoundary]⟩
  · exact ⟨persistenceOnly Extra, chance_persistenceOnly Extra, by
      simp [PriorP, Persistence, persistenceOnly], by
      simp [Boundary, persistenceOnly]⟩

/-
After Persistence + Boundary succeed, Cascade is live but not guaranteed.
-/

def PriorPB {Extra : Type u} (w : World Extra) : Prop :=
  Persistence w ∧ Boundary w

theorem cascade_is_live_after_persistence_boundary (Extra : Type u) :
    LiveAfter (PriorPB : World Extra → Prop) Cascade := by
  constructor
  · exact ⟨persistenceBoundaryCascade Extra,
      chance_persistenceBoundaryCascade Extra,
      by simp [PriorPB, Persistence, Boundary, persistenceBoundaryCascade],
      by simp [Cascade, persistenceBoundaryCascade]⟩
  · exact ⟨persistenceBoundary Extra,
      chance_persistenceBoundary Extra,
      by simp [PriorPB, Persistence, Boundary, persistenceBoundary],
      by simp [Cascade, persistenceBoundary]⟩

/-
After Persistence + Boundary + Cascade succeed, Authorization is live but not
guaranteed.
-/

def PriorPBC {Extra : Type u} (w : World Extra) : Prop :=
  Persistence w ∧ Boundary w ∧ Cascade w

theorem authorization_is_live_after_persistence_boundary_cascade
    (Extra : Type u) :
    LiveAfter (PriorPBC : World Extra → Prop) Authorization := by
  constructor
  · exact ⟨fullRoute Extra,
      chance_fullRoute Extra,
      by simp [PriorPBC, Persistence, Boundary, Cascade, fullRoute],
      by simp [Authorization, fullRoute]⟩
  · exact ⟨persistenceBoundaryCascade Extra,
      chance_persistenceBoundaryCascade Extra,
      by simp [PriorPBC, Persistence, Boundary, Cascade,
        persistenceBoundaryCascade],
      by simp [Authorization, persistenceBoundaryCascade]⟩

/-
Endpoint necessity:
the foundational target requires all four capacities.
This is not because the endpoint was defined as P∧B∧C∧A; it was defined in
the lower semantic vocabulary above.
-/

theorem endpoint_requires_persistence
    {Extra : Type u} {w : World Extra}
    (h : IncorporatedCarriedConsequence w) :
    Persistence w := by
  exact ⟨h.1, h.2.1⟩

theorem endpoint_requires_boundary
    {Extra : Type u} {w : World Extra}
    (h : IncorporatedCarriedConsequence w) :
    Boundary w := by
  exact ⟨h.2.1, h.2.2.1, h.2.2.2.1⟩

theorem endpoint_requires_cascade
    {Extra : Type u} {w : World Extra}
    (h : IncorporatedCarriedConsequence w) :
    Cascade w := by
  exact ⟨h.1, h.2.2.2.2.1, h.2.2.2.2.2.1⟩

theorem endpoint_requires_authorization
    {Extra : Type u} {w : World Extra}
    (h : IncorporatedCarriedConsequence w) :
    Authorization w := by
  exact ⟨h.2.2.2.2.2.1,
    h.2.2.2.2.2.2.1,
    h.2.2.2.2.2.2.2.1,
    h.2.2.2.2.2.2.2.2⟩

theorem endpoint_requires_all_four
    {Extra : Type u} {w : World Extra}
    (h : IncorporatedCarriedConsequence w) :
    Persistence w ∧ Boundary w ∧ Cascade w ∧ Authorization w := by
  exact ⟨
    endpoint_requires_persistence h,
    endpoint_requires_boundary h,
    endpoint_requires_cascade h,
    endpoint_requires_authorization h
  ⟩

/-
Removal form:
if any one necessary capacity is absent, the declared endpoint cannot hold.
-/

theorem no_endpoint_without_persistence
    {Extra : Type u} {w : World Extra}
    (hNo : ¬ Persistence w) :
    ¬ IncorporatedCarriedConsequence w := by
  intro hEnd
  exact hNo (endpoint_requires_persistence hEnd)

theorem no_endpoint_without_boundary
    {Extra : Type u} {w : World Extra}
    (hNo : ¬ Boundary w) :
    ¬ IncorporatedCarriedConsequence w := by
  intro hEnd
  exact hNo (endpoint_requires_boundary hEnd)

theorem no_endpoint_without_cascade
    {Extra : Type u} {w : World Extra}
    (hNo : ¬ Cascade w) :
    ¬ IncorporatedCarriedConsequence w := by
  intro hEnd
  exact hNo (endpoint_requires_cascade hEnd)

theorem no_endpoint_without_authorization
    {Extra : Type u} {w : World Extra}
    (hNo : ¬ Authorization w) :
    ¬ IncorporatedCarriedConsequence w := by
  intro hEnd
  exact hNo (endpoint_requires_authorization hEnd)

/-
The successful route is coherent with C0 and reaches the target.
This prevents the burden architecture from being vacuous.
-/

theorem fullRoute_reaches_endpoint (Extra : Type u) :
    Chance (fullRoute Extra)
    ∧ IncorporatedCarriedConsequence (fullRoute Extra) := by
  constructor
  · exact chance_fullRoute Extra
  · simp [IncorporatedCarriedConsequence, fullRoute]

/-
Consolidated upstream bridge.

This is the formal version of the TOE's non-guarantee grammar:
  C0 does not dictate later success.
  It makes Persistence live.
  Persistence success leaves Boundary live.
  P+B success leaves Cascade live.
  P+B+C success leaves Authorization live.
  The declared endpoint requires all four jobs.

The theorem deliberately does NOT claim that any one successful stage produces
the next.
-/

theorem c0_to_foundational_burden_bridge (Extra : Type u) :
    LiveUnderChance (Persistence : World Extra → Prop)
    ∧ LiveAfter (PriorP : World Extra → Prop) Boundary
    ∧ LiveAfter (PriorPB : World Extra → Prop) Cascade
    ∧ LiveAfter (PriorPBC : World Extra → Prop) Authorization
    ∧ (∀ w : World Extra,
        IncorporatedCarriedConsequence w →
        Persistence w ∧ Boundary w ∧ Cascade w ∧ Authorization w) := by
  exact ⟨
    persistence_is_live_under_chance Extra,
    boundary_is_live_after_persistence Extra,
    cascade_is_live_after_persistence_boundary Extra,
    authorization_is_live_after_persistence_boundary_cascade Extra,
    by
      intro w h
      exact endpoint_requires_all_four h
  ⟩

end C0Bridge



/-!
POST-AUTHORIZATION ANSWERABILITY — CLEAN STANDALONE IMPORT
----------------------------------------------------------
Source: SF_PAA_Kernel_v0.2.lean
Status before consolidation: clean Lean pass, run twice.

PAA remains a corollary / validity guard, not a hinge.
-/

namespace PAA

/-- Minimal record extracted from a successful Authorization passage:
    the carrier-supported condition changed from `pre` to `post`. -/
structure AuthorizationRecord (State : Type u) where
  pre : State
  post : State
  changed : post ≠ pre

/-- One lawfully accounted successor passage. This relation is deliberately
    uninterpreted: a domain may supply its own lawful successor mechanism. -/
abbrev Successor (State : Type u) := State → State → Prop

/-- Reflexive-transitive closure of accounted successor passage.
    No metric time, clock, or duration is introduced. -/
inductive AccountedReachable {State : Type u}
    (step : Successor State) : State → State → Prop
  | refl (s : State) : AccountedReachable step s s
  | tail {a b c : State} :
      AccountedReachable step a b →
      step b c →
      AccountedReachable step a c

/-- A purported continuation names the condition from which it claims to
    continue the authorized lineage. Other claim content is intentionally
    outside PAA's universal minimum. -/
structure ContinuationClaim (State : Type u) where
  source : State

/-- The PAA source guard: a claimed continuation source must lie on an
    explicitly accounted lineage beginning at the authorized post-state. -/
def SourceValid {State : Type u}
    (a : AuthorizationRecord State)
    (step : Successor State)
    (c : ContinuationClaim State) : Prop :=
  AccountedReachable step a.post c.source

/-- PAA constrains an arbitrary warrant relation.
    It says only: whatever is warranted as a continuation must satisfy the
    source-lineage guard.

    It does NOT say every source-valid claim is warranted. -/
def RespectsPAA {State : Type u}
    (a : AuthorizationRecord State)
    (step : Successor State)
    (Warrant : ContinuationClaim State → Prop) : Prop :=
  ∀ c, Warrant c → SourceValid a step c

/-- A free reset is a warranted claim sourced from the pre-Authorization
    condition even though no accounted lineage returns from the post-state to
    that pre-state. -/
def FreeResetViolation {State : Type u}
    (a : AuthorizationRecord State)
    (step : Successor State)
    (Warrant : ContinuationClaim State → Prop) : Prop :=
  ∃ c : ContinuationClaim State,
    Warrant c
    ∧ c.source = a.pre
    ∧ ¬ AccountedReachable step a.post a.pre

/-- PAA excludes a free reset. -/
theorem paa_excludes_free_reset
    {State : Type u}
    (a : AuthorizationRecord State)
    (step : Successor State)
    (Warrant : ContinuationClaim State → Prop)
    (hPAA : RespectsPAA a step Warrant) :
    ¬ FreeResetViolation a step Warrant := by
  intro h
  rcases h with ⟨c, hW, hSource, hNoReturn⟩
  have hValid : SourceValid a step c := hPAA c hW
  unfold SourceValid at hValid
  rw [hSource] at hValid
  exact hNoReturn hValid

/-- Directly sourcing from the authorized post-state satisfies the source
    guard without requiring another successor passage. -/
theorem post_state_is_source_valid
    {State : Type u}
    (a : AuthorizationRecord State)
    (step : Successor State) :
    SourceValid a step ⟨a.post⟩ := by
  exact AccountedReachable.refl a.post

/-- Any directly accounted successor of the authorized post-state satisfies
    the source guard. -/
theorem direct_successor_is_source_valid
    {State : Type u}
    (a : AuthorizationRecord State)
    (step : Successor State)
    {q : State}
    (hStep : step a.post q) :
    SourceValid a step ⟨q⟩ := by
  exact AccountedReachable.tail
    (AccountedReachable.refl a.post) hStep

/-- Any transitively accounted successor is source-valid. -/
theorem accounted_successor_is_source_valid
    {State : Type u}
    (a : AuthorizationRecord State)
    (step : Successor State)
    {q : State}
    (hReach : AccountedReachable step a.post q) :
    SourceValid a step ⟨q⟩ := by
  exact hReach

/-- Exact-source warrant is a convenient probe relation for independence
    tests. -/
def ExactSourceWarrant {State : Type u}
    (q : State) : ContinuationClaim State → Prop :=
  fun c => c.source = q

/-- If a source is accounted-reachable, warranting only claims sourced there
    respects PAA. -/
theorem exact_valid_source_respects_paa
    {State : Type u}
    (a : AuthorizationRecord State)
    (step : Successor State)
    {q : State}
    (hReach : AccountedReachable step a.post q) :
    RespectsPAA a step (ExactSourceWarrant q) := by
  intro c hW
  unfold ExactSourceWarrant at hW
  unfold SourceValid
  rw [hW]
  exact hReach

/-- PAA does not require continuation. A warrant relation that warrants no
    continuation claims satisfies PAA. -/
theorem no_continuation_required
    {State : Type u}
    (a : AuthorizationRecord State)
    (step : Successor State) :
    RespectsPAA a step (fun _ => False) := by
  intro c h
  contradiction

/-- PAA does not prohibit a lawful return to the pre-Authorization condition.
    If an accounted path returns there, a claim sourced there may pass the PAA
    source guard. This blocks an irreversibility reading. -/
theorem lawful_return_to_pre_is_permitted
    {State : Type u}
    (a : AuthorizationRecord State)
    (step : Successor State)
    (hReturn : AccountedReachable step a.post a.pre) :
    RespectsPAA a step (ExactSourceWarrant a.pre) := by
  exact exact_valid_source_respects_paa a step hReturn

/-- A free-reset source is not PAA-compatible when no accounted path returns
    from the authorized post-state to the pre-state. -/
theorem unaccounted_return_to_pre_defeats_paa
    {State : Type u}
    (a : AuthorizationRecord State)
    (step : Successor State)
    (hNoReturn : ¬ AccountedReachable step a.post a.pre) :
    ¬ RespectsPAA a step (ExactSourceWarrant a.pre) := by
  intro hPAA
  let c : ContinuationClaim State := ⟨a.pre⟩
  have hW : ExactSourceWarrant a.pre c := by
    rfl
  have hValid : SourceValid a step c := hPAA c hW
  exact hNoReturn hValid

/-- PAA can leave more than one distinct continuation source admissible.
    It therefore does not select a unique future. -/
theorem multiple_successor_sources_permitted
    {State : Type u}
    (a : AuthorizationRecord State)
    (step : Successor State)
    {q₁ q₂ : State}
    (h₁ : AccountedReachable step a.post q₁)
    (h₂ : AccountedReachable step a.post q₂) :
    RespectsPAA a step
      (fun c => c.source = q₁ ∨ c.source = q₂) := by
  intro c hW
  rcases hW with hLeft | hRight
  · unfold SourceValid
    rw [hLeft]
    exact h₁
  · unfold SourceValid
    rw [hRight]
    exact h₂

/-- PAA does not conserve an arbitrary state-property.
    If an accounted successor `q` lacks a property held by the authorized
    post-state, warranting `q` can still respect PAA. -/
theorem property_loss_is_compatible_with_paa
    {State : Type u}
    (a : AuthorizationRecord State)
    (step : Successor State)
    (Property : State → Prop)
    {q : State}
    (hReach : AccountedReachable step a.post q)
    (_hPost : Property a.post)
    (_hLost : ¬ Property q) :
    RespectsPAA a step (ExactSourceWarrant q) := by
  exact exact_valid_source_respects_paa a step hReach

/-- PAA does not require identity with the authorized post-state.
    A distinct accounted successor may be the source of a PAA-compatible
    continuation. -/
theorem changed_successor_is_compatible_with_paa
    {State : Type u}
    (a : AuthorizationRecord State)
    (step : Successor State)
    {q : State}
    (_hChangedAgain : q ≠ a.post)
    (hReach : AccountedReachable step a.post q) :
    RespectsPAA a step (ExactSourceWarrant q) := by
  exact exact_valid_source_respects_paa a step hReach

/-- The maximal set admitted by the PAA source-lineage guard.
    Calling it "maximal" here does NOT mean PAA warrants all of these claims;
    it means no PAA-respecting warrant may include a claim outside this set. -/
def LineageAdmissible {State : Type u}
    (a : AuthorizationRecord State)
    (step : Successor State) :
    ContinuationClaim State → Prop :=
  fun c => SourceValid a step c

/-- The source guard itself respects PAA. -/
theorem lineage_admissible_respects_paa
    {State : Type u}
    (a : AuthorizationRecord State)
    (step : Successor State) :
    RespectsPAA a step (LineageAdmissible a step) := by
  intro c h
  exact h

/-- Every PAA-respecting warrant relation is pointwise contained in the
    lineage-admissible set. This is the precise guard-only result:
    source-validity is necessary, not sufficient, for warrant. -/
theorem every_paa_warrant_is_lineage_admissible
    {State : Type u}
    (a : AuthorizationRecord State)
    (step : Successor State)
    (Warrant : ContinuationClaim State → Prop)
    (hPAA : RespectsPAA a step Warrant) :
    ∀ c, Warrant c → LineageAdmissible a step c := by
  intro c hW
  exact hPAA c hW

/-- Authorization's changed post-state does not make every later continuation
    assertion valid. If no accounted path returns to `pre`, the "continue from
    pre anyway" warrant violates PAA while the Authorization record itself
    remains intact. -/
theorem authorization_does_not_warrant_free_reset
    {State : Type u}
    (a : AuthorizationRecord State)
    (step : Successor State)
    (hNoReturn : ¬ AccountedReachable step a.post a.pre) :
    ¬ RespectsPAA a step (ExactSourceWarrant a.pre) := by
  exact unaccounted_return_to_pre_defeats_paa a step hNoReturn

/-- Consolidated PAA audit result. -/
theorem paa_machine_closure
    {State : Type u}
    (a : AuthorizationRecord State)
    (step : Successor State) :
    RespectsPAA a step (fun _ => False)
    ∧ SourceValid a step ⟨a.post⟩
    ∧ (∀ (Warrant : ContinuationClaim State → Prop),
        RespectsPAA a step Warrant →
        ∀ c, Warrant c → LineageAdmissible a step c) := by
  exact ⟨
    no_continuation_required a step,
    post_state_is_source_valid a step,
    by
      intro Warrant hPAA c hW
      exact every_paa_warrant_is_lineage_admissible
        a step Warrant hPAA c hW
  ⟩

end PAA

/-!
RECOGNITION — CLEAN STANDALONE IMPORT
-------------------------------------
Source: SF_Recognition_Kernel_v0.3.lean
Status before consolidation: clean Lean pass, run twice.

Recognition is downstream of Authorization and distinct from PAA.
-/

namespace Recognition

/-
Minimal PAA-compatible lineage vocabulary.
This is not a re-proof of the PAA kernel; it is only enough to keep source
lineage available as an upstream condition while testing Recognition.
-/

abbrev Successor (State : Type u) := State → State → Prop

inductive AccountedReachable {State : Type u}
    (step : Successor State) : State → State → Prop
  | refl (s : State) : AccountedReachable step s s
  | tail {a b c : State} :
      AccountedReachable step a b →
      step b c →
      AccountedReachable step a c

/-- Lower-semantic world for one declared Recognition task. -/
structure World
    (State Surface Content Presentation : Type u) where
  /- successful Authorization anchor -/
  pre : State
  post : State
  changed : post ≠ pre

  /- PAA-compatible source-lineage probe -/
  successor : Successor State
  continuationSource : State

  /- authorized binding at the origin -/
  content : Content
  origin : Surface
  target : Surface
  sourcePresentation : Presentation
  targetPresentation : Presentation

  /- lower local semantics -/
  located : Surface → Presentation → Prop
  binds : Presentation → Content → Prop
  lawfulVariation : Surface → Surface → Prop
  transport : Surface → Surface → Presentation → Presentation → Prop

  /- placeholder used only for a preliminary Recognition/Coherence
     anti-collapse witness; full Coherence semantics are NOT defined here. -/
  wholeHeld : Prop

/-- The authorized content is present as a binding at the origin surface. -/
def AuthorizedAtOrigin
    {State Surface Content Presentation : Type u}
    (w : World State Surface Content Presentation) : Prop :=
  w.located w.origin w.sourcePresentation
  ∧ w.binds w.sourcePresentation w.content

/-- Minimal upstream PAA source-lineage compatibility for the probe claim. -/
def PAACompatible
    {State Surface Content Presentation : Type u}
    (w : World State Surface Content Presentation) : Prop :=
  AccountedReachable w.successor w.post w.continuationSource

/-- Recognition capacity at one declared local-variation task.
    It is intentionally stated from lower semantics rather than as
    "same content" by name alone. -/
def Recognizes
    {State Surface Content Presentation : Type u}
    (w : World State Surface Content Presentation) : Prop :=
  w.origin ≠ w.target
  ∧ w.lawfulVariation w.origin w.target
  ∧ w.located w.target w.targetPresentation
  ∧ w.transport
      w.origin w.target w.sourcePresentation w.targetPresentation
  ∧ w.binds w.targetPresentation w.content

/-- Upstream condition before the Recognition burden is discharged. -/
def UpstreamReady
    {State Surface Content Presentation : Type u}
    (w : World State Surface Content Presentation) : Prop :=
  AuthorizedAtOrigin w ∧ PAACompatible w

/-- The declared endpoint, stated in lower semantics rather than by naming
    Recognition. -/
def SameBindingTransportEndpoint
    {State Surface Content Presentation : Type u}
    (w : World State Surface Content Presentation) : Prop :=
  AuthorizedAtOrigin w
  ∧ (
      w.origin ≠ w.target
      ∧ w.lawfulVariation w.origin w.target
      ∧ w.located w.target w.targetPresentation
      ∧ w.transport
          w.origin w.target w.sourcePresentation w.targetPresentation
      ∧ w.binds w.targetPresentation w.content
    )

/-- Generic liveness test: the prior condition admits both success and failure
    of the next burden. -/
def LiveAfter {α : Type u}
    (prior next : α → Prop) : Prop :=
  (∃ x, prior x ∧ next x)
  ∧
  (∃ x, prior x ∧ ¬ next x)

/-
Finite witness vocabulary.
-/

inductive TestState
  | pre
  | post

inductive TestSurface
  | origin
  | target

inductive TestContent
  | alpha
  | beta

inductive TestPresentation
  | source
  | target

abbrev TestWorld :=
  World TestState TestSurface TestContent TestPresentation

def noStep : Successor TestState :=
  fun _ _ => False

def locatedBoth : TestSurface → TestPresentation → Prop
  | .origin, .source => True
  | .target, .target => True
  | _, _ => False

def lawfulLocalVariation : TestSurface → TestSurface → Prop
  | .origin, .target => True
  | _, _ => False

def transportSourceToTarget :
    TestSurface → TestSurface →
    TestPresentation → TestPresentation → Prop
  | .origin, .target, .source, .target => True
  | _, _, _, _ => False

def noTransport :
    TestSurface → TestSurface →
    TestPresentation → TestPresentation → Prop :=
  fun _ _ _ _ => False

/-- Same binding content under two distinct local presentations. -/
def sameBinding :
    TestPresentation → TestContent → Prop
  | .source, .alpha => True
  | .target, .alpha => True
  | _, _ => False

/-- Binding identity drifts at the target presentation. -/
def driftBinding :
    TestPresentation → TestContent → Prop
  | .source, .alpha => True
  | .target, .beta => True
  | _, _ => False

def recognitionSuccess :
    World TestState TestSurface TestContent TestPresentation where
  pre := .pre
  post := .post
  changed := by simp
  successor := noStep
  continuationSource := .post
  content := .alpha
  origin := .origin
  target := .target
  sourcePresentation := .source
  targetPresentation := .target
  located := locatedBoth
  binds := sameBinding
  lawfulVariation := lawfulLocalVariation
  transport := transportSourceToTarget
  wholeHeld := False

/-- Identity candidate survives locally, but lawful carry/comparison is absent. -/
def transportFailure :
    World TestState TestSurface TestContent TestPresentation where
  pre := .pre
  post := .post
  changed := by simp
  successor := noStep
  continuationSource := .post
  content := .alpha
  origin := .origin
  target := .target
  sourcePresentation := .source
  targetPresentation := .target
  located := locatedBoth
  binds := sameBinding
  lawfulVariation := lawfulLocalVariation
  transport := noTransport
  wholeHeld := False

/-- Carry/comparison exists, but target binding identity has drifted. -/
def identityDrift :
    World TestState TestSurface TestContent TestPresentation where
  pre := .pre
  post := .post
  changed := by simp
  successor := noStep
  continuationSource := .post
  content := .alpha
  origin := .origin
  target := .target
  sourcePresentation := .source
  targetPresentation := .target
  located := locatedBoth
  binds := driftBinding
  lawfulVariation := lawfulLocalVariation
  transport := transportSourceToTarget
  wholeHeld := False

/-
Upstream readiness facts.
-/

theorem success_authorized :
    AuthorizedAtOrigin recognitionSuccess := by
  simp [AuthorizedAtOrigin, recognitionSuccess, locatedBoth, sameBinding]

theorem transportFailure_authorized :
    AuthorizedAtOrigin transportFailure := by
  simp [AuthorizedAtOrigin, transportFailure, locatedBoth, sameBinding]

theorem identityDrift_authorized :
    AuthorizedAtOrigin identityDrift := by
  simp [AuthorizedAtOrigin, identityDrift, locatedBoth, driftBinding]

theorem success_paa_compatible :
    PAACompatible recognitionSuccess := by
  unfold PAACompatible
  exact AccountedReachable.refl TestState.post

theorem transportFailure_paa_compatible :
    PAACompatible transportFailure := by
  unfold PAACompatible
  exact AccountedReachable.refl TestState.post

theorem identityDrift_paa_compatible :
    PAACompatible identityDrift := by
  unfold PAACompatible
  exact AccountedReachable.refl TestState.post

theorem success_upstream_ready :
    UpstreamReady recognitionSuccess := by
  exact ⟨success_authorized, success_paa_compatible⟩

theorem transportFailure_upstream_ready :
    UpstreamReady transportFailure := by
  exact ⟨transportFailure_authorized, transportFailure_paa_compatible⟩

theorem identityDrift_upstream_ready :
    UpstreamReady identityDrift := by
  exact ⟨identityDrift_authorized, identityDrift_paa_compatible⟩

/-
Recognition success and the two dual failures.
-/

theorem recognitionSuccess_recognizes :
    Recognizes recognitionSuccess := by
  simp [Recognizes, recognitionSuccess, lawfulLocalVariation,
    locatedBoth, transportSourceToTarget, sameBinding]

theorem transportFailure_does_not_recognize :
    ¬ Recognizes transportFailure := by
  simp [Recognizes, transportFailure, lawfulLocalVariation,
    locatedBoth, noTransport, sameBinding]

theorem identityDrift_does_not_recognize :
    ¬ Recognizes identityDrift := by
  simp [Recognizes, identityDrift, lawfulLocalVariation,
    locatedBoth, transportSourceToTarget, driftBinding]

/-- Recognition is live after Authorization with PAA-compatible lineage:
    upstream success leaves both Recognition success and Recognition failure
    available. -/
theorem recognition_is_live_after_upstream :
    LiveAfter
      (UpstreamReady : TestWorld → Prop)
      (Recognizes : TestWorld → Prop) := by
  constructor
  · exact ⟨recognitionSuccess,
      success_upstream_ready,
      recognitionSuccess_recognizes⟩
  · exact ⟨transportFailure,
      transportFailure_upstream_ready,
      transportFailure_does_not_recognize⟩

/-- Authorization plus PAA compatibility does not entail Recognition. -/
theorem authorization_paa_do_not_entail_recognition :
    ∃ w : TestWorld,
      UpstreamReady w ∧ ¬ Recognizes w := by
  exact ⟨transportFailure,
    transportFailure_upstream_ready,
    transportFailure_does_not_recognize⟩

/-
Endpoint necessity.
-/

theorem endpoint_requires_authorized_origin
    {State Surface Content Presentation : Type u}
    {w : World State Surface Content Presentation}
    (h : SameBindingTransportEndpoint w) :
    AuthorizedAtOrigin w := by
  exact h.1

theorem endpoint_requires_recognition
    {State Surface Content Presentation : Type u}
    {w : World State Surface Content Presentation}
    (h : SameBindingTransportEndpoint w) :
    Recognizes w := by
  exact h.2

theorem recognized_authorized_content_reaches_endpoint
    {State Surface Content Presentation : Type u}
    {w : World State Surface Content Presentation}
    (hA : AuthorizedAtOrigin w)
    (hR : Recognizes w) :
    SameBindingTransportEndpoint w := by
  exact ⟨hA, hR⟩

/-
Removal tests.
-/

theorem no_endpoint_without_transport
    {State Surface Content Presentation : Type u}
    {w : World State Surface Content Presentation}
    (hNo :
      ¬ w.transport
          w.origin w.target w.sourcePresentation w.targetPresentation) :
    ¬ SameBindingTransportEndpoint w := by
  intro hEnd
  have hR : Recognizes w := endpoint_requires_recognition hEnd
  rcases hR with ⟨_hDistinct, _hVariation, _hLocated, hTransport, _hBinding⟩
  exact hNo hTransport

theorem no_endpoint_without_target_same_binding
    {State Surface Content Presentation : Type u}
    {w : World State Surface Content Presentation}
    (hNo : ¬ w.binds w.targetPresentation w.content) :
    ¬ SameBindingTransportEndpoint w := by
  intro hEnd
  have hR : Recognizes w := endpoint_requires_recognition hEnd
  rcases hR with ⟨_hDistinct, _hVariation, _hLocated, _hTransport, hBinding⟩
  exact hNo hBinding

theorem no_endpoint_without_lawful_variation
    {State Surface Content Presentation : Type u}
    {w : World State Surface Content Presentation}
    (hNo : ¬ w.lawfulVariation w.origin w.target) :
    ¬ SameBindingTransportEndpoint w := by
  intro hEnd
  have hR : Recognizes w := endpoint_requires_recognition hEnd
  rcases hR with ⟨_hDistinct, hVariation, _hLocated, _hTransport, _hBinding⟩
  exact hNo hVariation

/-
Anti-collapse and duality witnesses.
-/

/-- Recognition does not require literal equality of local presentations. -/
theorem recognition_allows_distinct_presentations :
    Recognizes recognitionSuccess
    ∧ recognitionSuccess.sourcePresentation
        ≠ recognitionSuccess.targetPresentation := by
  constructor
  · exact recognitionSuccess_recognizes
  · simp [recognitionSuccess]

/-- The capacity-face is independent: same target binding can remain available
    while Recognition fails because no lawful transport/comparison exists. -/
theorem same_binding_without_transport_is_not_recognition :
    transportFailure.binds
      transportFailure.targetPresentation transportFailure.content
    ∧ ¬ Recognizes transportFailure := by
  constructor
  · simp [transportFailure, sameBinding]
  · exact transportFailure_does_not_recognize

/-- The constraint-face is independent: lawful transport/comparison can exist
    while Recognition fails because the target presentation binds different
    content. -/
theorem transport_without_same_binding_is_not_recognition :
    identityDrift.transport
      identityDrift.origin identityDrift.target
      identityDrift.sourcePresentation identityDrift.targetPresentation
    ∧ ¬ Recognizes identityDrift := by
  constructor
  · simp [identityDrift, transportSourceToTarget]
  · exact identityDrift_does_not_recognize

/-- Preliminary anti-collapse sentinel only:
    Recognition success does not itself assert whole-system unity.
    Full Coherence semantics will be defined in the Coherence kernel. -/
theorem recognition_does_not_by_itself_establish_whole_hold :
    Recognizes recognitionSuccess
    ∧ ¬ recognitionSuccess.wholeHeld := by
  constructor
  · exact recognitionSuccess_recognizes
  · simp [recognitionSuccess]

/-- Consolidated Recognition audit. -/
theorem recognition_machine_closure :
    LiveAfter
      (UpstreamReady : TestWorld → Prop)
      (Recognizes : TestWorld → Prop)
    ∧ SameBindingTransportEndpoint recognitionSuccess
    ∧ (∃ w : TestWorld,
        UpstreamReady w ∧ ¬ Recognizes w)
    ∧ (Recognizes recognitionSuccess
        ∧ recognitionSuccess.sourcePresentation
            ≠ recognitionSuccess.targetPresentation) := by
  constructor
  · exact recognition_is_live_after_upstream
  constructor
  · exact recognized_authorized_content_reaches_endpoint
      success_authorized recognitionSuccess_recognizes
  constructor
  · exact authorization_paa_do_not_entail_recognition
  · exact recognition_allows_distinct_presentations

end Recognition

/-!
COHERENCE — CLEAN STANDALONE IMPORT
-----------------------------------
Source: SF_Coherence_Kernel_v0.1.lean
Status before consolidation: clean Lean pass, run twice.

Coherence is downstream of Recognition and does not import domain-specific
stationary-action, isotropy, or sphere realizers into the universal minimum.
-/

namespace Coherence

/-- Lower-semantic world for one declared Coherence task. -/
structure World
    (Piece Whole Invariant : Type u) where
  local₁ : Piece
  local₂ : Piece

  recognized : Piece → Prop
  compatible : Piece → Piece → Prop

  candidateWhole : Whole
  fits : Whole → Piece → Prop
  heldAsOne : Whole → Prop

  carriesInvariant : Piece → Invariant → Prop
  wholeOwnsInvariant : Whole → Invariant → Prop

/-- Upstream condition: distinct local pieces are already recognized and
    mutually compatible. This deliberately gives compatibility every benefit
    before the Coherence burden is asked. -/
def RecognizedCompatible
    {Piece Whole Invariant : Type u}
    (w : World Piece Whole Invariant) : Prop :=
  w.local₁ ≠ w.local₂
  ∧ w.recognized w.local₁
  ∧ w.recognized w.local₂
  ∧ w.compatible w.local₁ w.local₂
  ∧ w.compatible w.local₂ w.local₁

/-- Constraint-face component: the admitted local pieces fit the same
    candidate whole. -/
def GlobalFit
    {Piece Whole Invariant : Type u}
    (w : World Piece Whole Invariant) : Prop :=
  w.fits w.candidateWhole w.local₁
  ∧ w.fits w.candidateWhole w.local₂

/-- Shared-invariant component:
    at least one invariant is carried by both local pieces and owned by the
    same candidate whole. -/
def SharedInvariant
    {Piece Whole Invariant : Type u}
    (w : World Piece Whole Invariant) : Prop :=
  ∃ i : Invariant,
    w.carriesInvariant w.local₁ i
    ∧ w.carriesInvariant w.local₂ i
    ∧ w.wholeOwnsInvariant w.candidateWhole i

/-- Universal Coherence minimum. -/
def Coheres
    {Piece Whole Invariant : Type u}
    (w : World Piece Whole Invariant) : Prop :=
  w.heldAsOne w.candidateWhole
  ∧ GlobalFit w
  ∧ SharedInvariant w

/-- Endpoint stated in lower semantics rather than as "Recognized ∧ Coheres"
    by definition alone. -/
def JointWholeHoldEndpoint
    {Piece Whole Invariant : Type u}
    (w : World Piece Whole Invariant) : Prop :=
  RecognizedCompatible w
  ∧ w.heldAsOne w.candidateWhole
  ∧ w.fits w.candidateWhole w.local₁
  ∧ w.fits w.candidateWhole w.local₂
  ∧ ∃ i : Invariant,
      w.carriesInvariant w.local₁ i
      ∧ w.carriesInvariant w.local₂ i
      ∧ w.wholeOwnsInvariant w.candidateWhole i

/-- Generic burden liveness after an upstream condition. -/
def LiveAfter {α : Type u}
    (prior next : α → Prop) : Prop :=
  (∃ x, prior x ∧ next x)
  ∧
  (∃ x, prior x ∧ ¬ next x)

/-
Finite witness vocabulary.
-/

inductive TestPiece
  | left
  | right

inductive TestWhole
  | omega

inductive TestInvariant
  | shared
  | leftOnly
  | rightOnly

abbrev TestWorld :=
  World TestPiece TestWhole TestInvariant

def recognizedBoth : TestPiece → Prop
  | .left => True
  | .right => True

def compatiblePair : TestPiece → TestPiece → Prop
  | .left, .right => True
  | .right, .left => True
  | _, _ => False

def fitsBoth : TestWhole → TestPiece → Prop
  | .omega, .left => True
  | .omega, .right => True

def fitsLeftOnly : TestWhole → TestPiece → Prop
  | .omega, .left => True
  | .omega, .right => False

def wholeHeld : TestWhole → Prop
  | .omega => True

def wholeNotHeld : TestWhole → Prop
  | .omega => False

def sharedCarriage : TestPiece → TestInvariant → Prop
  | .left, .shared => True
  | .right, .shared => True
  | _, _ => False

def splitCarriage : TestPiece → TestInvariant → Prop
  | .left, .leftOnly => True
  | .right, .rightOnly => True
  | _, _ => False

def wholeOwnsAll : TestWhole → TestInvariant → Prop :=
  fun _ _ => True

/-- Full Coherence success. -/
def coherenceSuccess : TestWorld where
  local₁ := .left
  local₂ := .right
  recognized := recognizedBoth
  compatible := compatiblePair
  candidateWhole := .omega
  fits := fitsBoth
  heldAsOne := wholeHeld
  carriesInvariant := sharedCarriage
  wholeOwnsInvariant := wholeOwnsAll

/-- Recognition and compatibility survive; global fit and shared invariant
    survive; the capacity-face fails because no whole is held as one. -/
def fragmented : TestWorld where
  local₁ := .left
  local₂ := .right
  recognized := recognizedBoth
  compatible := compatiblePair
  candidateWhole := .omega
  fits := fitsBoth
  heldAsOne := wholeNotHeld
  carriesInvariant := sharedCarriage
  wholeOwnsInvariant := wholeOwnsAll

/-- The whole shell is held and shared invariant content exists, but one local
    piece does not fit the one global hold. -/
def fitFailure : TestWorld where
  local₁ := .left
  local₂ := .right
  recognized := recognizedBoth
  compatible := compatiblePair
  candidateWhole := .omega
  fits := fitsLeftOnly
  heldAsOne := wholeHeld
  carriesInvariant := sharedCarriage
  wholeOwnsInvariant := wholeOwnsAll

/-- Whole-hold and global fit survive, but the pieces carry disjoint invariant
    content: no invariant is genuinely shared across the whole. -/
def invariantFailure : TestWorld where
  local₁ := .left
  local₂ := .right
  recognized := recognizedBoth
  compatible := compatiblePair
  candidateWhole := .omega
  fits := fitsBoth
  heldAsOne := wholeHeld
  carriesInvariant := splitCarriage
  wholeOwnsInvariant := wholeOwnsAll

/-
Upstream readiness.
-/

theorem success_recognized_compatible :
    RecognizedCompatible coherenceSuccess := by
  simp [RecognizedCompatible, coherenceSuccess,
    recognizedBoth, compatiblePair]

theorem fragmented_recognized_compatible :
    RecognizedCompatible fragmented := by
  simp [RecognizedCompatible, fragmented,
    recognizedBoth, compatiblePair]

theorem fitFailure_recognized_compatible :
    RecognizedCompatible fitFailure := by
  simp [RecognizedCompatible, fitFailure,
    recognizedBoth, compatiblePair]

theorem invariantFailure_recognized_compatible :
    RecognizedCompatible invariantFailure := by
  simp [RecognizedCompatible, invariantFailure,
    recognizedBoth, compatiblePair]

/-
Success components.
-/

theorem success_global_fit :
    GlobalFit coherenceSuccess := by
  simp [GlobalFit, coherenceSuccess, fitsBoth]

theorem success_shared_invariant :
    SharedInvariant coherenceSuccess := by
  refine ⟨TestInvariant.shared, ?_, ?_, ?_⟩
  · simp [coherenceSuccess, sharedCarriage]
  · simp [coherenceSuccess, sharedCarriage]
  · simp [coherenceSuccess, wholeOwnsAll]

theorem coherenceSuccess_coheres :
    Coheres coherenceSuccess := by
  exact ⟨
    by simp [coherenceSuccess, wholeHeld],
    success_global_fit,
    success_shared_invariant
  ⟩

/-
Failure components.
-/

theorem fragmented_not_coherent :
    ¬ Coheres fragmented := by
  intro h
  exact (by
    simpa [fragmented, wholeNotHeld] using h.1)

theorem fitFailure_not_global_fit :
    ¬ GlobalFit fitFailure := by
  simp [GlobalFit, fitFailure, fitsLeftOnly]

theorem fitFailure_not_coherent :
    ¬ Coheres fitFailure := by
  intro h
  exact fitFailure_not_global_fit h.2.1

theorem invariantFailure_no_shared_invariant :
    ¬ SharedInvariant invariantFailure := by
  intro h
  rcases h with ⟨i, hLeft, hRight, _hOwned⟩
  cases i <;> simp [invariantFailure, splitCarriage] at hLeft hRight

theorem invariantFailure_not_coherent :
    ¬ Coheres invariantFailure := by
  intro h
  exact invariantFailure_no_shared_invariant h.2.2

/-
Recognition-ready structure does not entail Coherence.
-/

theorem coherence_is_live_after_recognized_compatible :
    LiveAfter
      (RecognizedCompatible : TestWorld → Prop)
      (Coheres : TestWorld → Prop) := by
  constructor
  · exact ⟨coherenceSuccess,
      success_recognized_compatible,
      coherenceSuccess_coheres⟩
  · exact ⟨fragmented,
      fragmented_recognized_compatible,
      fragmented_not_coherent⟩

theorem recognized_compatible_does_not_entail_coherence :
    ∃ w : TestWorld,
      RecognizedCompatible w ∧ ¬ Coheres w := by
  exact ⟨fragmented,
    fragmented_recognized_compatible,
    fragmented_not_coherent⟩

/-
Anti-collapse / load-bearing tests.
-/

/-- Pairwise compatibility plus even global fit and a shared invariant is not
    enough if the whole itself is not held as one. -/
theorem compatibility_and_fit_do_not_replace_whole_hold :
    RecognizedCompatible fragmented
    ∧ GlobalFit fragmented
    ∧ SharedInvariant fragmented
    ∧ ¬ Coheres fragmented := by
  constructor
  · exact fragmented_recognized_compatible
  constructor
  · simp [GlobalFit, fragmented, fitsBoth]
  constructor
  · refine ⟨TestInvariant.shared, ?_, ?_, ?_⟩
    · simp [fragmented, sharedCarriage]
    · simp [fragmented, sharedCarriage]
    · simp [fragmented, wholeOwnsAll]
  · exact fragmented_not_coherent

/-- Whole-hold alone does not replace the constraint-face. -/
theorem whole_hold_without_global_fit_is_not_coherence :
    fitFailure.heldAsOne fitFailure.candidateWhole
    ∧ SharedInvariant fitFailure
    ∧ ¬ Coheres fitFailure := by
  constructor
  · simp [fitFailure, wholeHeld]
  constructor
  · refine ⟨TestInvariant.shared, ?_, ?_, ?_⟩
    · simp [fitFailure, sharedCarriage]
    · simp [fitFailure, sharedCarriage]
    · simp [fitFailure, wholeOwnsAll]
  · exact fitFailure_not_coherent

/-- Whole-hold plus global fit still does not replace shared invariant content. -/
theorem whole_hold_and_fit_without_shared_invariant_is_not_coherence :
    invariantFailure.heldAsOne invariantFailure.candidateWhole
    ∧ GlobalFit invariantFailure
    ∧ ¬ SharedInvariant invariantFailure
    ∧ ¬ Coheres invariantFailure := by
  constructor
  · simp [invariantFailure, wholeHeld]
  constructor
  · simp [GlobalFit, invariantFailure, fitsBoth]
  constructor
  · exact invariantFailure_no_shared_invariant
  · exact invariantFailure_not_coherent

/-- Coherence does not collapse distinct local pieces into literal identity. -/
theorem coherence_preserves_local_distinction :
    Coheres coherenceSuccess
    ∧ coherenceSuccess.local₁ ≠ coherenceSuccess.local₂ := by
  constructor
  · exact coherenceSuccess_coheres
  · simp [coherenceSuccess]

/-
Endpoint necessity and removal.
-/

theorem endpoint_requires_recognized_compatible
    {Piece Whole Invariant : Type u}
    {w : World Piece Whole Invariant}
    (h : JointWholeHoldEndpoint w) :
    RecognizedCompatible w := by
  exact h.1

theorem endpoint_requires_coherence
    {Piece Whole Invariant : Type u}
    {w : World Piece Whole Invariant}
    (h : JointWholeHoldEndpoint w) :
    Coheres w := by
  rcases h with ⟨_hReady, hHeld, hFit1, hFit2, hShared⟩
  exact ⟨hHeld, ⟨hFit1, hFit2⟩, hShared⟩

theorem recognized_coherence_reaches_endpoint
    {Piece Whole Invariant : Type u}
    {w : World Piece Whole Invariant}
    (hReady : RecognizedCompatible w)
    (hCo : Coheres w) :
    JointWholeHoldEndpoint w := by
  rcases hCo with ⟨hHeld, hFit, hShared⟩
  exact ⟨hReady, hHeld, hFit.1, hFit.2, hShared⟩

theorem no_endpoint_without_whole_hold
    {Piece Whole Invariant : Type u}
    {w : World Piece Whole Invariant}
    (hNo : ¬ w.heldAsOne w.candidateWhole) :
    ¬ JointWholeHoldEndpoint w := by
  intro hEnd
  exact hNo hEnd.2.1

theorem no_endpoint_without_global_fit
    {Piece Whole Invariant : Type u}
    {w : World Piece Whole Invariant}
    (hNo : ¬ GlobalFit w) :
    ¬ JointWholeHoldEndpoint w := by
  intro hEnd
  have hCo : Coheres w := endpoint_requires_coherence hEnd
  exact hNo hCo.2.1

theorem no_endpoint_without_shared_invariant
    {Piece Whole Invariant : Type u}
    {w : World Piece Whole Invariant}
    (hNo : ¬ SharedInvariant w) :
    ¬ JointWholeHoldEndpoint w := by
  intro hEnd
  have hCo : Coheres w := endpoint_requires_coherence hEnd
  exact hNo hCo.2.2

/-- Success witness for the lower-semantic endpoint. -/
theorem coherenceSuccess_reaches_endpoint :
    JointWholeHoldEndpoint coherenceSuccess := by
  exact recognized_coherence_reaches_endpoint
    success_recognized_compatible coherenceSuccess_coheres

/-- Consolidated universal Coherence audit. -/
theorem coherence_machine_closure :
    LiveAfter
      (RecognizedCompatible : TestWorld → Prop)
      (Coheres : TestWorld → Prop)
    ∧ JointWholeHoldEndpoint coherenceSuccess
    ∧ (∃ w : TestWorld,
        RecognizedCompatible w ∧ ¬ Coheres w)
    ∧ (Coheres coherenceSuccess
        ∧ coherenceSuccess.local₁ ≠ coherenceSuccess.local₂) := by
  constructor
  · exact coherence_is_live_after_recognized_compatible
  constructor
  · exact coherenceSuccess_reaches_endpoint
  constructor
  · exact recognized_compatible_does_not_entail_coherence
  · exact coherence_preserves_local_distinction

end Coherence


/-!
UNIVERSAL CONSOLIDATION CHECKPOINT
----------------------------------
If this file elaborates with no proof errors, the following previously clean
layers coexist in one Lean environment:

  C0 / Chance
  -> foundational burden bridge
  -> Persistence / Boundary / Cascade / Authorization
  -> Entropy / no-free-immunity
  -> foundational first-break / five-regime closure
  -> Austerity / six-face closure / primitive minimality
  -> PAA (non-hinge continuation-validity corollary)
  -> Recognition
  -> Coherence

No new theorem is asserted merely from their conjunction. This file is a
single attack surface for the already-separated machine-audit layers.
-/

end StructuralFlow
