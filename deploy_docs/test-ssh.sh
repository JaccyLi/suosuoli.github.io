#!/bin/bash
# Test SSH connection after adding key to GitHub

echo "Testing SSH connection to GitHub..."
echo ""

ssh -T git@github.com 2>&1 | grep -v "PTY allocation"

echo ""
if [ $? -eq 1 ]; then
    echo "✓ SSH connection successful!"
    echo ""
    echo "You can now push without password:"
    echo "  cd /home/lisuo/blog/HookedLee"
    echo "  git push origin main"
else
    echo "✗ SSH connection failed"
    echo ""
    echo "Make sure you added the SSH key to GitHub:"
    echo "  1. Go to: https://github.com/settings/keys"
    echo "  2. Click 'New SSH key'"
    echo "  3. Paste this key:"
    cat ~/.ssh/id_ed25519.pub
    echo ""
fi
