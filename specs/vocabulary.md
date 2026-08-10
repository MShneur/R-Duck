---
id: vocabulary
type: spec
version: "1.0"
purpose: >
  One approved word per concept, its synonyms forbidden by name. A reader with no
  back-channel cannot ask whether "verify" and "check" mean the same thing. It
  guesses, and the guess is invisible. This spec removes the guess from
  instruction text.
anti-goal: >
  Will not police prose written for people. Will not break the build on day one
  over 352 pre-existing uses. Will not grow into a style guide. Will not be
  enforced by advice — a vocabulary nobody checks is a glossary nobody reads.
---

# VOCABULARY — Controlled Terms

## SCOPE

Applies to **instruction text**: rules, triggers, protocol steps, tool
descriptions, error messages, handoff schemas.

Does **not** apply to: changelogs, README prose, rationale paragraphs, or
anything written for a person to read once. Controlled language is deliberately
flat, and flatness is wrong for explanation.

## APPROVED TERMS

One approved word per concept. Use it as the part of speech shown. Everything in
the forbidden column means the same thing and must not appear in instruction text.

| Concept | Approved | Part | Forbidden |
|---|---|---|---|
| confirm correctness | **verify** | verb | check, test, confirm, validate, ensure |
| cause to run | **trigger** | verb | run, fire, invoke, activate, execute |
| stop | **halt** | verb | stop, cease, abort, pause |
| emit to the reader | **output** | verb | state, report, say, declare, emit, return |
| acquire content | **fetch** | verb | load, read, pull, get, retrieve |
| assign a role | **choose** | verb | cast, select, assign, pick |
| write a record | **write** | verb | log, record, note, capture |
| take away | **delete** | verb | remove, drop, kill, cut, discard |
| obligation | **must** | modal | require, need |
| prohibition | **never** | adverb | forbid, prohibit, disallow |

Project-coined tokens are exempt and always preferred over a common word that
already means something else: `RRed`, `cleanerz`, `quorum`, `human gate`.
A coined token routes to exactly one place. A common word competes with every
other use of it.

## HOW THESE WERE CHOSEN

Derived from this repository's own text, not adopted from an external dictionary.

```
ambiguity   = WordNet sense count for the word
entrenchment = how often the word already appears in this corpus
score        = log(1+senses) − 0.55·log(1+frequency)      lower wins
```

Ambiguity is the cost, entrenchment is the offset, and the log damping stops a
very common but hopelessly polysemous word from buying its way in.

A first pass scored on ambiguity alone. It selected `ensure`, `cease` and
`disallow` — three words with **zero** uses in this repository — and demanded 829
rewrites to vocabulary the system had never spoken. Optimising clarity while
ignoring migration cost. The scoring above is the correction.

One residue, recorded rather than hidden: `write` won over `log` on entrenchment
despite carrying more senses. If that proves ambiguous in practice, it is the
first term to revisit.

## ENFORCEMENT — RATCHET

`tools/vocab_check.py`, wired to conform.sh. It does not fail on the existing
352 uses. It fails when the count **goes up**.

```
baseline   recorded per scope in tools/vocab_baseline.json
pass       count <= baseline           (and the baseline tightens to match)
fail       count > baseline            a new violation was introduced
```

Migration happens by lowering the baseline as text is rewritten, never by a
flag day. The ratchet only turns one way: any scope that improves keeps the
improvement, and no scope can regress.

## KILL CONDITIONS

- A baseline that has not moved in three releases means the ratchet is decoration.
  Either migrate the scope or drop the term from the spec.
- A term that must be repeatedly excepted is the wrong term. Change it here rather
  than accumulating exceptions in the files.
- If enforcing this makes instruction text harder to read rather than easier, the
  spec has become a style guide and should be cut back to the concepts that
  actually collided.
