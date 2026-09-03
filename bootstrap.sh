#!/usr/bin/env bash
set -euo pipefail

ROOT="${1:-$(pwd)}"

echo "Inicializando Open Spec Delivery Factory en: ${ROOT}"

mkdir -p \
  "${ROOT}/.github/agents" \
  "${ROOT}/.github/prompts" \
  "${ROOT}/.github/instructions" \
  "${ROOT}/governance" \
  "${ROOT}/contracts/schemas" \
  "${ROOT}/contracts/phases" \
  "${ROOT}/docs" \
  "${ROOT}/outputs/backend" \
  "${ROOT}/outputs/frontend" \
  "${ROOT}/outputs/api" \
  "${ROOT}/outputs/db" \
  "${ROOT}/outputs/scripts" \
  "${ROOT}/outputs/data" \
  "${ROOT}/outputs/tests" \
  "${ROOT}/outputs/docs"

# -----------------------------------------------------------------------------
# Root
# -----------------------------------------------------------------------------
cat > "${ROOT}/README.md" <<'EOF'
# Open Spec Delivery Factory

Factoría de entrega basada en Open Spec y Spec-Driven Development para transformar una orden de trabajo en una solución especificada, diseñada, planificada, implementada, probada, empaquetada y documentada.

## Flujo

```text
Bootstrap
  ↓
Pre-sales Wave
  ↓
Human Approval
  ↓
Design Wave
  ↓
Task-planning Wave
  ↓
Analysis Gate
  ↓ READY
Backend Wave
  ↓
Platform-assembly Wave
  ↓
Convergence Gate
```

## Modelo conceptual

- **Artefacto**: resultado persistente del proceso.
- **Agente**: rol especializado con responsabilidades y límites.
- **Prompt**: misión concreta asignada a un agente.
- **Sesión**: ejecución temporal de un agente.
- **Contrato**: definición formal de agente, prompt, entradas, salidas y validaciones.
- **Wave**: agrupación de trabajo orientada a producir o transformar artefactos.
- **Gate**: punto de control que habilita o bloquea el avance.

## Estructura

- `.github/agents`: roles especializados.
- `.github/prompts`: misiones de cada fase.
- `.github/instructions`: reglas reutilizables por ámbito.
- `governance`: constitución, perfil tecnológico, quality gates y trazabilidad.
- `contracts/schemas`: esquemas de validación.
- `contracts/phases`: contratos ejecutables de waves y gates.
- `docs`: artefactos funcionales, técnicos, de planificación y validación.
- `outputs`: código y entregables generados.

## Fases

### Bootstrap
Inicializa el gobierno del proyecto sin generar funcionalidad ni código.

### Pre-sales Wave
Convierte el Work Order en requisitos, arquitectura inicial y plan de alto nivel.

### Human Approval
Valida alcance y dirección antes del diseño detallado.

### Design Wave
Genera diseño funcional, requisitos detallados, datos, APIs, pruebas y arquitectura.

### Task-planning Wave
Descompone el diseño aprobado en tareas atómicas, dependencias y trazabilidad.

### Analysis Gate
Evalúa cumplimiento de la constitución, consistencia y preparación de implementación.

### Backend Wave
Implementa tareas backend autorizadas e incluye las pruebas de cada tarea.

### Platform-assembly Wave
Completa frontend, empaquetado, datos de prueba y documentación.

### Convergence Gate
Compara especificaciones, tareas, código y pruebas, registrando desviaciones.

## Convenciones

- Waves: `<purpose>-wave`
- Gates: `<purpose>-gate`
- Agentes: `<role>.agent.md`
- Prompts: `<phase>.prompt.md`
- Contratos: `<phase>.contract.json`
- Instrucciones: `<scope>.instructions.md`
- Esquemas: `<artifact>.schema.json`

## Primer uso

1. Completar `docs/01_work_order.md`.
2. Revisar y aprobar los ficheros de `governance/`.
3. Ejecutar las fases según los contratos de `contracts/phases/`.
4. No avanzar al Backend Wave si `docs/15_implementation_readiness.md` no permite la ejecución.
EOF

cat > "${ROOT}/delivery-factory-overview.mmd" <<'EOF'
flowchart TB
    A[OPEN SPEC DELIVERY FACTORY<br/>Work Order + Waves + Contracts]
    B[BOOTSTRAP<br/>Constitution<br/>Technology Profile<br/>Quality Gates<br/>Traceability Model]
    C[PRE-SALES WAVE<br/>Requirements<br/>Initial Architecture<br/>High-Level Plan]
    D{HUMAN APPROVAL}
    E[DESIGN WAVE<br/>Functional Design<br/>Detailed Requirements<br/>Data Model<br/>API Catalog<br/>Technical Design<br/>Test Strategy]
    F[TASK-PLANNING WAVE<br/>Atomic Tasks<br/>Dependencies<br/>Traceability Matrix]
    G{ANALYSIS GATE<br/>Compliance<br/>Consistency<br/>Readiness}
    H[BACKEND WAVE<br/>Task-driven implementation<br/>Tests per task]
    I[PLATFORM-ASSEMBLY WAVE<br/>Frontend → Package → Data → Docs]
    J{CONVERGENCE GATE<br/>Spec vs Code vs Tests<br/>Drift and deviations}
    A --> B --> C --> D
    D -->|APPROVED| E
    D -->|CHANGES REQUIRED| C
    E --> F --> G
    G -->|READY| H
    G -->|NOT READY| E
    H --> I --> J
EOF

cat > "${ROOT}/.gitignore" <<'EOF'
# IDE
.vscode/
.idea/

# OS
.DS_Store
Thumbs.db

# Secrets
.env
.env.*
*.key
*.pem
secrets/

# Logs and temporary files
*.log
tmp/
temp/
.cache/

# Node
node_modules/
dist/
coverage/

# Java
target/
build/
.gradle/
*.class

# Python
__pycache__/
*.pyc
.venv/

# Generated runtime content
outputs/**/target/
outputs/**/build/
outputs/**/dist/
outputs/**/coverage/
outputs/**/node_modules/
EOF

# -----------------------------------------------------------------------------
# Copilot common instructions
# -----------------------------------------------------------------------------
cat > "${ROOT}/.github/copilot-instructions.md" <<'EOF'
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
EOF

# -----------------------------------------------------------------------------
# Agents
# -----------------------------------------------------------------------------
write_agent() {
  local file="$1" name="$2" description="$3" mission="$4" inputs="$5" outputs="$6"
  cat > "${ROOT}/.github/agents/${file}" <<EOF
---
name: ${name}
description: ${description}
tools:
  - read
  - edit
---

# ${name}

## Mission

${mission}

## Required inputs

${inputs}

## Expected outputs

${outputs}

## Responsibilities

- Read all normative inputs declared by the active phase contract.
- Apply the constitution and technology profile.
- Preserve stable identifiers and traceability references.
- Distinguish confirmed information, assumptions and open decisions.
- Report blocking inconsistencies instead of hiding them.

## Restrictions

- Do not invent unapproved scope.
- Do not modify files outside the declared outputs or allowed paths.
- Do not silently resolve conflicts between normative sources.
- Do not continue when a blocking gate condition is unsatisfied.
EOF
}

write_agent "governance-architect.agent.md" "governance-architect" \
  "Creates and maintains project governance artefacts." \
  "Establish the project rules without defining application functionality." \
  "- Repository context\n- Existing governance artefacts" \
  "- constitution.md\n- technology-profile.yaml\n- quality-gates.yaml\n- traceability-model.yaml"

write_agent "business-analyst.agent.md" "business-analyst" \
  "Transforms the Work Order into discovery and pre-sales artefacts." \
  "Clarify business intent, scope, requirements and the initial solution direction." \
  "- Work Order\n- Governance artefacts" \
  "- Requirements\n- Initial Architecture\n- High-Level Plan"

write_agent "solution-designer.agent.md" "solution-designer" \
  "Produces a coherent functional and technical design." \
  "Transform approved pre-sales artefacts into a complete design without generating application code." \
  "- Approved pre-sales artefacts\n- Governance artefacts" \
  "- Functional Design\n- Detailed Requirements\n- Data Model\n- API Catalog\n- Test Strategy\n- Technical and Architecture Documents"

write_agent "task-planner.agent.md" "task-planner" \
  "Creates atomic, ordered and verifiable implementation tasks." \
  "Decompose the approved design into tasks, dependencies and traceability relationships." \
  "- Approved design artefacts\n- Traceability model" \
  "- Tasks\n- Traceability Matrix"

write_agent "consistency-reviewer.agent.md" "consistency-reviewer" \
  "Reviews governance compliance and cross-artefact consistency." \
  "Execute Analysis Gate and Convergence Gate without silently modifying reviewed sources." \
  "- Governance\n- Specifications\n- Tasks\n- Generated outputs, when applicable" \
  "- Implementation Readiness or Convergence Report"

write_agent "backend-generator.agent.md" "backend-generator" \
  "Implements approved backend tasks and their tests." \
  "Implement only selected backend tasks, respecting dependencies, contracts and allowed paths." \
  "- Approved tasks\n- Readiness decision\n- Technical design artefacts" \
  "- Backend code\n- API artefacts\n- Database artefacts\n- Tests and evidence"

write_agent "frontend-generator.agent.md" "frontend-generator" \
  "Implements approved frontend tasks and their tests." \
  "Build the user interface from approved tasks, functional design and API contracts." \
  "- Approved frontend tasks\n- Functional Design\n- API contract" \
  "- Frontend code\n- Frontend tests"

write_agent "platform-packager.agent.md" "platform-packager" \
  "Creates reproducible packaging and runtime resources." \
  "Package only components justified by the approved architecture." \
  "- Approved architecture\n- Generated backend and frontend" \
  "- Containers\n- Service composition\n- Operational scripts"

write_agent "test-data-generator.agent.md" "test-data-generator" \
  "Creates deterministic test and seed data." \
  "Generate data aligned with the data model, API contracts and test strategy." \
  "- Data Model\n- API Catalog\n- Test Strategy" \
  "- Seed data\n- Fixtures\n- API validation collections"

write_agent "documentation-writer.agent.md" "documentation-writer" \
  "Creates final development, usage and operational documentation." \
  "Document the solution that has actually been assembled." \
  "- Generated implementation\n- Runtime configuration\n- Approved design" \
  "- Developer Guide\n- User Guide\n- Deployment and Operations Guide"

# -----------------------------------------------------------------------------
# Prompts
# -----------------------------------------------------------------------------
cat > "${ROOT}/.github/prompts/bootstrap.prompt.md" <<'EOF'
# Bootstrap

## Mission
Initialise or update project governance.

## Produce
- `governance/constitution.md`
- `governance/technology-profile.yaml`
- `governance/quality-gates.yaml`
- `governance/traceability-model.yaml`

## Checks
- Governance is separated from application-specific functionality.
- Every artefact has version and status.
- No application code is generated.
EOF

cat > "${ROOT}/.github/prompts/pre-sales-wave.prompt.md" <<'EOF'
# Pre-sales Wave

## Mission
Transform `docs/01_work_order.md` into requirements, initial architecture and a high-level plan.

## Produce
- `docs/02_requirements.md`
- `docs/03_initial_architecture.md`
- `docs/04_high_level_plan.md`

## Checks
- Stay within the Work Order scope.
- Separate facts, assumptions and open questions.
- Do not generate application code.
EOF

cat > "${ROOT}/.github/prompts/design-wave.prompt.md" <<'EOF'
# Design Wave

## Mission
Transform approved pre-sales artefacts into a complete functional and technical design.

## Produce
- `docs/05_functional_design.md`
- `docs/06_detailed_requirements.md`
- `docs/07_data_model.yaml`
- `docs/08_backend_architecture.md`
- `docs/09_api_catalog.yaml`
- `docs/10_test_strategy.md`
- `docs/11_technical_design.md`
- `docs/12_architecture_document.md`

## Checks
- Requirements, data, APIs and tests are consistent.
- The design complies with governance.
- Open decisions are explicit.
- No application code is generated.
EOF

cat > "${ROOT}/.github/prompts/task-planning-wave.prompt.md" <<'EOF'
# Task-planning Wave

## Mission
Convert approved design into atomic, ordered, traceable and verifiable work.

## Produce
- `docs/13_tasks.md`
- `docs/14_traceability_matrix.md`

## Checks
- Every task has a stable ID, owner agent, dependencies, deliverables and validation.
- Every task traces to approved requirements.
- Tests are included in implementation work.
- No code is generated.
EOF

cat > "${ROOT}/.github/prompts/analysis-gate.prompt.md" <<'EOF'
# Analysis Gate

## Mission
Determine whether implementation may start.

## Review
- Constitution and technology-profile compliance
- Cross-artefact consistency
- Requirement and task coverage
- Traceability
- Testability

## Produce
- `docs/15_implementation_readiness.md`

## Decisions
- READY
- READY_WITH_WARNINGS
- NOT_READY

Do not return READY while blocking findings remain.
EOF

cat > "${ROOT}/.github/prompts/backend-wave.prompt.md" <<'EOF'
# Backend Wave

## Mission
Implement selected and authorised backend tasks and their tests.

## Produce
- `outputs/backend/`
- `outputs/api/`
- `outputs/db/`
- Backend test evidence

## Checks
- Readiness allows execution.
- Only authorised tasks and paths are changed.
- No unapproved entities, APIs, dependencies or technologies are introduced.
EOF

cat > "${ROOT}/.github/prompts/platform-assembly-wave.prompt.md" <<'EOF'
# Platform-assembly Wave

## Mission
Complete and assemble the solution.

## Execution order
1. Frontend implementation
2. Platform packaging
3. Test-data generation
4. Final documentation

## Produce
- `outputs/frontend/`
- `outputs/scripts/`
- `outputs/data/`
- `outputs/tests/`
- `outputs/docs/`
EOF

cat > "${ROOT}/.github/prompts/convergence-gate.prompt.md" <<'EOF'
# Convergence Gate

## Mission
Compare specifications, tasks, implementation and tests.

## Review
- Requirement implementation coverage
- Task completion
- API and data-model convergence
- Architecture compliance
- Test evidence
- Approved and unapproved deviations

## Produce
- `docs/16_convergence_report.md`

## Decisions
- CONVERGED
- CONVERGED_WITH_DEVIATIONS
- NOT_CONVERGED
EOF

# -----------------------------------------------------------------------------
# Reusable instructions
# -----------------------------------------------------------------------------
cat > "${ROOT}/.github/instructions/general.instructions.md" <<'EOF'
---
description: General repository rules
applyTo: "**/*"
---

- Apply the project constitution.
- Respect the active phase contract.
- Preserve identifiers and traceability.
- Mark assumptions explicitly.
- Do not write outside declared outputs.
EOF

cat > "${ROOT}/.github/instructions/java-spring.instructions.md" <<'EOF'
---
description: Java and Spring backend rules
applyTo: "outputs/backend/**/*.java"
---

- Use versions declared in the technology profile.
- Respect the approved backend architecture.
- Keep responsibilities separated.
- Do not add dependencies without an approved reason.
- Include tests required by each task.
EOF

cat > "${ROOT}/.github/instructions/frontend-react.instructions.md" <<'EOF'
---
description: React frontend rules
applyTo: "outputs/frontend/**/*.{js,jsx,ts,tsx}"
---

- Use versions declared in the technology profile.
- Implement only approved frontend tasks.
- Use the approved API contract as integration source.
- Include required frontend tests.
EOF

cat > "${ROOT}/.github/instructions/api-standards.instructions.md" <<'EOF'
---
description: API design and implementation rules
applyTo: "outputs/api/**/*.{yaml,yml,json}"
---

- Every operation must trace to an approved requirement.
- Use stable operation identifiers.
- Define requests, responses, errors and security explicitly.
- Do not introduce undocumented breaking changes.
EOF

cat > "${ROOT}/.github/instructions/testing.instructions.md" <<'EOF'
---
description: Testing rules
applyTo: "**/*Test.*, **/*.spec.*, **/*.test.*"
---

- Trace tests to tasks or approved behaviour.
- Cover success, validation and error scenarios.
- Keep test data deterministic.
- Record test evidence and limitations.
EOF

# -----------------------------------------------------------------------------
# Governance templates
# -----------------------------------------------------------------------------
cat > "${ROOT}/governance/constitution.md" <<'EOF'
# Project Constitution

## Metadata
- Version: 0.1.0
- Status: DRAFT
- Approved by:
- Approval date:

## Principles

### 1. Spec First
Describe how specifications govern design and implementation.

### 2. Traceability by Design
Describe mandatory relationships between requirements, design, tasks, code and tests.

### 3. Contract-first Interfaces
Describe how interfaces are specified, reviewed and versioned before implementation.

### 4. Architecture Compliance
Describe how implementation must respect approved architecture and decisions.

### 5. Testability
Describe mandatory validation principles and test evidence.

### 6. Security and Privacy by Design
Describe security, privacy, secrets and audit principles.

### 7. Simplicity and Proportionality
Describe how unnecessary complexity and over-engineering are avoided.

### 8. Human Validation Gates
Describe decisions that require explicit human approval.

## Governance

### Amendment process
Describe how the constitution is changed.

### Versioning
Describe major, minor and patch changes.

### Exceptions
Describe how exceptions are requested, approved and recorded.
EOF

cat > "${ROOT}/governance/technology-profile.yaml" <<'EOF'
profile:
  id: default-profile
  version: 0.1.0
  status: DRAFT
  description: Replace TBD values with the approved project stack.

backend:
  language: TBD
  languageVersion: TBD
  framework: TBD
  frameworkVersion: TBD
  buildTool: TBD
  architectureStyle: TBD

frontend:
  language: TBD
  framework: TBD
  frameworkVersion: TBD
  buildTool: TBD

data:
  primaryDatabase:
    engine: TBD
    version: TBD
  migrationTool: TBD

api:
  style: TBD
  specification: OpenAPI
  specificationVersion: TBD

testing:
  backend:
    unitFramework: TBD
    integrationFramework: TBD
  frontend:
    unitFramework: TBD
    e2eFramework: TBD

deployment:
  containerisation: TBD
  orchestration: TBD
  targetPlatform: TBD

observability:
  logging: TBD
  metrics: TBD
  tracing: TBD
EOF

cat > "${ROOT}/governance/quality-gates.yaml" <<'EOF'
version: 0.1.0
status: DRAFT

gates:
  human-approval:
    enabled: true
    type: manual
    requiredBefore: [design-wave]
    allowedDecisions: [APPROVED, CHANGES_REQUIRED]

  analysis-gate:
    enabled: true
    type: automated-with-human-review
    requiredBefore: [backend-wave]
    allowedDecisions: [READY, READY_WITH_WARNINGS, NOT_READY]

  convergence-gate:
    enabled: true
    type: automated-with-human-review
    requiredAfter: [platform-assembly-wave]
    allowedDecisions: [CONVERGED, CONVERGED_WITH_DEVIATIONS, NOT_CONVERGED]

severity:
  blocking:
    allowsProgress: false
  warning:
    allowsProgress: true
  informational:
    allowsProgress: true
EOF

cat > "${ROOT}/governance/traceability-model.yaml" <<'EOF'
version: 0.1.0
status: DRAFT

identifiers:
  requirement: {prefix: REQ, example: REQ-001}
  nonFunctionalRequirement: {prefix: NFR, example: NFR-001}
  businessRule: {prefix: BR, example: BR-001}
  useCase: {prefix: UC, example: UC-001}
  entity: {prefix: ENT, example: ENT-001}
  apiOperation: {prefix: API, example: API-001}
  architectureDecision: {prefix: ADR, example: ADR-001}
  task: {prefix: TASK, example: TASK-BE-001}
  test: {prefix: TEST, example: TEST-001}

mandatoryRelationships:
  - source: task
    target: requirement
  - source: test
    target: task

optionalRelationships:
  - source: requirement
    target: useCase
  - source: requirement
    target: businessRule
  - source: requirement
    target: apiOperation
  - source: requirement
    target: entity
  - source: task
    target: apiOperation
  - source: task
    target: architectureDecision
EOF

# -----------------------------------------------------------------------------
# JSON schemas
# -----------------------------------------------------------------------------
cat > "${ROOT}/contracts/schemas/constitution.schema.json" <<'EOF'
{
  "$schema": "https://json-schema.org/draft/2020-12/schema",
  "$id": "constitution.schema.json",
  "title": "Project Constitution",
  "type": "object",
  "required": ["version", "status", "principles"],
  "properties": {
    "version": {"type": "string"},
    "status": {"enum": ["DRAFT", "APPROVED", "SUPERSEDED"]},
    "principles": {
      "type": "array",
      "minItems": 1,
      "items": {
        "type": "object",
        "required": ["id", "name", "statement"],
        "properties": {
          "id": {"type": "string"},
          "name": {"type": "string"},
          "statement": {"type": "string"},
          "rationale": {"type": "string"}
        },
        "additionalProperties": false
      }
    }
  },
  "additionalProperties": false
}
EOF

cat > "${ROOT}/contracts/schemas/technology-profile.schema.json" <<'EOF'
{
  "$schema": "https://json-schema.org/draft/2020-12/schema",
  "$id": "technology-profile.schema.json",
  "title": "Technology Profile",
  "type": "object",
  "required": ["profile", "backend", "frontend", "data", "api", "testing", "deployment"],
  "properties": {
    "profile": {"type": "object", "required": ["id", "version", "status"]},
    "backend": {"type": "object"},
    "frontend": {"type": "object"},
    "data": {"type": "object"},
    "api": {"type": "object"},
    "testing": {"type": "object"},
    "deployment": {"type": "object"},
    "observability": {"type": "object"}
  },
  "additionalProperties": false
}
EOF

cat > "${ROOT}/contracts/schemas/quality-gates.schema.json" <<'EOF'
{
  "$schema": "https://json-schema.org/draft/2020-12/schema",
  "$id": "quality-gates.schema.json",
  "title": "Quality Gates",
  "type": "object",
  "required": ["version", "gates"],
  "properties": {
    "version": {"type": "string"},
    "status": {"type": "string"},
    "gates": {"type": "object", "minProperties": 1},
    "severity": {"type": "object"}
  },
  "additionalProperties": false
}
EOF

cat > "${ROOT}/contracts/schemas/tasks.schema.json" <<'EOF'
{
  "$schema": "https://json-schema.org/draft/2020-12/schema",
  "$id": "tasks.schema.json",
  "title": "Atomic Tasks",
  "type": "object",
  "required": ["version", "tasks"],
  "properties": {
    "version": {"type": "string"},
    "tasks": {
      "type": "array",
      "items": {
        "type": "object",
        "required": ["id", "title", "type", "status", "requirements", "dependencies", "agent", "deliverables", "validation"],
        "properties": {
          "id": {"type": "string", "pattern": "^TASK-[A-Z]+-[0-9]{3}$"},
          "title": {"type": "string"},
          "type": {"type": "string"},
          "status": {"enum": ["PENDING", "READY", "IN_PROGRESS", "BLOCKED", "COMPLETED", "FAILED"]},
          "requirements": {"type": "array", "items": {"type": "string"}},
          "dependencies": {"type": "array", "items": {"type": "string"}},
          "agent": {"type": "string"},
          "inputs": {"type": "array", "items": {"type": "string"}},
          "allowedPaths": {"type": "array", "items": {"type": "string"}},
          "deliverables": {"type": "array", "items": {"type": "string"}},
          "validation": {"type": "array", "items": {"type": "string"}},
          "evidence": {"type": "array", "items": {"type": "string"}}
        },
        "additionalProperties": false
      }
    }
  },
  "additionalProperties": false
}
EOF

cat > "${ROOT}/contracts/schemas/traceability.schema.json" <<'EOF'
{
  "$schema": "https://json-schema.org/draft/2020-12/schema",
  "$id": "traceability.schema.json",
  "title": "Traceability Matrix",
  "type": "object",
  "required": ["version", "relationships"],
  "properties": {
    "version": {"type": "string"},
    "relationships": {
      "type": "array",
      "items": {
        "type": "object",
        "required": ["source", "relationship", "target"],
        "properties": {
          "source": {"type": "string"},
          "relationship": {"type": "string"},
          "target": {"type": "string"},
          "evidence": {"type": "array", "items": {"type": "string"}}
        },
        "additionalProperties": false
      }
    }
  },
  "additionalProperties": false
}
EOF

# -----------------------------------------------------------------------------
# Phase contracts
# -----------------------------------------------------------------------------
cat > "${ROOT}/contracts/phases/bootstrap.contract.json" <<'EOF'
{
  "name": "bootstrap",
  "type": "bootstrap",
  "agent": "governance-architect",
  "prompt": ".github/prompts/bootstrap.prompt.md",
  "inputs": [],
  "outputs": [
    "governance/constitution.md",
    "governance/technology-profile.yaml",
    "governance/quality-gates.yaml",
    "governance/traceability-model.yaml"
  ],
  "validations": ["Governance exists", "Governance has version and status", "No application code is generated"],
  "next": "pre-sales-wave"
}
EOF

cat > "${ROOT}/contracts/phases/pre-sales-wave.contract.json" <<'EOF'
{
  "name": "pre-sales-wave",
  "type": "wave",
  "agent": "business-analyst",
  "prompt": ".github/prompts/pre-sales-wave.prompt.md",
  "inputs": ["docs/01_work_order.md", "governance/constitution.md", "governance/technology-profile.yaml"],
  "outputs": ["docs/02_requirements.md", "docs/03_initial_architecture.md", "docs/04_high_level_plan.md"],
  "validations": ["Outputs stay within scope", "Assumptions are explicit", "No code is generated"],
  "next": "human-approval"
}
EOF

cat > "${ROOT}/contracts/phases/design-wave.contract.json" <<'EOF'
{
  "name": "design-wave",
  "type": "wave",
  "agent": "solution-designer",
  "prompt": ".github/prompts/design-wave.prompt.md",
  "inputs": ["governance/constitution.md", "governance/technology-profile.yaml", "docs/02_requirements.md", "docs/03_initial_architecture.md", "docs/04_high_level_plan.md"],
  "outputs": ["docs/05_functional_design.md", "docs/06_detailed_requirements.md", "docs/07_data_model.yaml", "docs/08_backend_architecture.md", "docs/09_api_catalog.yaml", "docs/10_test_strategy.md", "docs/11_technical_design.md", "docs/12_architecture_document.md"],
  "validations": ["Requirements are traceable", "Data and APIs are consistent", "Tests cover critical behaviour", "No code is generated"],
  "next": "task-planning-wave"
}
EOF

cat > "${ROOT}/contracts/phases/task-planning-wave.contract.json" <<'EOF'
{
  "name": "task-planning-wave",
  "type": "wave",
  "agent": "task-planner",
  "prompt": ".github/prompts/task-planning-wave.prompt.md",
  "inputs": ["governance/constitution.md", "governance/technology-profile.yaml", "governance/traceability-model.yaml", "docs/02_requirements.md", "docs/05_functional_design.md", "docs/06_detailed_requirements.md", "docs/07_data_model.yaml", "docs/08_backend_architecture.md", "docs/09_api_catalog.yaml", "docs/10_test_strategy.md", "docs/11_technical_design.md", "docs/12_architecture_document.md"],
  "outputs": ["docs/13_tasks.md", "docs/14_traceability_matrix.md"],
  "validations": ["Tasks are atomic", "Dependencies are declared", "Validation criteria exist", "Tasks trace to requirements"],
  "next": "analysis-gate"
}
EOF

cat > "${ROOT}/contracts/phases/analysis-gate.contract.json" <<'EOF'
{
  "name": "analysis-gate",
  "type": "gate",
  "agent": "consistency-reviewer",
  "prompt": ".github/prompts/analysis-gate.prompt.md",
  "inputs": ["governance/constitution.md", "governance/technology-profile.yaml", "governance/quality-gates.yaml", "governance/traceability-model.yaml", "docs/02_requirements.md", "docs/05_functional_design.md", "docs/06_detailed_requirements.md", "docs/07_data_model.yaml", "docs/08_backend_architecture.md", "docs/09_api_catalog.yaml", "docs/10_test_strategy.md", "docs/11_technical_design.md", "docs/12_architecture_document.md", "docs/13_tasks.md", "docs/14_traceability_matrix.md"],
  "outputs": ["docs/15_implementation_readiness.md"],
  "allowedDecisions": ["READY", "READY_WITH_WARNINGS", "NOT_READY"],
  "nextOnReady": "backend-wave",
  "nextOnNotReady": "design-wave"
}
EOF

cat > "${ROOT}/contracts/phases/backend-wave.contract.json" <<'EOF'
{
  "name": "backend-wave",
  "type": "wave",
  "agent": "backend-generator",
  "prompt": ".github/prompts/backend-wave.prompt.md",
  "inputs": ["governance/constitution.md", "governance/technology-profile.yaml", "docs/07_data_model.yaml", "docs/08_backend_architecture.md", "docs/09_api_catalog.yaml", "docs/10_test_strategy.md", "docs/11_technical_design.md", "docs/12_architecture_document.md", "docs/13_tasks.md", "docs/14_traceability_matrix.md", "docs/15_implementation_readiness.md"],
  "taskSelection": {"types": ["foundation", "backend-domain", "backend-application", "backend-adapter", "backend-test", "database", "api-contract"], "statuses": ["PENDING", "READY", "FAILED"]},
  "outputs": ["outputs/backend", "outputs/api", "outputs/db"],
  "validations": ["Readiness allows execution", "Only authorised tasks are implemented", "Tests are generated", "No unapproved technology is introduced"],
  "next": "platform-assembly-wave"
}
EOF

cat > "${ROOT}/contracts/phases/platform-assembly-wave.contract.json" <<'EOF'
{
  "name": "platform-assembly-wave",
  "type": "wave",
  "prompt": ".github/prompts/platform-assembly-wave.prompt.md",
  "orchestration": {
    "mode": "sequential",
    "steps": [
      {"agent": "frontend-generator", "taskTypes": ["frontend", "frontend-test"]},
      {"agent": "platform-packager", "taskTypes": ["packaging", "local-runtime"]},
      {"agent": "test-data-generator", "taskTypes": ["test-data", "api-test"]},
      {"agent": "documentation-writer", "taskTypes": ["documentation"]}
    ]
  },
  "inputs": ["governance/constitution.md", "governance/technology-profile.yaml", "docs/05_functional_design.md", "docs/07_data_model.yaml", "docs/09_api_catalog.yaml", "docs/10_test_strategy.md", "docs/13_tasks.md", "docs/14_traceability_matrix.md", "outputs/backend", "outputs/api", "outputs/db"],
  "outputs": ["outputs/frontend", "outputs/scripts", "outputs/data", "outputs/tests", "outputs/docs"],
  "next": "convergence-gate"
}
EOF

cat > "${ROOT}/contracts/phases/convergence-gate.contract.json" <<'EOF'
{
  "name": "convergence-gate",
  "type": "gate",
  "agent": "consistency-reviewer",
  "prompt": ".github/prompts/convergence-gate.prompt.md",
  "inputs": ["governance/constitution.md", "governance/technology-profile.yaml", "governance/quality-gates.yaml", "docs/02_requirements.md", "docs/05_functional_design.md", "docs/06_detailed_requirements.md", "docs/07_data_model.yaml", "docs/08_backend_architecture.md", "docs/09_api_catalog.yaml", "docs/10_test_strategy.md", "docs/11_technical_design.md", "docs/12_architecture_document.md", "docs/13_tasks.md", "docs/14_traceability_matrix.md", "outputs/backend", "outputs/frontend", "outputs/api", "outputs/db", "outputs/scripts", "outputs/data", "outputs/tests", "outputs/docs"],
  "outputs": ["docs/16_convergence_report.md"],
  "allowedDecisions": ["CONVERGED", "CONVERGED_WITH_DEVIATIONS", "NOT_CONVERGED"]
}
EOF

# -----------------------------------------------------------------------------
# Project artefact templates
# -----------------------------------------------------------------------------
cat > "${ROOT}/docs/01_work_order.md" <<'EOF'
# Work Order

## Metadata
- Customer:
- Initiative:
- Owner:
- Date:
- Status: DRAFT

## Context
## Business Problem
## Objectives
## Scope
### Included
### Excluded
## Actors
## Use Cases
## Current Systems
## Constraints
## Integrations
## Deliverables
## Assumptions
## Open Questions
## Approval
- Reviewed by:
- Decision:
- Date:
EOF

cat > "${ROOT}/docs/02_requirements.md" <<'EOF'
# Requirements

> Generated by Pre-sales Wave.

## Functional Requirements
Use IDs `REQ-001`, `REQ-002`, etc.

## Non-functional Requirements
Use IDs `NFR-001`, `NFR-002`, etc.

## Assumptions
## Constraints
## Open Questions
EOF

cat > "${ROOT}/docs/03_initial_architecture.md" <<'EOF'
# Initial Architecture

> Generated by Pre-sales Wave.

## Overview
## Architecture Style
## Main Components
## External Integrations
## Data Approach
## Security Considerations
## Deployment Approach
## Assumptions
## Risks
## Open Decisions
EOF

cat > "${ROOT}/docs/04_high_level_plan.md" <<'EOF'
# High-Level Plan

> Generated by Pre-sales Wave.

## Phases
## Milestones
## Deliverables
## Dependencies
## Risks
## Assumptions
## Validation Points
EOF

cat > "${ROOT}/docs/05_functional_design.md" <<'EOF'
# Functional Design

> Generated by Design Wave.

## Actors
## Capabilities
## Use Cases
Use IDs `UC-001`, `UC-002`, etc.

## Functional Flows
## Business Rules
Use IDs `BR-001`, `BR-002`, etc.

## Validation Rules
## Error Scenarios
## Assumptions
## Open Decisions
EOF

cat > "${ROOT}/docs/06_detailed_requirements.md" <<'EOF'
# Detailed Requirements

> Generated by Design Wave.

## Requirement Catalogue
For each requirement include ID, description, priority, source and status.

## Acceptance Criteria
## Business Rules
## Edge Cases
## Traceability References
EOF

cat > "${ROOT}/docs/07_data_model.yaml" <<'EOF'
version: 0.1.0
status: NOT_GENERATED

entities: []
relationships: []
constraints: []
assumptions: []
openDecisions: []
EOF

cat > "${ROOT}/docs/08_backend_architecture.md" <<'EOF'
# Backend Architecture

> Generated by Design Wave.

## Objective
## Architecture Style
## Modules
## Layers
## Domain Boundaries
## Application Services
## Input Adapters
## Output Adapters
## Persistence
## Integrations
## Security
## Error Management
## Observability
## Testing Approach
## Assumptions
## Open Decisions
EOF

cat > "${ROOT}/docs/09_api_catalog.yaml" <<'EOF'
version: 0.1.0
status: NOT_GENERATED

basePath: TBD
securitySchemes: []
resources: []
operations: []
commonErrors: []
assumptions: []
openDecisions: []
EOF

cat > "${ROOT}/docs/10_test_strategy.md" <<'EOF'
# Test Strategy

> Generated by Design Wave.

## Objectives
## Scope
## Test Levels
### Unit Tests
### Integration Tests
### Contract Tests
### API Tests
### Frontend Tests
### End-to-End Tests
## Test Data
## Environments
## Entry Criteria
## Exit Criteria
## Evidence
## Risks and Limitations
EOF

cat > "${ROOT}/docs/11_technical_design.md" <<'EOF'
# Technical Design

> Generated by Design Wave.

## Components
## Interfaces
## Data Persistence
## External Integrations
## Security
## Configuration
## Error Handling
## Observability
## Performance
## Scalability
## Deployment
## Technical Risks
## Open Decisions
EOF

cat > "${ROOT}/docs/12_architecture_document.md" <<'EOF'
# Architecture Document

> Generated by Design Wave.

## Executive Summary
## Context
## Architecture Principles
## Context View
## Logical View
## Component View
## Data View
## Integration View
## Security View
## Deployment View
## Operational View
## Architecture Decisions
Use IDs `ADR-001`, `ADR-002`, etc.

## Risks
## Assumptions
## Open Decisions
EOF

cat > "${ROOT}/docs/13_tasks.md" <<'EOF'
# Implementation Tasks

> Generated by Task-planning Wave.

## Status Summary
- Pending: 0
- Ready: 0
- In progress: 0
- Blocked: 0
- Completed: 0
- Failed: 0

## Task Template

### TASK-XX-001: Task title
- Type:
- Status: PENDING
- Requirements:
- Dependencies:
- Agent:
- Inputs:
- Allowed paths:
- Deliverables:
- Validation:
- Evidence:

## Tasks
_No tasks generated yet._
EOF

cat > "${ROOT}/docs/14_traceability_matrix.md" <<'EOF'
# Traceability Matrix

> Generated by Task-planning Wave.

## Coverage Summary
- Requirements: NOT_EVALUATED
- Business rules: NOT_EVALUATED
- Entities: NOT_EVALUATED
- API operations: NOT_EVALUATED
- Tasks: NOT_EVALUATED
- Tests: NOT_EVALUATED

## Matrix
| Source | Relationship | Target | Evidence | Status |
|---|---|---|---|---|

## Missing Relationships
_Not evaluated yet._
EOF

cat > "${ROOT}/docs/15_implementation_readiness.md" <<'EOF'
# Implementation Readiness

> Generated by Analysis Gate.

## Decision
`NOT_EVALUATED`

## Constitution Compliance
## Technology-profile Compliance
## Cross-artefact Consistency
## Traceability Coverage
## Blocking Findings
## Warnings
## Required Actions
EOF

cat > "${ROOT}/docs/16_convergence_report.md" <<'EOF'
# Convergence Report

> Generated by Convergence Gate.

## Decision
`NOT_EXECUTED`

## Requirement Coverage
## Task Completion
## API Convergence
## Data-model Convergence
## Architecture Compliance
## Test Evidence
## Approved Deviations
## Unapproved Drift
## Pending Actions
EOF

# Keep output folders in Git
for directory in backend frontend api db scripts data tests docs; do
  cat > "${ROOT}/outputs/${directory}/.gitkeep" <<EOF
# Keeps outputs/${directory} under version control.
EOF
done

# Validate JSON
if command -v python3 >/dev/null 2>&1; then
  while IFS= read -r -d '' json_file; do
    python3 -m json.tool "${json_file}" >/dev/null
  done < <(find "${ROOT}/contracts" -type f -name '*.json' -print0)
  echo "JSON contracts and schemas validated."
else
  echo "Warning: python3 not found; JSON validation skipped."
fi

echo "Open Spec Delivery Factory initialised successfully."