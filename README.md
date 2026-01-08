# Patrick Daniel's Personal Blog

A clean, minimal blog built with [Quartz 4](https://quartz.jzhao.xyz/) and hosted on GitHub Pages.

## Quick Start

### Build and Preview
```bash
# Build and serve locally
npx quartz build --serve
```

### Sync Content from Obsidian Vault
```bash
# Run the sync script
./sync-content.sh
```

This script automatically:
- Copies markdown files from your Obsidian vault
- Syncs images to the `content/images/` directory
- Updates image paths in markdown files

## Project Structure

```
blog-quartz/
├── content/
│   ├── index.md              # Home page
│   ├── posts/                # Blog posts
│   └── images/               # Images for blog posts
├── quartz/                   # Quartz build system (don't edit)
├── public/                   # Build output (git-ignored)
├── sync-content.sh           # Sync script for Obsidian vault
├── quartz.config.ts          # Quartz configuration
└── quartz.layout.ts          # Page layout configuration
```

## ✏️ Writing New Posts

### Option 1: Write in Obsidian, then sync
1. Write your post in `/Users/patrick/Documents/Paper Notes/Personal Blog/`
2. Run `./sync-content.sh` to copy to Quartz
3. Build and preview

### Option 2: Write directly in Quartz
1. Create a new `.md` file in `content/posts/`
2. Add images to `content/images/`
3. Reference images with `![[images/your-image.png]]`

## Theme

Currently using **Tokyo Night** theme. To switch themes:

```bash
# Download a different theme (e.g., tokyo-night-storm)
curl -s "https://raw.githubusercontent.com/saberzero1/quartz-themes/master/themes/tokyo-night-storm/_index.scss" -o quartz/styles/themes/_index.scss

# Rebuild
npx quartz build
```

Browse more themes: [quartz-themes](https://github.com/saberzero1/quartz-themes)

## Deployment

Automatic deployment to GitHub Pages via GitHub Actions:
- Push to `main` branch triggers deployment
- Site URL: https://patcdaniel.github.io

## Configuration

- **Site title**: Edit `pageTitle` in `quartz.config.ts`
- **Footer links**: Edit `footer` in `quartz.layout.ts`
- **Theme colors**: Edit `theme.colors` in `quartz.config.ts`
- **Typography**: Edit `theme.typography` in `quartz.config.ts`

## Notes

- This is a clean Quartz installation without development files
- Your main Obsidian vault stays separate and private
- Only synced content gets published
- Images are automatically processed and optimized during build
