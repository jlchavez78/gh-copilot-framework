# 01 - Work Order

> Fuente original: `20260625 Solicitud inicial_revisión_dependencia.docx`
> Procedimiento: **2454 — Reconocimiento o revisión de la situación de dependencia y del derecho a las prestaciones del SAAD** (Ley 39/2006).
> Documento base: Formulario oficial de la Junta de Andalucía (Agencia de Servicios Sociales y Dependencia de Andalucía — ASSDA).

## Contexto
- **Cliente**: Junta de Andalucía — Agencia de Servicios Sociales y Dependencia de Andalucía (ASSDA).
- **Problema**:
    - Hoy la presentación del procedimiento 2454 se realiza mediante un formulario en papel/PDF extenso, con múltiples opciones, oposiciones, consentimientos y documentación adjunta variable según la situación del solicitante.
    - El proceso es complejo para el ciudadano (campos contextuales, documentación condicional, representación legal/voluntaria, etc.) y propenso a errores que retrasan el inicio del expediente.
    - Se necesita una **app web** que guíe la cumplimentación, valide los datos, gestione la documentación adjunta y permita la presentación electrónica de la solicitud.
- **Sistemas actuales** (supuestos a confirmar):
    - Portal y sede electrónica de la Junta de Andalucía.
    - Sistema de Notificaciones de la Administración de la Junta de Andalucía.
    - Sistema de Verificación de Datos de Identidad (SVDI).
    - Sistema de Verificación de Datos de Residencia (SVDR).
    - Servicio de Consulta de Prestaciones del Registro de Prestaciones Sociales Públicas (INSS).
    - Agencia Tributaria de Andalucía (IRPF / Impuesto sobre el Patrimonio).
    - Sistema interno de gestión de expedientes de dependencia de ASSDA (back-office, fuera de alcance de esta solicitud).

## Objetivo
Diseñar y construir una **aplicación web de tramitación online** que permita a la persona solicitante (o su representante legal/voluntario) cumplimentar, validar, firmar y presentar electrónicamente la **Solicitud de Reconocimiento o Revisión de la Situación de Dependencia** (procedimiento 2454), generando un PDF normalizado equivalente al formulario oficial y registrando la entrada en la sede electrónica.

## Alcance

### Incluido
- Formulario web multi-paso equivalente al formulario oficial, con las 10 secciones del documento original:
    1. Opciones de solicitud (reconocimiento inicial / revisión).
    2. Datos de la persona solicitante.
    3. Datos de la persona representante (física o jurídica) y tipo de representación.
    4. Datos sobre la situación de dependencia (ELA en fase avanzada, RD 969/2025).
    5. Tramitación preferente (6 supuestos).
    6. Lugar y medio de notificación (papel / electrónico).
    7. Declaración relativa al Impuesto sobre el Patrimonio.
    8. Derecho de oposición a consultas (identidad, residencia, prestaciones).
    9. Consentimiento expreso (IRPF, Impuesto sobre el Patrimonio).
    10. Documentación a aportar (condicional según secciones marcadas).
    11. Declaración final, lugar, fecha y firma.
- Lógica condicional: mostrar/ocultar campos y documentación obligatoria según opciones marcadas (representación, oposición, consentimiento, supuestos de tramitación preferente, etc.).
- Validaciones cliente y servidor (DNI/NIE/NIF, fechas, códigos postales, longitudes, requeridos contextuales).
- Subida de documentos adjuntos con catálogo dinámico según las opciones marcadas.
- Registro de documentos en poder de la Administración (Junta de Andalucía u otras Administraciones) con sus campos (documento, órgano, fecha, procedimiento).
- Generación de PDF normalizado de la solicitud, fiel al formulario oficial.
- Información básica sobre protección de datos (RGPD) visible y aceptable.
- Guardado de borradores y reanudación posterior.
- Vista de revisión final antes de firmar/presentar.
- Mensajería de estado tras presentación (acuse de recibo).
- Accesibilidad WCAG 2.1 AA (supuesto, a confirmar).
- Multidispositivo (responsive).

### Excluido
- Back-office de tramitación y resolución del expediente por parte de personal de ASSDA.
- Valoración del grado de dependencia y emisión de resolución administrativa.
- Programa Individual de Atención (PIA) y gestión de prestaciones.
- Integración con sistemas de pago o tesorería.
- Aplicación móvil nativa (se entrega web responsive).
- Migración de expedientes históricos.
- Gestión de roles y permisos del personal interno de la Administración.

## Usuarios
- **Persona solicitante** (mayor de edad o representada): rellena y firma la solicitud.
- **Representante legal**: padre/madre, tutor/a, curador/a, defensor/a judicial, apoderado notarial, guardador/a de hecho.
- **Representante voluntario** (general o exclusivo para presentar la solicitud).
- **Persona jurídica representante** (entidad con NIF y persona física titular).
- *(Fuera de alcance)* Personal de ASSDA, Servicios Territoriales, Delegación Territorial de Inclusión Social, Juventud, Familias e Igualdad.

## Casos de uso

### CU-01 — Iniciar nueva solicitud
- El usuario accede a la app, elige entre **Reconocimiento inicial** o **Revisión del grado** y comienza un nuevo borrador.

### CU-02 — Cumplimentar datos de la persona solicitante
- Captura de apellidos y nombre, DNI/NIE/NIF, fecha de nacimiento, nacionalidad, sexo, NUHSA, estado civil, situación familiar (hijos/as menores de 26 a cargo) y domicilio habitual (particular, centro residencial u otros) con desglose completo de vía.

### CU-03 — Cumplimentar datos de representación
- Si actúa representante, elegir entre persona física o jurídica, capturar datos y tipo de representación (legal, voluntaria general o voluntaria solo para presentar).

### CU-04 — Indicar situación de dependencia
- Marcar si tiene diagnosticada ELA en fase avanzada o enfermedad/proceso de alta complejidad y curso irreversible (RD 969/2025).

### CU-05 — Indicar supuesto de tramitación preferente
- Marcar uno o varios supuestos (4.1 a 4.6) que activan la tramitación preferente y su documentación asociada.

### CU-06 — Configurar lugar y medio de notificación
- Elegir notificación en papel (con domicilio completo) o electrónica (con email y opcionalmente móvil). Mostrar advertencia sobre validez de plazos.

### CU-07 — Declaración del Impuesto sobre el Patrimonio
- Marcar si está o no obligado a presentarla.

### CU-08 — Gestionar oposiciones a consultas
- Permitir oponerse a consultas vía SVDI, SVDR, prestaciones INSS, aportando la documentación acreditativa requerida.

### CU-09 — Gestionar consentimientos expresos
- Consentir o no la consulta de datos de IRPF e Impuesto sobre el Patrimonio.

### CU-10 — Aportar documentación
- Adjuntar la documentación obligatoria genérica (informe sobre condiciones de salud) y la condicional según lo marcado en secciones 2 (representación), 3 (situación dependencia), 4 (tramitación preferente), 7 (oposición) y 8 (consentimiento).

### CU-11 — Documentos en poder de la Administración
- Registrar hasta 8 documentos por origen (Junta de Andalucía / otras Administraciones) con: documento, Consejería/Agencia/Órgano, fecha de emisión o presentación y procedimiento.

### CU-12 — Revisar y firmar la solicitud
- Vista de revisión consolidada, aceptación de la declaración responsable, firma electrónica (Cl@ve, certificado digital, autofirma — *supuesto*).

### CU-13 — Presentar y obtener acuse
- Envío al registro electrónico, generación de PDF normalizado y acuse de recibo con número de registro.

### CU-14 — Guardar borrador y reanudar
- Persistir borradores incompletos y permitir continuar más tarde.

### CU-15 — Consultar solicitudes presentadas
- Listado de solicitudes del usuario con estado, fecha de presentación y acceso al PDF y acuse.

## Restricciones

### Normativas / legales
- Ley 39/2006, de 14 de diciembre, de promoción de la autonomía personal y atención a las personas en situación de dependencia.
- Ley 39/2015, de 1 de octubre, del procedimiento administrativo común (art. 28.2 sobre derecho de oposición).
- RGPD (Reglamento UE 2016/679) y LO 3/2018 de Protección de Datos.
- Orden de 28 de agosto de 2025 (tramitación preferente en Andalucía).
- Real Decreto 969/2025, de 28 de octubre.
- Ley 3/2024, de 30 de octubre.
- Ley 9/2016, de 27 de diciembre, de Servicios Sociales de Andalucía.
- Estatuto de Autonomía para Andalucía.

### Funcionales / de proceso
- El formulario digital debe ser equivalente y trazable con el formulario oficial en papel.
- El campo "Nº EXPEDIENTE" no lo cumplimenta el ciudadano (lo asigna la Administración).
- La cumplimentación debe permitir representación legal y voluntaria con sus respectivas documentaciones.
- La notificación electrónica requiere certificado electrónico u otros medios de identificación electrónica.
- Las personas beneficiarias están obligadas a comunicar cambios; la app debe contemplar (en evolución) un canal para ello (*fuera de alcance v1, marcado como supuesto*).

### Técnicas (supuestos a confirmar)
- Identificación y firma electrónica con **Cl@ve** y certificado digital (FNMT, DNIe).
- Integración con el **Sistema de Notificaciones** de la Junta de Andalucía.
- Integración con SVDI, SVDR e INSS para las consultas autorizadas.
- Cumplimiento del **Esquema Nacional de Seguridad (ENS)** y del **Esquema Nacional de Interoperabilidad (ENI)**.
- Accesibilidad **WCAG 2.1 AA** y conformidad con el RD 1112/2018.
- Multilingüe español (mínimo); valorar cooficiales en versiones futuras.
- Despliegue on-premise o nube acreditada (ENS) — pendiente de confirmar.

### Datos personales
- Responsable del tratamiento: Agencia de Servicios Sociales y Dependencia de Andalucía (Polígono Industrial Hytasa, Calle Seda, nº 5, 41006 Sevilla).
- DPD: dpd.assda@juntadeandalucia.es.
- Categorías especiales (datos de salud) tratadas en base al art. 9 RGPD (asistencia social/sanitaria).
- Cesiones: SAS, Inspección de Servicios Sociales, IMSERSO, otras CCAA con competencias en dependencia, FCSE y Autoridades Judiciales bajo requerimiento.
- Sin transferencias internacionales.

## Entregable
- Aplicación web de tramitación online del procedimiento 2454 (versión MVP demostrable).
- Documentación generada por las waves del framework (`03_requirements.md` → `13_ui_flows.md`).
- Backend (`/apps/api`), frontend React (`/apps/web`), esquema de BD (`/db/01_schema.sql`), colección Postman y OpenAPI (`/api/*`).
- Orquestación end-to-end con `docker compose up` para demo y validación con cliente.

---

## Anexo A — Catálogo de documentación condicional

| Sección | Documento | Condición que lo exige |
|---|---|---|
| 9 (genérico) | Informe sobre condiciones de salud (modelo normalizado, <3 meses) | Siempre |
| 9 | Anexo de oposición/consentimiento a consulta de datos | Casado/a, pareja de hecho o hijos/as <26 a cargo |
| 9 (representación legal) | Libro de familia o doc. de guarda y custodia | Representación legal de menores |
| 9 (representación legal) | Resolución/sentencia de tutela ordinaria | Tutela ordinaria |
| 9 (representación legal) | Resolución de tutela administrativa | Menores tutelados por la Junta |
| 9 (representación legal) | Resolución judicial de curatela/defensor judicial | Apoyo a la capacidad jurídica |
| 9 (representación legal) | Poder notarial | Representación con doc. público |
| 9 (representación legal) | Declaración de guardador/a de hecho | Guarda de hecho |
| 9 (representación voluntaria) | Autorización para representación voluntaria | Representación voluntaria |
| 9 (oposiciones, apartado 7) | Copia DNI/NIE/NIF solicitante | Oposición a SVDI solicitante |
| 9 (oposiciones, apartado 7) | Copia DNI/NIE representante | Oposición a SVDI representante |
| 9 (oposiciones, apartado 7) | Certificado de empadronamiento (5 años en España, 2 inmediatamente anteriores) | Oposición a SVDR |
| 9 (oposiciones, apartado 7) | Certificado del Registro de Prestaciones Sociales Públicas (INSS) | Oposición a consulta de prestaciones |
| 9 (apartado 8) | Copia declaración IRPF o certificado negativo | No consentimiento consulta IRPF |
| 9 (apartado 8) | Copia declaración Impuesto Patrimonio o certificado negativo | Obligado y no consiente consulta |
| 9 (3.1) | Certificado médico especialista de ELA en fase avanzada | Marca 3.1 |
| 9 (3.2) | Certificado médico especialista RD 969/2025 | Marca 3.2 |
| 9 (4.1) | Informe/certificado de diagnóstico ELA | Tramitación preferente 4.1 |
| 9 (4.2) | Informe/certificado de daño cerebral grave o lesión medular completa | Tramitación preferente 4.2 |
| 9 (4.3) | Informe/certificado de cuidados paliativos | Tramitación preferente 4.3 |
| 9 (4.4) | Informe de centro penitenciario / psiquiátrico / Servicio Protección Menores | Tramitación preferente 4.4 |
| 9 (4.5) | Informe del Servicio de Protección de Menores | Tramitación preferente 4.5 |
| 9 (4.6) | Dictamen de escolarización + informe facultativo | Tramitación preferente 4.6 |

## Anexo B — Supuestos abiertos para Wave 1
- Mecanismo de identificación y firma: **Cl@ve** + certificado digital (a confirmar).
- Integración con el Registro Electrónico Único y Sistema de Notificaciones de la Junta de Andalucía.
- Stack tecnológico final del backend (a decidir en Wave 1/2 según la arquitectura general del framework).
- Política de retención de borradores no presentados.
- Idiomas soportados en v1 (mínimo español).
- ¿Se entrega también una API pública para integración con otros sistemas de la Junta? (a confirmar)

## Anexo C — Datos del responsable del tratamiento (RGPD)
- **Responsable**: Agencia de Servicios Sociales y Dependencia de Andalucía.
- **Dirección**: Polígono Industrial Hytasa, Calle Seda nº 5, 41006 Sevilla.
- **Web**: https://www.juntadeandalucia.es/agenciadeserviciossocialesydependencia
- **DPD**: dpd.assda@juntadeandalucia.es
- **Información adicional del tratamiento**: https://juntadeandalucia.es/protecciondedatos/detalle/235726.html
- **Ejercicio de derechos**: https://juntadeandalucia.es/protecciondedatos
