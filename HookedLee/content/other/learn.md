---
title: "Hugo Bear Neo - Complete User Guide"
date: 2026-01-15T08:00:00+08:00
description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags: [
    "markdown",
    "syntax",
]
toc: true
imageZoom: true
upvote: true
---

# Hugo Bear Neo - Complete User Guide

This guide will teach you how to manage and customize your Hugo Bear Neo blog effectively.

## Table of Contents
1. [Getting Started](#getting-started)
2. [Daily Post Workflow](#daily-post-workflow)
3. [Adding Posts](#adding-posts)
4. [Deleting Posts](#deleting-posts)
5. [Theme Configuration](#theme-configuration)
6. [Adding Sections to Top](#adding-sections-to-the-top)
7. [Pinning Pages](#pinning-pages)
8. [Customizing Fonts](#customizing-fonts)
9. [Customizing Header and Footer](#customizing-header-and-footer)
10. [Beautifying Your Website](#beautifying-your-website)
11. [Customizing Post Headers](#customizing-post-headers)
12. [Post Header Settings](#post-header-settings)
13. [Overriding with Custom Presets](#overriding-with-custom-presets)
14. [Deploying to GitHub Pages](#deploying-to-github-pages)
15. [Deploying to AWS S3](#deploying-to-aws-s3)
16. [Automated Deployment](#automated-deployment)

---

## Getting Started

### Quick Setup for New Users

If you're just starting with Hugo Bear Neo, follow these steps:

```bash
# 1. Navigate to your project directory
cd /path/to/hugo-bearneo

# 2. Run the development server
hugo server -D

# 3. Open your browser
# Visit http://localhost:1313
```

### Understanding the Directory Structure

```
hugo-bearneo/
├── config.toml              # Site configuration
├── content/                 # Your content
│   └── blog/               # Blog posts
│       ├── post-1.md
│       └── post-2.md
├── layouts/                # Custom templates
│   ├── _default/          # Override theme templates
│   └── partials/          # Reusable components
├── static/                 # Static files (images, CSS, JS)
│   ├── img/
│   ├── css/
│   └── js/
├── archetypes/             # Content templates
└── resources/              # Generated resources
```

---

## Daily Post Workflow

### Efficient Daily Blogging Workflow

Here's a streamlined workflow for creating and publishing posts daily:

#### Step 1: Create a New Post

```bash
# Create a new post with today's date
hugo new blog/$(date +%Y-%m-%d)-my-post-title.md
```

This creates a file with a descriptive name like `2026-01-16-my-post-title.md`

#### Step 2: Write Your Content

Open the created file and add your content:

```bash
# Edit with your preferred editor
code content/blog/2026-01-16-my-post-title.md
# or
vim content/blog/2026-01-16-my-post-title.md
```

#### Step 3: Preview Locally

```bash
# Run the development server with draft posts included
hugo server -D

# Open browser to http://localhost:1313
```

#### Step 4: Check for Issues

- **Review the post** for typos and formatting
- **Test links** to ensure they work
- **Check mobile view** (resize your browser)
- **Verify images** load correctly

#### Step 5: Publish the Post

Remove `draft = true` from the front matter (if present):

```toml
+++
title = "My Post Title"
date = "2026-01-16T11:28:00+08:00"
draft = false  # Change from true to false or remove this line
+++
```

#### Step 6: Build and Deploy

```bash
# Build the site
hugo

# Deploy using your preferred method (see deployment sections below)
```

### Working with Drafts

For posts you're not ready to publish:

```toml
+++
title = "Future Post"
date = "2026-01-16T11:28:00+08:00"
draft = true  # Won't appear in production
+++
```

Preview drafts locally:

```bash
hugo server -D  # -D includes draft posts
```

### Scheduled Publishing

Set a future date to automatically publish on that day:

```toml
+++
title = "Scheduled Post"
date = "2026-12-25T09:00:00+08:00"  # Will publish on Christmas 2026
+++
```

Hugo will automatically show the post after the specified date.

### Quick Daily Checklist

- [ ] Create new post file
- [ ] Add front matter (title, date, tags)
- [ ] Write content in Markdown
- [ ] Add images to `static/img/` if needed
- [ ] Preview locally with `hugo server -D`
- [ ] Check on mobile
- [ ] Remove `draft = true` or set correct date
- [ ] Commit to Git (if using version control)
- [ ] Deploy to production

### Batch Creating Posts

Create multiple posts at once:

```bash
# Create multiple posts for the week
hugo new blog/monday-post.md
hugo new blog/tuesday-post.md
hugo new blog/wednesday-post.md
hugo new blog/thursday-post.md
hugo new blog/friday-post.md
```

Then edit each one as needed.

### Using a Custom Archetype

Create a template at `archetypes/blog.md`:

```toml
+++
title = "{{ replace .Name "-" " " | title }}"
date = "{{ .Date }}"
draft = true
tags = ["blog"]
+++

## Introduction

Write your introduction here...

## Main Content

Write your main content here...

## Conclusion

Write your conclusion here...
```

Now when you run `hugo new blog/my-post.md`, it will use this template automatically.

---

## Adding Posts

### Method 1: Using Hugo CLI (Recommended)

Run the following command in your project root:

```bash
hugo new blog/your-post-title.md
```

This creates a new post in the `content/blog/` directory with the following front matter:

```toml
+++
title = "Your Post Title"
date = "2026-01-16T11:28:00+08:00"
tags = ["tag1", "tag2"]
+++

This is a page about »Your Post Title«.
```

### Method 2: Manually Creating Files

1. Create a new `.md` file in `content/blog/`
2. Add the front matter at the top:
```toml
+++
title = "Your Post Title"
date = "2026-01-16T11:28:00+08:00"
tags = ["blog"]
+++
```

### Post Front Matter Options

```toml
+++
title = "Required: Your post title"
date = "Required: Publication date (ISO 8601 format)"

# Optional: SEO description
description = "An optional description for SEO. If not provided, an automatically created summary will be used."

# Optional: Tags for categorization
tags = ["tag1", "tag2", "tag3"]

# Optional: Hide from post list (default: false)
hidden = false

# Optional: Enable/disable TOC for this specific post (overrides global setting)
toc = true

# Optional: Enable/disable image zoom for this specific post (overrides global setting)
imageZoom = true

# Optional: Enable/disable upvote for this specific post (overrides global setting)
upvote = true
+++
```

---

## Deleting Posts

### Deleting a Post File

Simply delete the markdown file from the `content/blog/` directory:

```bash
rm content/blog/your-post-title.md
```

### Hiding a Post (Without Deleting)

If you want to keep the post but hide it from the post list, add `hidden = true` to the front matter:

```toml
+++
title = "Hidden Post"
date = "2026-01-16T11:28:00+08:00"
hidden = true
+++
```

The post will still be accessible via direct URL but won't appear in the blog list.

---

## Adding Sections to the Top

### Understanding Navigation

The navigation menu is defined in `layouts/partials/nav.html`. By default, it shows:
- Home link
- Custom menu items (from `hugo.toml`)
- Blog link

### Adding Menu Items in Configuration

Edit your `hugo.toml` file to add custom menu items:

```toml
[[menu.main]]
name = "About"
url = "/about/"

[[menu.main]]
name = "Projects"
url = "/projects/"

[[menu.main]]
name = "GitHub"
url = "https://github.com/yourusername"
```

### Creating Section Pages

Create individual pages in the `content/` directory:

**Example: Creating an About page**

1. Create `content/about.md`:
```toml
+++
title = "About"
date = "2026-01-16T11:28:00+08:00"
+++

# About Me

Write your about content here...
```

2. The page will be accessible at `https://yoursite.com/about/`

### Adding Pages to Navigation without Menu Config

To make pages appear in the navigation without editing `hugo.toml`, you can use the `menu` parameter in front matter:

```toml
+++
title = "About"
date = "2026-01-16T11:28:00+08:00"
menu = "main"
+++
```

### Creating Blog Subsections

To create a subsection within the blog (e.g., `/blog/tutorials/`):

1. Create directory: `content/blog/tutorials/`
2. Add an `_index.md`:
```toml
+++
title = "Tutorials"
date = "2026-01-16T11:28:00+08:00"
+++
```
3. Add posts in that directory: `content/blog/tutorials/my-tutorial.md`

---

## Pinning Pages

### Pinning Posts to the Top

Hugo Bear Neo doesn't have built-in pinning, but you can achieve it by:

#### Method 1: Using Date Manipulation

Set the date of posts you want to pin to future dates. They'll appear at the top:

```toml
+++
title = "Pinned Post"
date = "2099-01-01T00:00:00+08:00"
+++
```

#### Method 2: Using Front Matter Parameter (Custom Implementation)

1. Add `pinned = true` to posts you want to pin:

```toml
+++
title = "Important Post"
date = "2026-01-16T11:28:00+08:00"
pinned = true
+++
```

2. Modify `layouts/_default/list.html` to handle pinned posts. Create a custom list template that sorts pinned posts first.

#### Method 3: Using Hugo's Weight Parameter

Add a `weight` parameter to control order (lower numbers appear first):

```toml
+++
title = "Important Post"
date = "2026-01-16T11:28:00+08:00"
weight = 1
+++
```

Then in `hugo.toml`, configure sorting:

```toml
[params]
  # Add this to your list template to use weight
  sortBy = "weight"
```

---

## Customizing Fonts

### Understanding the Font System

Fonts are defined in `layouts/partials/style.html` using CSS variables:

```css
:root {
    --font-primary: Verdana, sans-serif;
    --font-secondary: monospace;
    --font-size-primary: 1em;
    --font-size-secondary: 0.8em;
}
```

### Method 1: Changing System Fonts

Edit `layouts/partials/style.html` and modify the CSS variables:

```css
:root {
    /* Change primary font */
    --font-primary: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
    
    /* Change secondary font (used for dates, code) */
    --font-secondary: 'Fira Code', 'Courier New', monospace;
    
    /* Adjust font sizes */
    --font-size-primary: 1.1em;  /* Body text */
    --font-size-secondary: 0.9em;  /* Small text */
}
```

### Method 2: Using Google Fonts (Recommended)

1. Create a new file `layouts/partials/custom_head.html`:
```html
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&family=JetBrains+Mono:wght@400;500&display=swap" rel="stylesheet">
```

2. Edit `layouts/partials/style.html` to use these fonts:
```css
:root {
    --font-primary: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
    --font-secondary: 'JetBrains Mono', 'Courier New', monospace;
}
```

### Method 3: Self-Hosted Fonts

1. Place your font files in `static/fonts/`
2. Add font-face declarations in `layouts/partials/style.html`:
```css
@font-face {
    font-family: 'CustomFont';
    src: url('/fonts/custom-font.woff2') format('woff2'),
         url('/fonts/custom-font.woff') format('woff');
    font-weight: 400;
    font-display: swap;
}

:root {
    --font-primary: 'CustomFont', sans-serif;
}
```

### Font Customization Examples

#### For a Clean Modern Look:
```css
--font-primary: 'Inter', system-ui, -apple-system, sans-serif;
--font-size-primary: 1rem;
```

#### For a Classic Typewriter Feel:
```css
--font-primary: 'Georgia', 'Times New Roman', serif;
--font-secondary: 'Courier Prime', monospace;
```

#### For a Tech/Developer Style:
```css
--font-primary: 'JetBrains Mono', 'Fira Code', monospace;
--font-size-primary: 0.95em;
```

---

## Customizing Header and Footer

### Understanding the Header

The header is defined in `layouts/partials/header.html`:

```html
<a href="{{ "" | relURL }}" class="title">
  <h1>{{ .Site.Title }}</h1>
</a>
<nav>{{- partial "nav.html" . -}}</nav>
```

### Customizing the Site Title

Edit `hugo.toml`:

```toml
[params]
  title = "Your Awesome Blog"
```

### Adding a Logo to the Header

1. Create `layouts/partials/custom_header.html`:
```html
<div class="header-content">
  <img src="/img/logo.png" alt="Logo" class="logo">
  <a href="{{ "" | relURL }}" class="title">
    <h1>{{ .Site.Title }}</h1>
  </a>
</div>
<nav>{{- partial "nav.html" . -}}</nav>
```

2. Add styles in `layouts/partials/style.html`:
```css
.header-content {
    display: flex;
    align-items: center;
    gap: 12px;
}

.logo {
    height: 40px;
    width: 40px;
    object-fit: contain;
}
```

3. Modify `layouts/_default/baseof.html` to include your custom header:
```html
<header>
  {{ partial "custom_header.html" . }}
</header>
```

### Customizing the Footer

The footer is defined in `layouts/partials/footer.html`. You can:

#### Hide Footer Elements

In `hugo.toml`:

```toml
[params.footer]
    hideCopyright = false      # Hide copyright notice
    hideSitemap = false        # Hide sitemap link
    hideMadeWithLine = false   # Hide "Made with Hugo Bear Neo"
    hideRSSAndEmail = false    # Hide RSS and email links
```

#### Adding Custom Footer Content

1. Create `layouts/partials/custom_footer.html`:
```html
{{ if ne .Site.Params.Footer.hideCopyright true }}
<div class="footer-section">
  {{ .Site.Params.copyright }}
</div>
{{ end }}

<!-- Custom links -->
<div class="footer-links">
  <a href="/privacy">Privacy Policy</a>
  <a href="/terms">Terms of Service</a>
  <a href="/contact">Contact</a>
</div>

<!-- Social media icons -->
<div class="social-links">
  <a href="https://twitter.com/yourhandle" target="_blank">Twitter</a>
  <a href="https://github.com/yourhandle" target="_blank">GitHub</a>
</div>
```

2. Modify `layouts/_default/baseof.html`:
```html
<footer>
  {{ partial "custom_footer.html" . }}
</footer>
```

3. Add styles:
```css
.footer-section {
    margin-bottom: 12px;
}

.footer-links {
    margin-bottom: 12px;
}

.footer-links a {
    margin: 0 8px;
}

.social-links a {
    margin: 0 8px;
}
```

### Changing Copyright Text

In `hugo.toml`:

```toml
[params]
    copyright = "© 2026 Your Name. All rights reserved."
```

---

## Beautifying Your Website

### 1. Customizing Color Scheme

Edit `layouts/partials/style.html`:

```css
:root {
    /* Light theme colors */
    --bg-color-primary: #ffffff;
    --bg-color-secondary: #f5f5f7;
    --text-color-primary: #1d1d1f;
    --text-color-secondary: #6e6e73;
    --link-color: #0066cc;
    --link-visited-color: #551a8b;
    --border-color: #d2d2d7;
}

@media (prefers-color-scheme: dark) {
    /* Dark theme colors */
    :root {
        --bg-color-primary: #000000;
        --bg-color-secondary: #1c1c1e;
        --text-color-primary: #f5f5f7;
        --text-color-secondary: #86868b;
        --link-color: #2997ff;
        --link-visited-color: #bf5af2;
        --border-color: #38383a;
    }
}
```

### 2. Adjusting Layout and Spacing

In `layouts/partials/style.html`:

```css
body {
    max-width: var(--width-max);  /* Default: 720px */
    padding: 20px;
    line-height: 1.6;
}

h1, h2, h3, h4, h5, h6 {
    margin: 24px 0 16px 0;  /* Increase heading margins */
    line-height: 1.3;
}

content {
    line-height: 1.8;  /* Increase line spacing for better readability */
}
```

### 3. Styling Links and Buttons

```css
a {
    color: var(--link-color);
    text-decoration: none;
    border-bottom: 1px solid transparent;
    transition: all 0.2s ease;
}

a:hover {
    text-decoration: none;
    border-bottom-color: var(--link-color);
}
```

### 4. Customizing Images

```css
img {
    max-width: 100%;
    border-radius: 8px;  /* More rounded corners */
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    margin: 24px auto;
}

/* Add image hover effect */
img:hover {
    box-shadow: 0 4px 16px rgba(0, 0, 0, 0.15);
    transform: scale(1.02);
    transition: all 0.3s ease;
}
```

### 5. Styling Code Blocks

```css
pre code {
    display: block;
    padding: 20px;
    border-radius: 8px;
    overflow-x: auto;
    font-size: 14px;
    line-height: 1.6;
}

div.highlight {
    margin: 24px 0;
}

div.highlight pre {
    border: 1px solid var(--border-color);
}
```

### 6. Customizing Blockquotes

```css
blockquote {
    border-left: 4px solid var(--link-color);
    color: var(--text-color-secondary);
    margin: 24px 0;
    padding: 16px 24px;
    background-color: var(--bg-color-secondary);
    border-radius: 0 8px 8px 0;
}

blockquote p {
    margin: 0;
    font-style: italic;
}
```

### 7. Adding Animations

Add to `layouts/partials/style.html`:

```css
/* Fade in animation */
@keyframes fadeIn {
    from { opacity: 0; transform: translateY(10px); }
    to { opacity: 1; transform: translateY(0); }
}

content {
    animation: fadeIn 0.5s ease-out;
}

/* Smooth scroll */
html {
    scroll-behavior: smooth;
}
```

### 8. Adding a Back to Top Button

1. Add to `layouts/_default/baseof.html` before closing `</body>`:
```html
{{ if not .IsHome }}
<button id="back-to-top" class="back-to-top" aria-label="Back to top">
  ↑
</button>
<style>
  .back-to-top {
    position: fixed;
    bottom: 30px;
    right: 30px;
    background: var(--link-color);
    color: white;
    border: none;
    border-radius: 50%;
    width: 45px;
    height: 45px;
    font-size: 20px;
    cursor: pointer;
    display: none;
    z-index: 100;
    transition: all 0.3s ease;
  }
  
  .back-to-top:hover {
    background: var(--text-color-primary);
    transform: translateY(-3px);
  }
</style>
<script>
  window.addEventListener('scroll', function() {
    const btn = document.getElementById('back-to-top');
    if (window.pageYOffset > 300) {
      btn.style.display = 'block';
    } else {
      btn.style.display = 'none';
    }
  });
  
  document.getElementById('back-to-top').addEventListener('click', function() {
    window.scrollTo({ top: 0, behavior: 'smooth' });
  });
</script>
{{ end }}
```

---

## Customizing Post Headers

### Understanding Post Header Structure

The post header is defined in `layouts/_default/single.html`:

```html
{{ if eq .Type "blog" }}
{{ if not .Params.menu }}
<h1>{{ .Title }}</h1>
{{ if .Date }}
<p>
  <i>
    <time datetime='{{ .Date.Format "2006-01-02" }}' pubdate>
      {{ .Date.Format (default "02 Jan, 2006" .Site.Params.dateFormat) }}
    </time>
  </i>
</p>
{{ end }}
{{ end }}
{{ end }}
```

### Adding Author Information

1. Add author to post front matter:
```toml
+++
title = "My Post"
date = "2026-01-16T11:28:00+08:00"
author = "John Doe"
+++
```

2. Modify `layouts/_default/single.html`:
```html
{{ if .Params.author }}
<p class="post-author">
  By {{ .Params.author }}
</p>
{{ end }}
```

### Adding Reading Time

Hugo has built-in reading time functionality. Add to `layouts/_default/single.html`:

```html
<p class="post-meta">
  <i>
    <time datetime='{{ .Date.Format "2006-01-02" }}' pubdate>
      {{ .Date.Format (default "02 Jan, 2006" .Site.Params.dateFormat) }}
    </time>
  </i>
  <span class="reading-time">{{ .ReadingTime }} min read</span>
</p>
```

### Adding Tags with Better Styling

```html
<div class="post-tags">
  {{ range (.GetTerms "tags") }}
  <a href="{{ .Permalink }}" class="tag">#{{ .LinkTitle }}</a>
  {{ end }}
</div>
```

Add styles:
```css
.post-tags {
    margin-top: 24px;
}

.tag {
    display: inline-block;
    background-color: var(--bg-color-secondary);
    padding: 4px 12px;
    margin: 4px 4px 4px 0;
    border-radius: 16px;
    font-size: 0.85em;
    transition: all 0.2s ease;
}

.tag:hover {
    background-color: var(--link-color);
    color: white;
    text-decoration: none;
}
```

### Adding Featured Images

1. Add to post front matter:
```toml
+++
title = "My Post"
date = "2026-01-16T11:28:00+08:00"
featuredImage = "/img/featured-image.jpg"
+++
```

2. Modify `layouts/_default/single.html`:
```html
{{ if .Params.featuredImage }}
<img src="{{ .Params.featuredImage }}" alt="{{ .Title }}" class="featured-image">
{{ end }}
```

3. Add styles:
```css
.featured-image {
    width: 100%;
    height: 300px;
    object-fit: cover;
    border-radius: 8px;
    margin: 0 0 24px 0;
}
```

---

## Post Header Settings

### Complete List of Front Matter Parameters

Here's a comprehensive list of all front matter parameters you can use in your posts:

```toml
+++
# Required Parameters
title = "Your Post Title"              # Post title
date = "2026-01-16T11:28:00+08:00"     # Publication date

# Optional Parameters
description = "SEO description"         # Meta description for SEO
tags = ["tag1", "tag2"]                # Category tags

# Display Control
hidden = false                         # Hide from post list
weight = 1                             # Control display order (lower = first)
pinned = true                          # Pin post (requires custom implementation)

# Feature Overrides
toc = true                             # Enable/disable TOC for this post
imageZoom = true                       # Enable/disable image zoom
upvote = true                          # Enable/disable upvote button

# Author Information
author = "John Doe"                    # Post author
email = "john@example.com"             # Author email

# Content Settings
featuredImage = "/img/image.jpg"       # Featured image path
draft = false                          # Mark as draft (not published)
publishDate = "2026-01-20"            # Future publication date

# Menu Configuration
menu = "main"                          # Add to main navigation
weight = 10                            # Menu item weight

# SEO Parameters
keywords = ["keyword1", "keyword2"]    # Meta keywords
images = ["/img/og-image.jpg"]         # Open Graph images

# Custom Parameters (you can add your own)
series = "Tutorial Series"             # Custom series tag
category = "Tutorials"                 # Custom category
difficulty = "Beginner"                # Custom difficulty level
+++
```

### Using Date Parameters

```toml
+++
date = "2026-01-16T11:28:00+08:00"     # Full timestamp
publishDate = "2026-01-20"             # Future publication date
lastmod = "2026-01-17"                 # Last modified date
expiryDate = "2030-01-01"             # Expiry date
+++
```

### Custom Date Format

In `hugo.toml`:

```toml
[params]
    # Format options: https://gohugo.io/functions/format/
    dateFormat = "January 2, 2006"     # Full date
    # dateFormat = "2006-01-02"        # ISO format
    # dateFormat = "02 Jan. 2006"      # Short format
```

---

## Overriding with Custom Presets

### Understanding Hugo's Override System

Hugo allows you to override theme templates and partials by creating files in your project's `layouts/` directory that match the theme's structure.

### Method 1: Overriding Templates

To override a theme template, create a file with the same path in your project:

**Example: Override the single post template**

1. Create `layouts/_default/single.html`
2. Copy the theme's version and modify it:
```html
{{ define "main" }}
<!-- Your custom single post layout -->
{{ if eq .Type "blog" }}
<div class="post-header">
  <h1>{{ .Title }}</h1>
  <div class="post-meta">
    <span class="date">{{ .Date.Format "2006-01-02" }}</span>
    <span class="author">{{ .Params.author | default "Anonymous" }}</span>
    <span class="reading-time">{{ .ReadingTime }} min read</span>
  </div>
</div>
{{ end }}

<content>{{ .Content }}</content>

<!-- Custom post footer -->
<div class="post-footer">
  <div class="tags">
    {{ range (.GetTerms "tags") }}
    <a href="{{ .Permalink }}" class="tag">{{ .LinkTitle }}</a>
    {{ end }}
  </div>
</div>
{{ end }}
```

### Method 2: Overriding Partials

**Example: Override the navigation**

1. Create `layouts/partials/nav.html`:
```html
<a href="{{ "" | relURL }}" class="nav-link">Home</a>
{{ range .Site.Menus.main }}
<a href="{{ .URL }}" class="nav-link">{{ .Name }}</a>
{{ end }}
{{ with .Site.GetPage "/blog" }}
<a href="{{ "blog/" | relURL }}" class="nav-link">Blog</a>
{{ end }}

<!-- Add search icon -->
<a href="#search" class="nav-link search-icon">🔍</a>
```

### Method 3: Creating Custom Presets

Create a system to easily switch between different styles:

1. Create `layouts/partials/style_custom.html`:
```html
<style>
    {{ if eq .Site.Params.stylePreset "minimal" }}
    /* Minimal preset */
    :root {
        --font-primary: 'Inter', sans-serif;
        --bg-color-primary: #ffffff;
        --text-color-primary: #000000;
        --link-color: #000000;
    }
    {{ else if eq .Site.Params.stylePreset "warm" }}
    /* Warm preset */
    :root {
        --font-primary: 'Georgia', serif;
        --bg-color-primary: #faf9f5;
        --text-color-primary: #2c241b;
        --link-color: #c45c26;
    }
    {{ else if eq .Site.Params.stylePreset "tech" }}
    /* Tech preset */
    :root {
        --font-primary: 'JetBrains Mono', monospace;
        --bg-color-primary: #0d1117;
        --text-color-primary: #c9d1d9;
        --link-color: #58a6ff;
    }
    {{ else }}
    /* Default preset */
    :root {
        --font-primary: Verdana, sans-serif;
        --bg-color-primary: #ffffff;
        --text-color-primary: #1a1a1a;
        --link-color: #0066cc;
    }
    {{ end }}
</style>
```

2. Add to `hugo.toml`:
```toml
[params]
    stylePreset = "minimal"  # Options: "minimal", "warm", "tech", or remove for default
```

3. Modify `layouts/_default/baseof.html` to include your custom styles:
```html
<head>
    {{ partial "style_custom.html" . }}
    {{ partial "style.html" . }}
</head>
```

### Method 4: Per-Page Customization

Add custom parameters to individual pages:

```toml
+++
title = "My Post"
date = "2026-01-16T11:28:00+08:00"

# Custom styling for this post
customStyle = "dark"
+++
```

Then create `layouts/_default/single.html` with conditional styling:

```html
{{ if eq .Params.customStyle "dark" }}
<style>
    body {
        background-color: #000000;
        color: #ffffff;
    }
</style>
{{ end }}
```

### Method 5: Using Custom CSS Files

1. Create `static/css/custom.css`:
```css
/* Your custom styles */
body {
    font-family: 'Custom Font', sans-serif;
}

h1 {
    color: #ff6b6b;
}
```

2. Create `layouts/partials/custom_head.html`:
```html
<link rel="stylesheet" href="{{ "css/custom.css" | relURL }}">
```

3. The theme will automatically include this if it exists, or add it to `layouts/_default/baseof.html`:
```html
<head>
    {{ partial "custom_head.html" . }}
</head>
```

### Method 6: Seasonal Theme Switching

Add to `layouts/partials/style_custom.html`:

```html
<style>
    {{ $now := now }}
    {{ if ge (now.Month) 12 }}{{ /* December - Winter */ }}
    :root {
        --link-color: #a855f7;
        --bg-color-primary: #faf5ff;
    }
    {{ else if and (ge (now.Month) 3) (le (now.Month) 5) }}{{ /* Spring */ }}
    :root {
        --link-color: #22c55e;
        --bg-color-primary: #f0fdf4;
    }
    {{ else if and (ge (now.Month) 6) (le (now.Month) 8) }}{{ /* Summer */ }}
    :root {
        --link-color: #f97316;
        --bg-color-primary: #fff7ed;
    }
    {{ else }}{{ /* Fall */ }}
    :root {
        --link-color: #eab308;
        --bg-color-primary: #fefce8;
    }
    {{ end }}
</style>
```

---

## Theme Configuration

### Complete config.toml Reference

Here's a comprehensive configuration file for Hugo Bear Neo:

```toml
# Basic Site Configuration
baseURL = "https://yourdomain.com/"
languageCode = "en-us"
title = "My Awesome Blog"

# Theme Configuration
theme = "hugo-bearneo"

# Build Configuration
[build]
  writeStats = true  # Generate stats for CSS optimization

# Markup Configuration (Allow HTML)
[markup]
  [markup.goldmark]
    [markup.goldmark.renderer]
      unsafe = true  # Allow raw HTML in markdown

  # Syntax Highlighting
  [markup.highlight]
    lineNos = false       # Show line numbers
    lineNumbersInTable = true
    noClasses = false     # Use CSS classes for highlighting
    style = "monokai"     # Highlighting style

  # Table of Contents
  [markup.tableOfContents]
    startLevel = 2       # Start from h2
    endLevel = 3         # End at h3
    ordered = false      # Use bullet points

# Site Parameters
[params]
  # Date Format
  dateFormat = "January 2, 2006"

  # Copyright
  copyright = "© 2026 Your Name. Licensed under CC BY-NC-SA 4.0"

  # Author Information
  [params.author]
    name = "Your Name"
    email = "your.email@example.com"

  # Social Links
  [params.social]
    github = "https://github.com/yourusername"
    twitter = "https://twitter.com/yourusername"
    linkedin = "https://linkedin.com/in/yourusername"

  # Blog Settings
  [params.blog]
    toc = true                  # Enable table of contents
    tocPosition = "right"       # TOC position: "left" or "right"
    imageZoom = true            # Enable image zoom
    upvote = true               # Enable upvote button

  # Footer Settings
  [params.footer]
    hideCopyright = false       # Hide copyright notice
    hideSitemap = false         # Hide sitemap link
    hideMadeWithLine = false    # Hide "Made with Hugo Bear Neo"
    hideRSSAndEmail = false     # Hide RSS and email links

  # RSS Configuration
  [params.rss]
    includeContent = true       # Include full content in RSS
    limit = 10                  # Number of posts in RSS feed

# Taxonomies (Tags and Categories)
[taxonomies]
  tag = "tags"
  category = "categories"

# Permalinks
[permalinks]
  blog = "/blog/:slug"
  tags = "/tag/:slug"
  categories = "/category/:slug"

# Navigation Menu
[[menu.main]]
  name = "Home"
  url = "/"
  weight = 1

[[menu.main]]
  name = "Blog"
  url = "/blog/"
  weight = 2

[[menu.main]]
  name = "About"
  url = "/about/"
  weight = 3

[[menu.main]]
  name = "Tags"
  url = "/tags/"
  weight = 4

# Output Formats
[outputs]
  home = ["HTML", "RSS"]
  section = ["HTML"]
  taxonomy = ["HTML"]
  term = ["HTML", "RSS"]

# Privacy Settings
[privacy]
  [privacy.disqus]
    disable = true
  [privacy.googleAnalytics]
    disable = false
    anonymizeIP = true
    respectDoNotTrack = true

# Minification
[minify]
  [minify.tdewolff]
    [minify.tdewolff.html]
      keepWhitespace = false

# Service Worker (for PWA)
[params.serviceWorker]
  enable = false  # Set to true to enable PWA features
```

### Theme-Specific Features

#### Enabling Table of Contents

The TOC feature automatically generates a table of contents from your headings:

```toml
[params.blog]
  toc = true              # Enable globally
  tocPosition = "right"   # Position: "left" or "right"
```

Per-post override:

```toml
+++
title = "My Post"
toc = false  # Disable TOC for this post only
+++
```

#### Image Zoom Feature

Enable click-to-zoom on images:

```toml
[params.blog]
  imageZoom = true  # Enable globally
```

Per-post override:

```toml
+++
title = "My Post"
imageZoom = false  # Disable for this post
+++
```

#### Upvote Button

Enable an upvote/like button on posts:

```toml
[params.blog]
  upvote = true  # Enable globally
```

Per-post override:

```toml
+++
title = "My Post"
upvote = false  # Disable for this post
+++
```

### Advanced Configuration

#### Custom Favicon

Place your favicon in the `static/` directory:

```bash
# Add favicon files
static/favicon.ico
static/favicon-16x16.png
static/favicon-32x32.png
static/apple-touch-icon.png
```

Add to `layouts/partials/custom_head.html`:

```html
<link rel="icon" type="image/png" sizes="32x32" href="{{ "favicon-32x32.png" | relURL }}">
<link rel="icon" type="image/png" sizes="16x16" href="{{ "favicon-16x16.png" | relURL }}">
<link rel="apple-touch-icon" sizes="180x180" href="{{ "apple-touch-icon.png" | relURL }}">
```

#### Google Analytics

Add to `layouts/partials/custom_head.html`:

```html
{{ if not .Site.IsServer }}
<!-- Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-XXXXXXXXXX"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'G-XXXXXXXXXX');
</script>
{{ end }}
```

#### Plausible Analytics (Privacy-Friendly)

Add to `layouts/partials/custom_head.html`:

```html
{{ if not .Site.IsServer }}
<script defer data-domain="yourdomain.com" src="https://plausible.io/js/script.js"></script>
{{ end }}
```

#### Comments System (Disqus, Utterances, Giscus)

For Disqus, add to `layouts/partials/comments.html`:

```html
{{ if and (not .Site.IsServer) .Params.comments }}
<div id="disqus_thread"></div>
<script>
  var disqus_config = function () {
    this.page.url = "{{ .Permalink }}";
    this.page.identifier = "{{ .UniqueID }}";
  };
  (function() {
    var d = document, s = d.createElement('script');
    s.src = 'https://YOUR_SHORTNAME.disqus.com/embed.js';
    s.setAttribute('data-timestamp', +new Date());
    (d.head || d.body).appendChild(s);
  })();
</script>
<noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
{{ end }}
```

Then add to your post template `layouts/_default/single.html`:

```html
{{ partial "comments.html" . }}
```

---

## Deploying to GitHub Pages

### Method 1: Using gh-pages Branch (Recommended)

This method keeps your source code in the `main` branch and publishes to the `gh-pages` branch.

#### Step 1: Build Your Site

```bash
# Build the site
hugo

# Verify the public directory was created
ls public/
```

#### Step 2: Push to GitHub Pages

```bash
# Create a clean gh-pages branch
git checkout --orphan gh-pages
git --work-tree public add --all
git --work-tree public commit -m "Initial deploy"
git push origin gh-pages
```

#### Step 3: Configure GitHub Pages

1. Go to your repository on GitHub
2. Click **Settings** → **Pages**
3. Under **Source**, select `gh-pages` branch
4. Click **Save**

Your site will be live at `https://YOUR_USERNAME.github.io/YOUR_REPO_NAME/`

### Method 2: Using GitHub Actions (Automated)

Create `.github/workflows/hugo.yml`:

```yaml
name: Deploy Hugo site to GitHub Pages

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  build-deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
        with:
          submodules: true
          fetch-depth: 0

      - name: Setup Hugo
        uses: peaceiris/actions-hugo@v2
        with:
          hugo-version: 'latest'
          extended: true

      - name: Build
        run: hugo --minify

      - name: Deploy
        uses: peaceiris/actions-gh-pages@v3
        if: github.ref == 'refs/heads/main'
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./public
```

Commit and push:

```bash
git add .github/workflows/hugo.yml
git commit -m "Add GitHub Actions workflow"
git push
```

### Method 3: Using Script (Simple Deploy)

Create a script `deploy.sh`:

```bash
#!/bin/bash

# Build the site
echo "Building site..."
hugo

# Commit to gh-pages branch
echo "Deploying to GitHub..."
cd public
git init
git checkout -b gh-pages
git add .
git commit -m "Deploy to GitHub Pages"
git push -f git@github.com:YOUR_USERNAME/YOUR_REPO_NAME.git gh-pages

# Cleanup
cd ..
rm -rf public

echo "Deployed successfully!"
```

Make it executable and run:

```bash
chmod +x deploy.sh
./deploy.sh
```

### Custom Domain Setup

1. Create a file named `CNAME` in the `static/` directory:

```bash
echo "yourdomain.com" > static/CNAME
```

2. Configure DNS:
   - Add a CNAME record pointing to `YOUR_USERNAME.github.io`
   - Or use A records for GitHub Pages IPs

3. Enable HTTPS in GitHub Pages settings

---

## Deploying to AWS S3

### Prerequisites

```bash
# Install AWS CLI
# On macOS
brew install awscli

# On Linux
sudo apt-get install awscli

# Configure AWS credentials
aws configure
```

### Method 1: Manual Upload

#### Step 1: Build Your Site

```bash
hugo
```

#### Step 2: Create S3 Bucket

```bash
# Create bucket
aws s3 mb s3://your-bucket-name

# Enable static website hosting
aws s3 website s3://your-bucket-name/ \
  --index-document index.html \
  --error-document 404.html

# Set bucket policy for public read
cat > bucket-policy.json <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PublicReadGetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::your-bucket-name/*"
    }
  ]
}
EOF

aws s3api put-bucket-policy \
  --bucket your-bucket-name \
  --policy file://bucket-policy.json
```

#### Step 3: Upload Files

```bash
# Sync files to S3
aws s3 sync public/ s3://your-bucket-name \
  --delete \
  --cache-control "max-age=31536000, public"

# Set content type for HTML files
aws s3 cp public/ s3://your-bucket-name/ \
  --recursive \
  --exclude "*" \
  --include "*.html" \
  --content-type "text/html; charset=utf-8" \
  --cache-control "max-age=3600, public"
```

#### Step 4: Configure CloudFront (Optional but Recommended)

```bash
# Create CloudFront distribution
aws cloudfront create-distribution \
  --distribution-config '{
    "CallerReference": "your-bucket-dist",
    "Aliases": {
      "Quantity": 1,
      "Items": ["yourdomain.com"]
    },
    "DefaultCacheBehavior": {
      "TargetOriginId": "S3-your-bucket-name",
      "ViewerProtocolPolicy": "redirect-to-https",
      "MinTTL": 3600,
      "ForwardedValues": {
        "QueryString": false,
        "Cookies": {"Forward": "none"}
      },
      "TrustedSigners": {"Enabled": false, "Quantity": 0},
      "DefaultTTL": 86400,
      "MaxTTL": 31536000
    },
    "Origins": {
      "Quantity": 1,
      "Items": [{
        "Id": "S3-your-bucket-name",
        "DomainName": "your-bucket-name.s3-website-us-east-1.amazonaws.com",
        "CustomOriginConfig": {
          "HTTPPort": 80,
          "HTTPSPort": 443,
          "OriginProtocolPolicy": "http-only"
        }
      }]
    },
    "Comment": "Hugo blog distribution",
    "Enabled": true,
    "PriceClass": "PriceClass_100"
  }'
```

### Method 2: Using Deploy Script

Create `deploy-s3.sh`:

```bash
#!/bin/bash

# Configuration
BUCKET_NAME="your-bucket-name"
CLOUDFRONT_ID="YOUR_CLOUDFRONT_DISTRIBUTION_ID"

# Build the site
echo "Building Hugo site..."
hugo

# Sync to S3
echo "Syncing to S3..."
aws s3 sync public/ s3://$BUCKET_NAME \
  --delete \
  --cache-control "max-age=31536000, public"

# Invalidate CloudFront cache (optional)
echo "Invalidating CloudFront cache..."
aws cloudfront create-invalidation \
  --distribution-id $CLOUDFRONT_ID \
  --paths "/*"

echo "Deployment complete!"
echo "Site URL: http://$BUCKET_NAME.s3-website-us-east-1.amazonaws.com"
```

Make it executable:

```bash
chmod +x deploy-s3.sh
./deploy-s3.sh
```

### Method 3: Using AWS CLI with Profile

If you have multiple AWS accounts:

```bash
# Use specific profile
aws s3 sync public/ s3://your-bucket-name \
  --profile your-profile-name \
  --delete
```

### Setting Up Custom Domain with Route 53

```bash
# Create hosted zone if you don't have one
aws route53 create-hosted-zone \
  --name yourdomain.com \
  --caller-reference $(date +%s)

# Add alias record to S3
aws route53 change-resource-record-sets \
  --hosted-zone-id YOUR_ZONE_ID \
  --change-batch '{
    "Changes": [{
      "Action": "CREATE",
      "ResourceRecordSet": {
        "Name": "yourdomain.com",
        "Type": "A",
        "AliasTarget": {
          "HostedZoneId": "Z3AQBSTGFYJSTF",
          "DNSName": "s3-website-us-east-1.amazonaws.com",
          "EvaluateTargetHealth": false
        }
      }
    }]
  }'
```

---

## Automated Deployment

### Setting Up Git Hooks

Create `.git/hooks/pre-commit`:

```bash
#!/bin/bash

# Run Hugo build check
echo "Checking Hugo build..."
hugo

if [ $? -ne 0 ]; then
  echo "Hugo build failed. Commit aborted."
  exit 1
fi

echo "Hugo build successful. Proceeding with commit..."
```

Make it executable:

```bash
chmod +x .git/hooks/pre-commit
```

### CI/CD Pipeline Options

#### GitHub Actions (Complete Example)

Create `.github/workflows/deploy.yml`:

```yaml
name: Build and Deploy

on:
  push:
    branches: [main]

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout
        uses: actions/checkout@v4
        with:
          submodules: true

      - name: Setup Hugo
        uses: peaceiris/actions-hugo@v2
        with:
          hugo-version: 'latest'
          extended: true

      - name: Build
        run: hugo --minify

      - name: Deploy to S3
        uses: jakejarvis/s3-sync-action@v0.5.1
        with:
          args: --delete
        env:
          AWS_S3_BUCKET: ${{ secrets.AWS_S3_BUCKET }}
          AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
          AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          AWS_REGION: 'us-east-1'
          SOURCE_DIR: 'public'

      - name: CloudFront Invalidation
        uses: chetan/invalidate-cloudfront-action@v2
        env:
          AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
          AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          AWS_REGION: 'us-east-1'
          DISTRIBUTION_ID: ${{ secrets.AWS_DISTRIBUTION_ID }}
```

Set up secrets in GitHub repository settings:
- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `AWS_S3_BUCKET`
- `AWS_DISTRIBUTION_ID`

### Using Makefile for Easy Deployment

Create `Makefile`:

```makefile
.PHONY: build clean serve deploy-s3 deploy-github

# Build the site
build:
	hugo --minify

# Clean build files
clean:
	rm -rf public resources

# Serve locally
serve:
	hugo server -D

# Deploy to S3
deploy-s3: build
	aws s3 sync public/ s3://your-bucket-name --delete
	aws cloudfront create-invalidation --distribution-id YOUR_ID --paths "/*"

# Deploy to GitHub Pages
deploy-github: build
	./deploy.sh

# Deploy to all
deploy-all: deploy-s3 deploy-github
```

Usage:

```bash
make build        # Build site
make serve        # Serve locally
make deploy-s3    # Deploy to S3
make deploy-github # Deploy to GitHub
```

### Netlify Drop (Simple Alternative)

```bash
# Install Netlify CLI
npm install -g netlify-cli

# Deploy in one command
netlify deploy --prod --dir=public
```

### Vercel Deployment

Install Vercel CLI:

```bash
npm install -g vercel
```

Deploy:

```bash
vercel --prod
```

---

## Quick Reference Summary

### Common Commands

```bash
# Create new post
hugo new blog/your-post.md

# Build site
hugo

# Run local server
hugo server -D

# Clean build
rm -rf public && hugo
```

### Essential Files to Customize

- `hugo.toml` - Site configuration
- `layouts/_default/baseof.html` - Base template
- `layouts/_default/single.html` - Single post template
- `layouts/_default/list.html` - Post list template
- `layouts/partials/header.html` - Header
- `layouts/partials/footer.html` - Footer
- `layouts/partials/style.html` - CSS styles
- `archetypes/blog.md` - Post template

### Configuration Checklist

- [ ] Set site title and description
- [ ] Configure date format
- [ ] Set up navigation menu
- [ ] Customize colors
- [ ] Choose fonts
- [ ] Configure footer elements
- [ ] Enable/disable features (TOC, search, etc.)
- [ ] Set up RSS if needed
- [ ] Add favicon and share images

---

## Additional Resources

- [Hugo Documentation](https://gohugo.io/documentation/)
- [Hugo Bear Neo GitHub](https://github.com/rokcso/hugo-bearneo)
- [Bear Blog](https://bearblog.dev/)
- [Hugo Front Matter Documentation](https://gohugo.io/content-management/front-matter/)
- [CSS Custom Properties](https://developer.mozilla.org/en-US/docs/Web/CSS/Using_CSS_custom_properties)

---

## Tips and Best Practices

1. **Always test changes locally** using `hugo server -D` before deploying
2. **Use version control** (Git) to track your customizations
3. **Backup original theme files** before modifying them
4. **Keep customization files organized** in your project's `layouts/` directory
5. **Use descriptive commit messages** when updating your blog
6. **Optimize images** before uploading (use WebP format when possible)
7. **Write descriptive front matter** for better SEO
8. **Test on mobile devices** to ensure responsive design works
9. **Keep dependencies updated** (Hugo version)
10. **Regular backups** of your content directory

---

Happy blogging with Hugo Bear Neo! 🐻✨
