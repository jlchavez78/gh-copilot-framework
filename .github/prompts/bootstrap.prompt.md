# Bootstrap

## Purpose

Generate the governance baseline required before executing any project wave.

Bootstrap defines **how the project will be governed and executed**. It does not define the functional solution, detailed architecture, APIs, implementation tasks or application code.

---

## Role

Act as the `governance-architect` agent defined in:

```text
.github/agents/governance-architect.agent.md
```

Apply the responsibilities, restrictions and expected behaviour established by that agent.

---

## Contract

Execute this phase according to:

```text
contracts/phases/bootstrap.contract.json
```

The contract is the authoritative source for:

- Mandatory inputs.
- Optional inputs.
- Allowed outputs.
- Forbidden outputs.
- Responsibilities.
- Validations.
- Completion criteria.
- Next phase.

Do not create or modify files outside the allowed outputs declared by the contract.

---

## Mandatory Input

Read:

```text
docs/01_work_order.md
```

Use the Work Order only to identify the project context required to establish governance, including:

- Type of initiative.
- Organisational context.
- Regulatory context.
- Security and privacy sensitivity.
- Accessibility expectations.
- Integration constraints.
- Deployment constraints.
- Explicit technical constraints.
- Confirmed or requested technology choices.

Do not transform the Work Order into requirements during Bootstrap.

---

## Optional Input

When present, read:

```text
.github/copilot-instructions.md
```

Apply its general repository rules and source-precedence policy.

Apply specialised files from `.github/instructions/` only when they are explicitly requested in the Copilot Chat message that launches this phase.

---

## Required Outputs

Generate or update only:

```text
governance/constitution.md
governance/technology-profile.yaml
governance/quality-gates.yaml
governance/traceability-model.yaml
```

Preserve the existing template structure of each file when a template already exists.

Replace instructional placeholders and `TBD` values only when the Work Order or explicit user instructions provide sufficient information.

When information is not confirmed, retain a clear provisional value and mark it as an assumption or open decision.

---

## Output 1: Project Constitution

Generate:

```text
governance/constitution.md
```

The constitution must define stable project principles and governance rules.

Consider, when applicable:

- Spec-first development.
- Traceability by design.
- Contract-first interfaces.
- Architecture compliance.
- Testability.
- Security and privacy by design.
- Accessibility by design.
- Regulatory compliance by design.
- Simplicity and proportionality.
- Human validation gates.

The constitution must not contain:

- Functional requirements.
- Application use cases.
- Domain entities.
- API endpoints.
- Detailed component design.
- Implementation tasks.
- Application code.

The constitution must include:

- Version.
- Status.
- Principles.
- Amendment process.
- Versioning policy.
- Exception-management policy.

---

## Output 2: Technology Profile

Generate:

```text
governance/technology-profile.yaml
```

The technology profile must capture only approved, mandated or explicitly provisional technology decisions.

Consider, when supported by the Work Order or explicit user instructions:

- Backend language and version.
- Backend framework and version.
- Build tool.
- Architecture style.
- Frontend language and framework.
- Database engine and version.
- Database migration tool.
- API style and specification version.
- Testing tools.
- Containerisation.
- Orchestration.
- Target deployment platform.
- Logging, metrics and tracing.
- Security standards.
- Accessibility standards.

Do not invent technologies or versions.

Use `TBD` or an explicit provisional value when a decision is pending.

Keep project principles in the constitution and technology choices in the technology profile. Do not mix both concerns.

---

## Output 3: Quality Gates

Generate:

```text
governance/quality-gates.yaml
```

Define the controls that govern movement between phases.

At minimum, consider:

- Human approval before the Design Wave.
- Analysis Gate before implementation.
- Convergence Gate after platform assembly.
- Allowed decisions for each gate.
- Blocking, warning and informational severities.
- Whether each severity allows progress.

Quality gates must describe governance decisions, not detailed test cases.

---

## Output 4: Traceability Model
# Bootstrap

## Purpose

Generate the governance baseline required before executing any project wave.

Bootstrap defines **how the project will be governed and executed**. It does not define the functional solution, detailed architecture, APIs, implementation tasks or application code.

---

## Role

Act as the `governance-architect` agent defined in:

```text
.github/agents/governance-architect.agent.md
```

Apply the responsibilities, restrictions and expected behaviour established by that agent.

---

## Contract

Execute this phase according to:

```text
contracts/phases/bootstrap.contract.json
```

The contract is the authoritative source for:

- Mandatory inputs.
- Optional inputs.
- Allowed outputs.
- Forbidden outputs.
- Responsibilities.
- Validations.
- Completion criteria.
- Next phase.

Do not create or modify files outside the allowed outputs declared by the contract.

---

## Mandatory Input

Read:

```text
docs/01_work_order.md
```

Use the Work Order only to identify the project context required to establish governance, including:

- Type of initiative.
- Organisational context.
- Regulatory context.
- Security and privacy sensitivity.
- Accessibility expectations.
- Integration constraints.
- Deployment constraints.
- Explicit technical constraints.
- Confirmed or requested technology choices.

Do not transform the Work Order into requirements during Bootstrap.

---

## Optional Input

When present, read:

```text
.github/copilot-instructions.md
```

Apply its general repository rules and source-precedence policy.

Apply specialised files from `.github/instructions/` only when they are explicitly requested in the Copilot Chat message that launches this phase.

---

## Required Outputs

Generate or update only:

```text
governance/constitution.md
governance/technology-profile.yaml
governance/quality-gates.yaml
governance/traceability-model.yaml
```

Preserve the existing template structure of each file when a template already exists.

Replace instructional placeholders and `TBD` values only when the Work Order or explicit user instructions provide sufficient information.

When information is not confirmed, retain a clear provisional value and mark it as an assumption or open decision.

---

## Output 1: Project Constitution

Generate:

```text
governance/constitution.md
```

The constitution must define stable project principles and governance rules.

Consider, when applicable:

- Spec-first development.
- Traceability by design.
- Contract-first interfaces.
- Architecture compliance.
- Testability.
- Security and privacy by design.
- Accessibility by design.
- Regulatory compliance by design.
- Simplicity and proportionality.
- Human validation gates.

The constitution must not contain:

- Functional requirements.
- Application use cases.
- Domain entities.
- API endpoints.
- Detailed component design.
- Implementation tasks.
- Application code.

The constitution must include:

- Version.
- Status.
- Principles.
- Amendment process.
- Versioning policy.
- Exception-management policy.

---

## Output 2: Technology Profile

Generate:

```text
governance/technology-profile.yaml
```

The technology profile must capture only approved, mandated or explicitly provisional technology decisions.

Consider, when supported by the Work Order or explicit user instructions:

- Backend language and version.
- Backend framework and version.
- Build tool.
- Architecture style.
- Frontend language and framework.
- Database engine and version.
- Database migration tool.
- API style and specification version.
- Testing tools.
- Containerisation.
- Orchestration.
- Target deployment platform.
- Logging, metrics and tracing.
- Security standards.
- Accessibility standards.

Do not invent technologies or versions.

Use `TBD` or an explicit provisional value when a decision is pending.

Keep project principles in the constitution and technology choices in the technology profile. Do not mix both concerns.

---

## Output 3: Quality Gates

Generate:

```text
governance/quality-gates.yaml
```

Define the controls that govern movement between phases.

At minimum, consider:

- Human approval before the Design Wave.
- Analysis Gate before implementation.
- Convergence Gate after platform assembly.
- Allowed decisions for each gate.
- Blocking, warning and informational severities.
- Whether each severity allows progress.

Quality gates must describe governance decisions, not detailed test cases.

---

## Output 4: Traceability Model

Generate:

```text
governance/traceability-model.yaml
```

Define stable identifier conventions and relationships between artefact types.

At minimum, consider identifiers for:

- Business goals.
- Functional requirements.
- Non-functional requirements.
- Use cases.
- Business rules.
- Entities.
- API operations.
- Architecture decisions.
- Tasks.
- Tests.
- Risks.
- Assumptions.
- Open decisions.

Define mandatory relationships, including at least:

```text
Task -> Requirement
Test -> Task
```

Define optional relationships when useful, such as:

```text
Requirement -> Use Case
Requirement -> Business Rule
Requirement -> Entity
Requirement -> API Operation
Task -> Architecture Decision
Task -> API Operation
```

Do not create project-specific requirements, tasks or tests during Bootstrap. Define only their conventions and allowed relationships.

---

## Analysis Rules

1. Distinguish confirmed information from assumptions and pending decisions.
2. Do not silently convert a Work Order assumption into an approved governance decision.
3. Do not infer concrete technology versions when they are not explicitly provided.
4. Do not define detailed solution architecture.
5. Do not generate requirements or acceptance criteria.
6. Do not generate APIs, data models or implementation tasks.
7. Do not generate application code.
8. Keep governance reusable and proportionate to the project context.
9. Record contradictions between the Work Order and existing governance instead of resolving them silently.
10. Preserve separation of concerns among the four governance artefacts.

---

## Forbidden Outputs

Do not create or modify:

```text
docs/02_*
docs/03_*
docs/04_*
docs/05_*
docs/06_*
docs/07_*
docs/08_*
docs/09_*
docs/10_*
docs/11_*
docs/12_*
docs/13_*
docs/14_*
docs/15_*
docs/16_*
outputs/**
```

Do not generate:

- Requirements.
- Detailed architecture.
- API specifications.
- Data models.
- Test strategies.
- Tasks.
- Backend or frontend code.
- Deployment artefacts.

---

## Validation Before Completion

Before completing Bootstrap, verify that:

- All four governance artefacts exist.
- Every governance artefact has a version and status.
- The constitution contains project principles and governance rules.
- The technology profile is consistent with confirmed information in the Work Order.
- Unconfirmed technology decisions remain explicit assumptions or open decisions.
- Quality gates define allowed decisions and progression rules.
- The traceability model defines identifier conventions and relationships.
- No requirements have been generated.
- No application architecture has been generated.
- No implementation tasks have been generated.
- No code has been generated.
- No forbidden file has been modified.

---

## Completion Report

At the end of the session, provide a concise summary containing:

- Governance artefacts created or updated.
- Confirmed governance decisions.
- Provisional decisions.
- Open decisions requiring human review.
- Blocking issues, if any.
- Recommended next phase: `pre-sales-wave` only when Bootstrap completion criteria are satisfied.
Generate:

```text
governance/traceability-model.yaml
```

Define stable identifier conventions and relationships between artefact types.

At minimum, consider identifiers for:

- Business goals.
- Functional requirements.
- Non-functional requirements.
- Use cases.
- Business rules.
- Entities.
- API operations.
- Architecture decisions.
- Tasks.
- Tests.
- Risks.
- Assumptions.
- Open decisions.

Define mandatory relationships, including at least:

```text
Task -> Requirement
Test -> Task
```

Define optional relationships when useful, such as:

```text
Requirement -> Use Case
Requirement -> Business Rule
Requirement -> Entity
Requirement -> API Operation
Task -> Architecture Decision
Task -> API Operation
```

Do not create project-specific requirements, tasks or tests during Bootstrap. Define only their conventions and allowed relationships.

---

## Analysis Rules

1. Distinguish confirmed information from assumptions and pending decisions.
2. Do not silently convert a Work Order assumption into an approved governance decision.
3. Do not infer concrete technology versions when they are not explicitly provided.
4. Do not define detailed solution architecture.
5. Do not generate requirements or acceptance criteria.
6. Do not generate APIs, data models or implementation tasks.
7. Do not generate application code.
8. Keep governance reusable and proportionate to the project context.
9. Record contradictions between the Work Order and existing governance instead of resolving them silently.
10. Preserve separation of concerns among the four governance artefacts.

---

## Forbidden Outputs

Do not create or modify:

```text
docs/02_*
docs/03_*
docs/04_*
docs/05_*
docs/06_*
docs/07_*
docs/08_*
docs/09_*
docs/10_*
docs/11_*
docs/12_*
docs/13_*
docs/14_*
docs/15_*
docs/16_*
outputs/**
```

Do not generate:

- Requirements.
- Detailed architecture.
- API specifications.
- Data models.
- Test strategies.
- Tasks.
- Backend or frontend code.
- Deployment artefacts.

---

## Validation Before Completion

Before completing Bootstrap, verify that:

- All four governance artefacts exist.
- Every governance artefact has a version and status.
- The constitution contains project principles and governance rules.
- The technology profile is consistent with confirmed information in the Work Order.
- Unconfirmed technology decisions remain explicit assumptions or open decisions.
- Quality gates define allowed decisions and progression rules.
- The traceability model defines identifier conventions and relationships.
- No requirements have been generated.
- No application architecture has been generated.
- No implementation tasks have been generated.
- No code has been generated.
- No forbidden file has been modified.

---

## Completion Report

At the end of the session, provide a concise summary containing:

- Governance artefacts created or updated.
- Confirmed governance decisions.
- Provisional decisions.
- Open decisions requiring human review.
- Blocking issues, if any.
- Recommended next phase: `pre-sales-wave` only when Bootstrap completion criteria are satisfied.