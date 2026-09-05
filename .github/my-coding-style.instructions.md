---
 description: "Use when: writing or editing Markdown documentation, onboarding notes, architecture notes, runtime flow notes, or debug checklists. Personal reusable documentation style."
 name: "My Documentation Style"
 applyTo: "**/*.md"
 ---
 # My Documentation Preferences

## Documentation Style

- Keep Markdown concise and practical.
 - Avoid rambling prose.
 - Prefer diagrams, then compact tables, bullets, checklists, and short text.
 - Reference source files by filename only; avoid Markdown links and repo paths unless explicitly requested.
 - Use lowercase snake_case filenames with numeric reading-order prefixes, such as `01__overview__.md`.
 - Use PlantUML for architecture, runtime, build, test, deployment, and workflow diagrams.
 - Use tables for addresses, file maps, decisions, breakpoints, and debug symptoms.
 - Write docs so a junior engineer can identify what to read first and where to set breakpoints.
 - When a PlantUML sequence has too many participants and the rendered image is too small to read, split it into 2 or 3 smaller diagrams for clarity.
 - Keep one canonical system model and use consistent source-derived names, boundaries, interfaces, and relationship directions across all documents.
 - Create matching `.puml` and `.svg` files under the section's `.puml/` directory; if SVG export is unavailable, state that it is pending.
 - Mark uncertain content as `Partially confirmed`, `Inferred`, or `Unknown`, and state the missing evidence.

## Document organization

- Place documents under `z.Doc/`: overview in `0x.Ov/`, architecture in `2x.SAD/`, setup/build in `4x.EnvSetup/`, smoke test/demo in `5x.Smoke_test/`, and developer/debug workflows in `6x.Dev_guide/`.
 - Generate documentation top-down and avoid duplication between files.
 - For smoke tests and demos, trace `UI/CLI action -> API/signal -> CAN/transport message -> observable output -> evidence`, including both state directions when applicable.

## Guideline and how-to style

- For setup or run guides, write short command-first step-by-step instructions with only the required prerequisites, edits, and commands, and keep each flow minimal.

## Copilot instructions update style

- When updating this file, keep new rules concise and prefer a single-line instruction unless the user asks for more detail.
 - When creating Markdown guides, onboarding notes, junior handover docs, architecture notes, or debug checklists, place them under the project's `z.Doc/` folder.

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

 ### Documentation style
Prefer a diagram-first documentation style. Use PlantUML + rendered SVG when relationships or flows matter. Keep Markdown prose minimal; omit checklists, long explanations, and repeated guidance unless explicitly requested.