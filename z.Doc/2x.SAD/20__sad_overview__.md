# SAD - Software Architecture Design

## 1. Architecture Overview

The system uses a **static site generation** architecture:

```text
Markdown + metadata + assets
            |
            v
 scripts/build-markdown.py
            |
            v
 Static HTML + CSS/JS + images
            |
            v
       GitHub Pages
            |
            v
          Reader
```

## 2. Main Components

| Component | Responsibility | Dependencies |
| --- | --- | --- |
| `content/` | Markdown article source organized by section | Metadata, images |
| `data/site-sections.json` | Section names, descriptions, and header configuration | Build script |
| `_templates/` | HTML templates for articles, sections, and library pages | CSS/JS, asset paths |
| `scripts/build-markdown.py` | Parse front matter, render Markdown, and generate HTML/indexes | Python standard library, templates, data |
| `assets/` | Shared CSS, JavaScript, fonts, and images | Generated HTML |
| Root HTML pages | Generated pages or special static pages | Assets, GitHub Pages |

The category taxonomy, source-to-output convention, and repository tree are defined in [02__repo_map__.md](../0x.Ov/02__repo_map__.md).

## 3. Build and Deployment Flow

1. An editor creates or updates `content/<category>/<slug>.md`.
2. The build script reads front matter, Markdown, templates, and section configuration.
3. The script generates article HTML, updates section indexes, and preserves configured static directories.
4. Links, encoding, and generated output are checked.
5. Source and deployment output are committed for GitHub Pages.

## 4. Boundaries and Design Decisions

- **Runtime boundary:** GitHub Pages serves static files; there is no server-side request processing.
- **Content boundary:** `content/` is the source of truth for Markdown articles.
- **Presentation boundary:** templates define the HTML frame; `assets/` provides browser styling and behavior.
- **Configuration boundary:** section metadata is centralized in `data/site-sections.json`; some build mappings remain in the script (**Partially confirmed**).
- **Persistence:** there is no runtime persistence; repository files are the versioned data store.
- **Sidebar state:** shared JavaScript derives the active submenu from the current URL. On page load it expands the matching xyz, philosophy, library, or productivity submenu.

## 5. Risks and Follow-up Needs

- The build script contains direct section configuration, so new sections require synchronized updates.
- No automated CI build or link-check pipeline was found; validation currently depends on local workflow.
- Lighthouse, SEO, accessibility, and caching targets are not yet specified.
