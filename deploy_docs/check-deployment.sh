#!/bin/bash
# Deployment Troubleshooting Script

echo "=== Checking GitHub Repository Status ==="
echo ""
echo "1. Checking remote URL..."
git remote -v

echo ""
echo "2. Checking recent commits..."
git log --oneline -3

echo ""
echo "3. Checking GitHub Actions workflow..."
if [ -f ".github/workflows/hugo.yml" ]; then
    echo "✓ GitHub Actions workflow exists"
    cat .github/workflows/hugo.yml
else
    echo "✗ GitHub Actions workflow not found"
fi

echo ""
echo "4. Testing local build..."
hugo --minify
if [ $? -eq 0 ]; then
    echo "✓ Local build successful"
    echo "  Generated files in: $(ls -1 public/ | wc -l) items"
else
    echo "✗ Local build failed"
fi

echo ""
echo "5. Checking baseURL in hugo.toml..."
grep "^baseURL" hugo.toml

echo ""
echo "=== Manual Checks Required ==="
echo "Please verify in your browser:"
echo "1. https://github.com/jaccyli/suosuoli.github.io/settings/pages"
echo "   - Source should be 'GitHub Actions'"
echo ""
echo "2. https://github.com/jaccyli/suosuoli.github.io/settings"
echo "   - Repository should be 'Public'"
echo ""
echo "3. https://github.com/jaccyli/suosuoli.github.io/actions"
echo "   - Check for recent workflow runs"
echo "   - Look for any errors"
