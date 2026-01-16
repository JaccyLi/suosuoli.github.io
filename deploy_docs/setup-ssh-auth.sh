#!/bin/bash
# SSH Authentication Setup Script for Git

echo "=== SSH Key Setup for GitHub ==="
echo ""

# Check if SSH key exists
if [ -f ~/.ssh/id_ed25519.pub ]; then
    echo "✓ SSH key found!"
    echo ""
    echo "Your SSH public key:"
    echo "----------------------------------------"
    cat ~/.ssh/id_ed25519.pub
    echo "----------------------------------------"
    echo ""
    echo "Steps to add this key to GitHub:"
    echo "1. Copy the key above (including ssh-ed25519 at the start)"
    echo "2. Go to: https://github.com/settings/keys"
    echo "3. Click 'New SSH key'"
    echo "4. Title: WSL-Linux"
    echo "5. Paste the key"
    echo "6. Click 'Add SSH key'"
    echo ""
else
    echo "✗ SSH key not found. Generating one..."
    ssh-keygen -t ed25519 -C "suosuoli@github.com" -f ~/.ssh/id_ed25519 -N ""
    echo "✓ SSH key generated!"
fi

echo ""
echo "=== Switch Repository to SSH ==="
echo ""
echo "Current remote:"
git remote -v
echo ""

# Switch to SSH
read -p "Switch to SSH URL? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    cd /home/lisuo/blog/HookedLee
    git remote set-url origin git@github.com:jaccyli/suosuoli.github.io.git
    echo "✓ Remote switched to SSH"
    echo ""
    echo "New remote:"
    git remote -v
    echo ""

    # Test SSH connection
    echo "Testing SSH connection to GitHub..."
    ssh -T git@github.com 2>&1 | grep -v "PTY allocation" || true
    echo ""

    echo "Setup complete! You can now push without password:"
    echo "  git push origin main"
else
    echo "Skipped. To switch manually, run:"
    echo "  git remote set-url origin git@github.com:jaccyli/suosuoli.github.io.git"
fi

echo ""
echo "For credential helper (backup) option, run:"
echo "  git config --global credential.helper store"
