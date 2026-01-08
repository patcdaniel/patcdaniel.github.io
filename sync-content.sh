#!/bin/bash

# Sync script to copy content from Obsidian vault to Quartz blog
# Usage: ./sync-content.sh

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}Starting content sync...${NC}"

# Source: Your Obsidian vault
VAULT_DIR="/Users/patrick/Documents/Paper Notes"

# Destination: Quartz content directory
BLOG_DIR="/Users/patrick/Documents/Paper Notes/blog-quartz/content"

# Sync markdown files from "Personal Blog" folder in vault
echo -e "${BLUE}Syncing blog posts...${NC}"
if [ -d "$VAULT_DIR/Personal Blog" ]; then
    # Copy markdown files (excluding index.md which is managed separately)
    find "$VAULT_DIR/Personal Blog" -name "*.md" ! -name "index.md" -exec cp {} "$BLOG_DIR/posts/" \;
    echo -e "${GREEN}✓ Blog posts synced${NC}"
else
    echo "Warning: Personal Blog folder not found in vault"
fi

# Sync images (PNG and JPG files from vault root)
echo -e "${BLUE}Syncing images...${NC}"
find "$VAULT_DIR" -maxdepth 1 -type f \( -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" \) -exec cp {} "$BLOG_DIR/images/" \;
echo -e "${GREEN}✓ Images synced${NC}"

# Update image paths in markdown files (convert [[image.png]] to [[images/image.png]])
echo -e "${BLUE}Updating image paths in markdown files...${NC}"
for file in "$BLOG_DIR/posts"/*.md; do
    if [ -f "$file" ]; then
        # Update paths for images that don't already have the images/ prefix
        sed -i '' 's|\!\[\[\([^/]*\.\(png\|jpg\|jpeg\)\)\]\]|![[images/\1]]|g' "$file"
    fi
done
echo -e "${GREEN}✓ Image paths updated${NC}"

echo -e "${GREEN}Content sync complete!${NC}"
echo ""
echo "Next steps:"
echo "  1. Review synced content in content/posts/ and content/images/"
echo "  2. Build the site: npx quartz build"
echo "  3. Preview locally: npx quartz build --serve"
echo "  4. Commit and push to deploy"
