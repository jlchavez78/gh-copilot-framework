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
