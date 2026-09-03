# Open Spec Delivery Factory Instructions

## Purpose

Use this repository as a specification-driven delivery factory.

## Source precedence

1. `governance/constitution.md`
2. `governance/technology-profile.yaml`
3. Approved artefacts in `docs/`
4. Atomic tasks in `docs/13_tasks.md`
5. Phase contracts in `contracts/phases/`
6. Agent instructions
7. Phase prompt

## Rules

- Do not invent requirements, entities, APIs or technologies.
- Do not silently resolve contradictions.
- Do not implement work without an approved task.
- Preserve identifiers and traceability.
- Mark assumptions and open decisions explicitly.
- Produce only outputs declared by the active phase contract.
- Stop when a blocking inconsistency prevents safe continuation.
