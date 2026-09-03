# Project Constitution

## Metadata
- Version: 1.0.0
- Status: DRAFT
- Approved by: ASSDA / Junta de Andalucía (pending formal approval)
- Approval date: TBD

## Principles

### 1. Spec First
The approved specification is the authoritative source of truth for the project. No governance decision, design choice, task, integration, or implementation detail may add business rules, data handling, or workflow behaviour unless it is explicitly supported by an approved specification artefact.

### 2. Traceability by Design
Every artefact must be traceable to its source of authority and to the evidence that validates it. The project must preserve explicit relationships across governing context, requirements, design decisions, implementation tasks, tests, and operational evidence.

### 3. Contract-first Interfaces
All interfaces, integrations, and exchange contracts must be defined, reviewed, and approved before implementation. APIs, document exchanges, and identity/firma flows must be treated as formal contracts whose behaviour is governed by approved specifications and change control.

### 4. Architecture and Delivery Compliance
Implementation must comply with the approved architecture, technology baseline, and delivery constraints defined for the project. Deviations require explicit justification, documented approval, and traceable impact analysis.

### 5. Testability and Evidence
Every functional or non-functional behaviour must be testable with objective evidence. The project must require validation artefacts that can prove correctness, compliance, and operational readiness before progressing from one wave to the next.

### 6. Security and Privacy by Design
Security and privacy are design constraints, not post-implementation add-ons. The project must protect personal data, special-category data, identity data, and administrative documentation using default-secure patterns, least privilege, auditable decisions, and clear data-handling boundaries.

### 7. Accessibility by Design
Public-service digital delivery must be designed for accessibility from the start. The application must be usable with assistive technologies and must support the accessibility requirements applicable to the administrative process, with WCAG 2.1 AA as the baseline target.

### 8. Human Validation Gates
Certain decisions require explicit human approval before proceeding. This includes governance decisions, legal interpretation points, privacy-sensitive changes, and approvals that affect public service quality or regulatory compliance.

### 9. Simplicity and Proportionality
The solution must remain as simple as possible while satisfying the approved scope, legal constraints, and public-service quality expectations. Unnecessary complexity, redundant flows, and oversized technical solutions are not permitted unless justified with traceable governance rationale.

### 10. Regulatory Compliance by Design
The project operates in a public-administration context. Compliance with the applicable legal, regulatory, and procedural framework is part of the design baseline and must be reflected in both governance decisions and product behaviour.

## Governance

### Amendment process
Changes to this constitution must be justified with a reasoned change request, reviewed against the current work order and project constraints, and approved before becoming effective. The change record must identify the affected sections, rationale, decision owner, and effective version.

### Versioning policy
The project uses semantic versioning: MAJOR for changes that revise the governing principles or legal/governance posture; MINOR for additive changes that keep the baseline stable; PATCH for clarification or editorial corrections. The version must be reflected in each approved governance artefact.

### Exception management
Exceptions are allowed only when they are necessary, time-bounded, and formally documented. Every exception must state the justification, affected scope, impact assessment, mitigation measures, approval authority, and expiry date or review date.
