# Developer Advocate Tools

This directory contains setup and configuration for tools commonly used by developer advocates for content creation, community management, and technical demonstrations.

## Tools Installed

### Content Creation
- **Loom** - Quick video recording and sharing for demos and tutorials
- **CleanShot X** - Advanced screenshot and screen recording with annotations
- **Asciinema** - Terminal session recording for CLI tutorials

### Design & Graphics
- **Figma** - UI/UX design, prototyping, and creating technical diagrams
- **Canva** - Quick graphics for social media, thumbnails, and presentations
- **Ray.so** - Beautiful code screenshots for documentation and social media

### Development & API Tools
- **Insomnia** - API design, testing, and documentation

### Documentation
- **Glow** - Render markdown beautifully in the terminal

### Community Management
- **Discord** - Community engagement and technical support

### Streaming & Live Coding
- **Elgato Stream Deck** - Control streaming, demos, and automation

### Security
- **1Password** - Secure password and API key management

### Productivity
- **Raycast** - Quick launcher with developer extensions

## Usage

### Terminal Recording with Asciinema
```bash
# Start recording
asciinema rec demo.cast

# Stop recording with Ctrl+D

# Play recording
asciinema play demo.cast

# Upload to asciinema.org
asciinema upload demo.cast
```

### Markdown Preview with Glow
```bash
# View README in terminal
glow README.md

# View with paging
glow README.md -p

# Fetch and render from URL
glow https://github.com/user/repo/blob/main/README.md
```

### Ray.so CLI (if installed)
```bash
# Create code screenshot
ray-so --code "console.log('Hello, World!')" --language javascript
```

## Web-Based Tools

Some tools are web-based and don't require installation:

- **Ray.so**: https://ray.so - Paste code and create beautiful screenshots
- **Canva**: https://canva.com - Also available as desktop app

## Post-Installation Setup

After installing these tools, you'll need to:

1. **1Password**: Sign in with your account and set up browser extensions
2. **Loom**: Sign in and configure recording preferences
3. **Discord**: Sign in to your communities
4. **Stream Deck**: Configure buttons and shortcuts with Elgato software
5. **Figma**: Sign in and sync your designs
6. **Insomnia**: Import your API collections

## Tips for Developer Advocates

### Quick Workflows

**Recording a Demo:**
1. Use CleanShot X for screen recording with annotations
2. Use Loom for quick video messages
3. Use Asciinema for terminal-only demos

**Creating Content:**
1. Design diagrams in Figma
2. Create code screenshots with Ray.so
3. Create social graphics with Canva
4. Record terminal sessions with Asciinema

**API Documentation:**
1. Test APIs in Insomnia
2. Export collections for documentation
3. Share workspace with team

**Community Engagement:**
1. Monitor Discord communities
2. Use Stream Deck for quick responses/reactions
3. Screen share with Loom for async help

### Keyboard Shortcuts to Set Up

Configure these in each tool for faster workflows:

- **CleanShot X**: Quick capture, annotation, recording
- **Raycast**: Quick launcher (already configured)
- **Loom**: Start/stop recording
- **Stream Deck**: Custom actions for streaming

## Additional Resources

- CleanShot X docs: https://cleanshot.com/docs
- Asciinema docs: https://asciinema.org/docs
- Insomnia docs: https://docs.insomnia.rest
- Glow GitHub: https://github.com/charmbracelet/glow
