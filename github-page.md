# GitHub Pages Deployment Guide

This guide will help you deploy your Hugo blog to GitHub Pages with automated deployment via GitHub Actions.

## Your Blog Information

- **GitHub Pages URL**: https://jaccyli.github.io/suosuoli.github.io/
- **Framework**: Hugo (static site generator)
- **Theme**: hugo-bearneo
- **Languages**: English (default) and Chinese (中文)

---

## Prerequisites

1. **GitHub Repository**
   - Create a repository named `suosuoli.github.io` under your GitHub account (`jaccyli`)
   - Repository URL: `https://github.com/jaccyli/suosuoli.github.io`

2. **Local Development**
   - Install Hugo (extended version, >= 0.110.0)
     - macOS: `brew install hugo`
     - Linux: `sudo apt-get install hugo` or download from [gohugo.io](https://gohugo.io/installation/)
     - Windows: Download from [gohugo.io](https://gohugo.io/installation/)
   - Verify installation: `hugo version`

---

## Deployment Steps

### Step 1: Configure Your Repository

#### Option A: Using Existing Repository

If you already have the `suosuoli.github.io` repository:

```bash
# Initialize git if not already done
cd /home/lisuo/blog/HookedLee
git init

# Add your remote repository
git remote add origin https://github.com/jaccyli/suosuoli.github.io.git

# Or update existing remote
git remote set-url origin https://github.com/jaccyli/suosuoli.github.io.git
```

#### Option B: Create New Repository

If you need to create the repository:

1. Go to https://github.com/new
2. Repository name: `suosuoli.github.io`
3. Set to Public (required for free GitHub Pages)
4. Don't initialize with README
5. Click "Create repository"

Then push your code:

```bash
cd /home/lisuo/blog/HookedLee
git init
git add .
git commit -m "Initial commit: Hugo blog with bilingual support"
git branch -M main
git remote add origin https://github.com/jaccyli/suosuoli.github.io.git
git push -u origin main
```

### Step 2: Configuration Already Done

The following configurations are already set up in your repository:

#### 1. `hugo.toml` Configuration

The baseURL is configured for GitHub Pages:

```toml
baseURL = "https://jaccyli.github.io/suosuoli.github.io/"
```

**Note**: For local development, you can temporarily change it back to:
```toml
baseURL = "http://localhost:1313/"
```

#### 2. GitHub Actions Workflow

The `.github/workflows/hugo.yml` file is configured to:
- Automatically build your Hugo site on push to `main` branch
- Deploy to GitHub Pages
- Use Hugo extended version 0.140.2
- Minify output for optimal performance

### Step 3: Enable GitHub Pages

1. Go to your repository on GitHub: https://github.com/jaccyli/suosuoli.github.io
2. Click **Settings** tab
3. Navigate to **Pages** in the left sidebar
4. Under **Source**, select **GitHub Actions** (recommended)
5. GitHub Pages is now enabled!

### Step 4: Push to Trigger Deployment

```bash
# If you haven't pushed yet
git add .
git commit -m "Enable GitHub Pages deployment"
git push origin main
```

The GitHub Actions workflow will automatically:
1. Build your Hugo site
2. Deploy it to GitHub Pages
3. Your site will be live at: https://jaccyli.github.io/suosuoli.github.io/

### Step 5: Verify Deployment

1. Check the **Actions** tab in your GitHub repository
2. Wait for the workflow to complete (usually 1-2 minutes)
3. Visit https://jaccyli.github.io/suosuoli.github.io/
4. Test the language switch (English/中文) in the header

---

## Understanding the Configuration

### Language Switching

Your blog supports bilingual content:

- **English**: Default language, accessible at `/` or `/en/`
- **Chinese**: Accessible at `/zh/`

**How it works:**
- Hugo uses the configuration in `hugo.toml`:
  ```toml
  defaultContentLanguage = "en"

  [languages.en]
    languageCode = "en-US"
    languageName = "English"
    weight = 1

  [languages.zh]
    languageCode = "zh-CN"
    languageName = "中文"
    weight = 2
  ```

**Content Structure:**
- English content: `content/_index.md`, `content/bio.md`, etc.
- Chinese content: `content/_index.zh.md`, `content/bio.zh.md`, etc.

**URL Structure:**
- English homepage: `https://jaccyli.github.io/suosuoli.github.io/`
- Chinese homepage: `https://jaccyli.github.io/suosuoli.github.io/zh/`
- English post: `https://jaccyli.github.io/suosuoli.github.io/p/post-slug`
- Chinese post: `https://jaccyli.github.io/suosuoli.github.io/zh/p/post-slug`

### Base URL Configuration

The `baseURL` in `hugo.toml` is critical for:
- Generating correct links in navigation
- Ensuring language switching works
- Proper asset loading (CSS, JS, images)

**For GitHub Pages deployment:**
```toml
baseURL = "https://jaccyli.github.io/suosuoli.github.io/"
```

**For local development:**
```toml
baseURL = "http://localhost:1313/"
```

---

## GitHub Actions Workflow Explanation

The `.github/workflows/hugo.yml` file:

```yaml
on:
  push:
    branches: [main]  # Triggers on push to main branch
  workflow_dispatch:   # Allows manual trigger
```

**What happens:**
1. **Checkout**: Downloads your code
2. **Setup Hugo**: Installs Hugo extended version
3. **Build**: Runs `hugo --minify` to generate static files in `public/`
4. **Upload**: Uploads the `public/` directory as an artifact
5. **Deploy**: Deploys the artifact to GitHub Pages

---

## Local Development

While deployed, you may want to make changes locally:

```bash
# Serve locally with drafts and future posts
hugo server -D

# Or just serve
hugo server

# Visit http://localhost:1313/
```

**Before deploying changes:**
1. Test locally: `hugo server`
2. Update `baseURL` to GitHub Pages URL (if changed for local testing)
3. Commit and push: `git push origin main`
4. GitHub Actions will automatically deploy

---

## Custom Domain (Optional)

If you want to use a custom domain:

1. **Add CNAME file**:
   ```bash
   echo "yourdomain.com" > static/CNAME
   git add static/CNAME
   git commit -m "Add custom domain"
   git push origin main
   ```

2. **Configure DNS**:
   - Go to your domain provider
   - Add a CNAME record pointing to `jaccyli.github.io`

3. **Update baseURL** in `hugo.toml`:
   ```toml
   baseURL = "https://yourdomain.com/"
   ```

---

## Troubleshooting

### 404 Error When Accessing GitHub Pages URL

If you see a 404 error at https://jaccyli.github.io/suosuoli.github.io/, follow these steps:

#### Step 1: Verify GitHub Pages is Enabled

1. Go to: https://github.com/jaccyli/suosuoli.github.io/settings/pages
2. Check **"Source"** - It MUST be set to **"GitHub Actions"**
3. If it shows "None" or "Deploy from a branch", change it to "GitHub Actions"
4. This will automatically trigger a deployment

#### Step 2: Check Repository Visibility

1. Go to: https://github.com/jaccyli/suosuoli.github.io/settings
2. Under "Danger Zone", verify repository is **Public**
3. GitHub Pages requires **Public** repositories for free accounts
4. If it's Private, either:
   - Make it Public (recommended)
   - Upgrade to GitHub Pro

#### Step 3: Check GitHub Actions Status

1. Go to: https://github.com/jaccyli/suosuoli.github.io/actions
2. Look for recent workflow runs
3. **Green checkmark** ✓ = Success, wait a few minutes and refresh
4. **Red X** ✗ = Failed, click on it to see error logs
5. **Yellow dot** = Still running, wait for completion

#### Step 4: Wait for DNS Propagation

After a successful deployment:
- Wait 1-2 minutes for DNS to propagate
- Clear your browser cache (Ctrl+Shift+R or Cmd+Shift+R)
- Try accessing the URL again

#### Step 5: Verify Deployment Artifact

If Actions succeeded but site still shows 404:
1. Go to Actions tab
2. Click on the latest successful workflow run
3. Scroll to "Upload artifact" step
4. Verify the artifact was uploaded (should show ~600KB)
5. Check "Deploy to GitHub Pages" step succeeded

#### Quick Diagnostic Script

Run this script to check everything:
```bash
./check-deployment.sh
```

### Language Switch Not Working

**Problem**: Clicking the language switch doesn't change language.

**Solutions**:
1. Ensure `baseURL` is correctly set in `hugo.toml`
2. Check that both language files exist (e.g., `_index.md` and `_index.zh.md`)
3. Clear browser cache and try again
4. Verify the site is built with the correct baseURL

### Links Not Working After Deployment

**Problem**: Navigation links are broken.

**Solutions**:
1. Check `baseURL` in `hugo.toml` matches your GitHub Pages URL
2. Ensure the repository name is correct in the URL
3. Rebuild by pushing an empty commit:
   ```bash
   git commit --allow-empty -m "Trigger rebuild"
   git push origin main
   ```

### GitHub Actions Failing

**Problem**: Deployment workflow fails.

**Solutions**:
1. Check the Actions tab for error logs
2. Ensure Hugo version is compatible
3. Verify the repository is Public (for free GitHub Pages)
4. Check that GitHub Pages is enabled in Settings

### 404 Errors

**Problem**: Pages return 404.

**Solutions**:
1. Verify the deployment completed successfully
2. Check the URL structure (include `/suosuoli.github.io/` in the path)
3. Ensure the `public/` directory was generated correctly
4. Wait a few minutes for DNS propagation

### Language Prefix Missing

**Problem**: Chinese pages don't have `/zh/` prefix.

**Solution**:
This is handled automatically by Hugo. Ensure:
- Chinese files have `.zh.md` extension (e.g., `_index.zh.md`)
- The `languages.zh` configuration exists in `hugo.toml`
- Rebuild the site if changes were made

---

## Quick Reference

### Common Commands

```bash
# Local development
hugo server

# Build locally (to test)
hugo --minify

# Check Hugo version
hugo version

# Create new post (English)
hugo new content/blog/my-post.md

# Create new post (Chinese)
hugo new content/blog/my-post.zh.md
```

### Git Workflow

```bash
# Add all changes
git add .

# Commit changes
git commit -m "Description of changes"

# Push to trigger deployment
git push origin main

# Check deployment status
# Visit: https://github.com/jaccyli/suosuoli.github.io/actions
```

### Important URLs

- **Your Blog**: https://jaccyli.github.io/suosuoli.github.io/
- **Repository**: https://github.com/jaccyli/suosuoli.github.io
- **Actions**: https://github.com/jaccyli/suosuoli.github.io/actions
- **Settings**: https://github.com/jaccyli/suosuoli.github.io/settings/pages

---

## Best Practices

1. **Test Locally First**
   - Always test changes locally with `hugo server`
   - Check language switching works
   - Verify all links are correct

2. **Commit Messages**
   - Use clear, descriptive commit messages
   - Reference issues or features when applicable

3. **Content Management**
   - Keep English and Chinese content in sync
   - Use `.zh.md` extension for Chinese files
   - Follow the existing content structure

4. **Performance**
   - Images are automatically optimized by Hugo
   - The `--minify` flag reduces file sizes
   - Consider using WebP format for images

5. **SEO**
   - The theme includes OpenGraph and Twitter Cards
   - `robots.txt` is automatically generated
   - Ensure meta descriptions are set for each language

---

## Additional Resources

- [Hugo Documentation](https://gohugo.io/documentation/)
- [Hugo BearNeo Theme](https://github.com/CaiJimmy/hugo-bearneo)
- [GitHub Pages Documentation](https://docs.github.com/en/pages)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Hugo Multilingual Mode](https://gohugo.io/content-management/multilingual/)

---

## Support

If you encounter issues:

1. Check the [Troubleshooting](#troubleshooting) section
2. Review GitHub Actions logs
3. Search [Hugo Forums](https://discourse.gohugo.io/)
4. Check [GitHub Pages Status](https://www.githubstatus.com/)

---

**Happy blogging! 🎣**
