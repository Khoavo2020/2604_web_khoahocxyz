


# SRS - khoahoc.xyz

## 1. Purpose and Scope

`khoahoc.xyz` is a static website built as a knowledge hub + product platform. It publishes structured learning content, reading resources, and product pages. This SRS covers content authoring, build, and static delivery. Dynamic backend services and user accounts are out of scope.

## 2. Users and Actors

| Actor | Purpose |
| --- | --- |
| Reader | Browse sections, read articles, and view resources or products |
| Editor | Create and update Markdown content, metadata, and images |
| Build script | Validate and convert Markdown into HTML and section indexes |
| GitHub Pages | Serve static HTML, CSS, JavaScript, and image assets |

## 3. Functional Requirements

| ID | Requirement | Acceptance criteria |
| --- | --- | --- |
| FR-01 | Provide the home page and main sections | Navigation reaches science, economics, psychology, philosophy, library, productivity, and inspiration sections |
| FR-02 | Manage articles as Markdown | Articles are stored under `content/<category>/<slug>.md` with the required front matter |
| FR-03 | Build articles | `python scripts/build-markdown.py` generates HTML at the declared `output_path` |
| FR-04 | Build section indexes | Each section exposes a readable list of available articles and links |
| FR-05 | Render content and metadata | Titles, descriptions, images, links, tables, and supported Markdown formatting render correctly |
| FR-06 | Reuse presentation templates | Generated HTML uses templates from `_templates/` and shared assets from `assets/` |
| FR-07 | Publish as a static site | The website runs on GitHub Pages without an application server |
| FR-08 | Expand the active sidebar submenu after navigation | A page load opens the sidebar submenu matching the current section URL, including xyz, philosophy, library, and productivity |

## 4. Non-functional Requirements

- NFR-01: Source files and generated content use UTF-8; URLs use stable, unaccented slugs.
- NFR-02: Pages remain readable on mobile and desktop, with reading quality as the primary UI concern.
- NFR-03: Builds are reproducible from source; manually editing generated HTML is outside the normal workflow.
- NFR-04: The runtime has no mandatory database or application service dependency.
- NFR-05: Template or script changes must preserve configured static directories.

## 5. Data and Inputs

- Article source: `content/`.
- Templates: `_templates/`.
- Section configuration: `data/site-sections.json`.
- Shared UI resources: `assets/`.
- Deployment output: generated HTML directories at repository root.
- Category taxonomy and repository tree: [02__repo_map__.md](../0x.Ov/02__repo_map__.md).

## 6. Out of Scope and Assumptions

- No CMS, API, server-side search, authentication, or learning-progress storage is currently specified.
- Payments, analytics, and product administration are not specified in the current repository.
- Detailed performance, SEO, and accessibility targets are **Unknown** and require measurable goals before formalization.
