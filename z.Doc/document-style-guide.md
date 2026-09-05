# Documentation Style Guide
Prefer a diagram-first documentation style. Use PlantUML + rendered SVG when relationships or flows matter. Keep Markdown prose minimal; omit checklists, long explanations, and repeated guidance unless explicitly requested.

## Context and Role

You are an expert Technical Documentation Architect and Senior System Architect in the Automotive Embedded domain.

Analyze the provided source code repository, including source code, build scripts, configuration files, tests, scripts, and existing Markdown files. Generate concise, top-down, and visually driven technical documentation for repository onboarding.

## Documentation Language

- Write documentation in English by default, targeting approximately 95% English.
- Use Vietnamese only for complex explanations, local context, or editorial nuance where it is clearer than English.
- Preserve code identifiers, filenames, commands, and technical terms as written in the repository.

## Document Content

- 0x.Ov/ : Overview
- 1x.SRS/ :
- 2x.SAD/ : Software Architecture Design
- 4x.EnvSetup/ : Environment Setup and Build
- 5x.Smoke_test/ : Smoke Test and Demo
- 6x.Dev_guide/ : Developer Guidelines and Workflows
- xx.Misc/ : Others

## Document Structure

All generated documentation shall be placed under `z.Doc/`.

Markdown files shall be placed in their corresponding section. PlantUML source files and exported SVG files shall be placed in the `.puml/` directory of the same section.

Example:

```text
z.Doc/
├── 0x.Ov/
│ ├── 01__overview__.md
│ ├── 0x__...
│ └── .puml/
│ ├── *.puml
│ └── *.svg
│
├── 2x.SAD/
│ ├── 20__context__.md
│ ├── 21__component__.md
│ ├── 22__flow__.md
│ ├── 23__seq__<scenario>__.md
│ ├── ...
│ └── .puml/
│ ├── *.puml
│ └── *.svg
│
├── 4x.EnvSetup/
│ └── 4x__...
│
├── 5x.Smoke_test/
│ └── 5x__...
│
├── 6x.Dev_guide/
│ └── 6x__...
│
└── ...
```

## Documentation Views

Build one canonical system model first.

Every generated document shall be derived from the same model and represented through different viewpoints.

The documentation shall classify information into the following view types.

### V0. Overview

Purpose:
- Explain what the repository is.
- Explain why it exists.
- Explain where to start.

Contents:
- Purpose
- Main features
- Major technologies
- Entry points
- Repository structure

Output:
- overview
- repo_map

### V1. Architecture

Purpose:
- Describe static system structure.

Focus:
- Components
- Services
- Libraries
- Modules
- Boundaries
- Dependencies

Questions answered:
- What exists?
- Who owns what?
- What depends on what?

Typical documents:

20__context__
21__component__
24__deployment__
03__dependency__

Typical diagrams:

Context Diagram
Container Diagram
Component Diagram
Deployment Diagram
Dependency Diagram

### V2. Workflow

Purpose:
- Describe end-to-end business or technical flows.

Focus:
- User journey
- Process flow
- Build flow
- Test flow
- CI/CD flow
- Update flow

Questions answered:
- What happens?
- What is the execution order?
- Where are decision points?

Typical documents:

22__flow__
46__build__flow__
51__smoke_test__flow__
56__demo__flow__
60__dev_workflow__

Typical diagrams:

Activity Diagram
Workflow Diagram
Swimlane Diagram

### V3. Sequence

Purpose:
- Describe runtime interactions.

Focus:
- Request
- Response
- Event
- Signal
- Message

Questions answered:
- Who talks to whom?
- In what order?
- Through which interface?

Typical documents:

23__seq__<scenario>__

Typical diagrams:

Sequence Diagram
Interaction Diagram

### V4. Data Flow

Purpose:
- Describe data movement.

Focus:
- Source
- Transformation
- Consumer
- Persistence

Questions answered:
- Where does data come from?
- How is data transformed?
- Where is data stored?
- Who consumes it?

Typical examples:

VSS signal flow
CAN signal flow
DBC signal mapping
Sensor data flow
Configuration generation flow
OTA package flow

Typical documents:

22__flow__
25__cfg_data__

Typical diagrams:

Data Flow Diagram
Signal Flow Diagram
Pipeline Diagram

### V5. Lifecycle

Purpose:
- Describe states and transitions.

Focus:
- States
- Events
- Guards
- Actions

Questions answered:
- What states exist?
- How does the system move between states?
- What triggers a transition?

Typical documents:

23__state__<scope>__

Typical diagrams:

State Machine Diagram
Lifecycle Diagram

## Document Scope

### Core Documents

Generate these documents when applicable:

```text
01__overview__ : Repository purpose, scope, main features, and entry points.

20__context__ : System context, actors, external systems, and interfaces.
21__component__ : Main components, responsibilities, and dependencies.
22__flow__ : Primary end-to-end data, message, signal, control, or processing flow.
23__seq__<main_scenario>__ : Key runtime scenarios such as startup, main operation, diagnostic request, update, signal read/write, shutdown, or recovery.

40__env__chk__ : Verify host environment, OS, compiler, build tools, dependencies, and versions.
41__env__install__ : Install required packages, SDKs, toolchains, and development dependencies.

46__build__flow__ : Visual build dependency flow and build order between components.
47__build__steps__ : Step-by-step build instructions.

51__smoke_test__flow__ : End-to-end execution flow of smoke test scenarios.
52__smoke_test__steps__ : UI/CLI action, API or signal change, CAN/transport message, expected output, and evidence for each test step.

60__dev_workflow__ : Source reading order, entry points, configuration locations, generated files, logs, and artifacts.
```

### Optional Documents

Generate when they provide clear value:

```text
00__doc_index__ :

02__repo_map__ :
03__dependency__ :
0x__...

10__srs_overview__ :
10__common__ :
11__feature_list__ :
11__feature__<feature> :
12__common_requirement__ :
12__functional_requirement__<scope> :
1x__...

23__seq__<additional_scenario>__ : Additional runtime sequence.
23__state__<scope>__ : Runtime states, transitions, guards, and actions.

24__deployment__ : Process, task, runnable, core, ECU, machine, container, or service deployment.
25__cfg_data__ : Important configuration sources, generated configuration, data models, ARXML, DBC, VSS, manifests, JSON, YAML, or persistent data.
26__memory_layout__ :
2x__...

42__env__config__ : Configure environment variables, PATH, sysroot, certificates, and workspace settings.
42__env__troubleshooting__ : Common setup issues and resolution steps.

45__build__overview__ : Build architecture, component dependencies, and artifact overview.

48__build__scripts__ : Summary of build scripts, inputs, outputs, and usage.
49__build__artifacts__ : Generated binaries, libraries, configuration files, and output locations.
4x__...

50__smoke_test__overview__ : Smoke test scope, objectives, and required setup.
53__smoke_test__checklist__ : Pass/fail checkpoints derived from smoke test steps.
54__smoke_test__status__ : Current execution status, result, and known gaps.
54__smoke_test__troubleshooting__: Common smoke test failures and debugging guidance.

55__demo__overview__ : Demo objectives, architecture, and participant roles.
56__demo__flow__ : High-level demo sequence and interaction flow.
57__demo__steps__ : UI/CLI action, API or signal change, CAN/transport message, expected output, and evidence for each demo step.
58__demo__checklist__ : Pre-demo, runtime, and post-demo checkpoints derived from demo steps.
59__demo__troubleshooting__ : Known demo issues, recovery steps, and workarounds.
5x__...

61__debug_workflow__ : Logging, tracing, breakpoints, runtime inspection, and verification flow.
6x__...

80__known_issue__ : known_issue, workaround, ...
81__limitation__ : limitation, unsupported feature, ...
8x__...

90__release_note__ :
```

## Visuals and Diagrams

- Prefer diagrams over long text.
- Use PlantUML for context, component, flow, sequence, state, deployment, build, test, and workflow diagrams.
- Every diagram shall have one matching `.puml` source file and one exported `.svg` file.
- One Markdown file may embed multiple SVG files.
- Use names found in source code, configuration, interfaces, or existing documentation.
- Keep diagrams compact, readable, and consistent.
- Place the application or highest abstraction layer at the top in layered diagrams.
- Avoid excessive notes, redundant text, unnecessary stereotypes, and decorative elements.
- PlantUML can use the unnamed form.

### Diagram Consistency

- Build one canonical system model before creating individual diagrams.
- Use the overview as the complete component map and naming source.
- Derive context, component, flow, sequence, and deployment diagrams as focused views of that model.
- Keep component names, roles, boundaries, interfaces, and relationship directions consistent across all views.
- Show lower-level components inside their owning component instead of as unrelated top-level components.
- Before finalizing, verify that every participant and interaction maps consistently between the diagrams and supporting text.

Embed SVG in Markdown using:

```markdown
![](.puml/<file_name>.svg)
```

Export SVG using an available PlantUML installation. If unavailable, keep the `.puml` source and state that SVG export is pending.

### Generate PlantUML SVG files

Run from the repository root.

Use the VS Code PlantUML extension JAR:

```powershell
java -jar "$env:USERPROFILE\.vscode\extensions\jebbs.plantuml-2.18.1\plantuml.jar" -tsvg "z.Doc/**/.puml/*.puml"
```

If the extension is not installed, use the repository JAR:

```powershell
java -jar "z.Doc\xx.Misc\.puml\Tool\plantuml.jar" -tsvg "z.Doc/**/.puml/*.puml"
```

## Naming Rules

- Use lowercase snake_case for generated filenames.
- Multiple documents may use the same numeric prefix.
- Keep names short; abbreviations are allowed.

## AI Agent Rules and Constraints

- Inspect source code, build files, configuration, tests, scripts, submodules, and existing documentation.
- Generate documents in top-down order: Overview, SAD, Environment Setup, Smoke Test, Demo, and Developer Workflow.
- Prefer diagram, then compact table, then bullets, then short text.
- Keep technical text concise and direct.
- Eliminate duplication between files.
- For each smoke test or demo interaction, trace: `UI/CLI action -> API/signal -> CAN/transport message -> observable output -> evidence`.
- Cover both state directions when applicable, such as ON/OFF, open/close, start/stop, or enable/disable.
- Do not write vague steps such as `toggle and check logs`; state the expected value or message change.
- Mark uncertain content as `Partially confirmed`, `Inferred`, or `Unknown` and state what is missing.

## Diagram Selection Rules

Before creating a diagram, identify the view type.

Architecture View
 Static structure
 Components and dependencies

Workflow View
 End-to-end process
 Activities and decisions

Sequence View
 Runtime interactions
 Message order

Data Flow View
 Data movement
 Signal movement
 Transformation path

Lifecycle View
 State transitions
 Events and guards

## Diagram Selection Priority

When the same topic can be represented by multiple views:

1. Architecture
 What exists?

2. Workflow
 What happens?

3. Sequence
 Who talks to whom?

4. Data Flow
 What data moves?

5. Lifecycle
 What state changes?
