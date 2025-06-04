# SWITCH 2 MISSION CONTROL - OFFICIAL THEME REFERENCE

## 🚨 CRITICAL: This is the ONLY correct theme for Switch 2 Mission Control

### Panel Order (MUST BE EXACTLY THIS ORDER):
1. **TACTICAL TIMELINE** (Position 1: Top-Left) ⏰
2. **TACTICAL NAVIGATION** (Position 2: Top-Right) 📍
3. **MISSION COUNTDOWN** (Position 3: Bottom-Left) ⏱️
4. **ANNAPOLIS MISSION INTEL** (Position 4: Bottom-Right) 📊
5. **STOCK MONITORING** (Position 5: Bottom-Left) 📈
6. **SOCIAL INTELLIGENCE** (Position 6: Bottom-Right) 📱

### Color Scheme (NASA/LCARS Theme):
```css
:root {
    --nasa-blue: #0B3D91;
    --nasa-red: #FC3D21;
    --mission-green: #00ff41;
    --warning-orange: #FF8C42;
    --status-yellow: #FFD23F;
    --deep-space: #000814;
    --panel-dark: #001D3D;
    --text-cyan: #00F5FF;
    --accent-purple: #9A48D0;
}
```

### Panel Headers:
- **Background**: `linear-gradient(90deg, var(--nasa-red), var(--warning-orange))`
- **Text Color**: `white`
- **Font**: `Orbitron, monospace`

### Panel Content Areas:
- **Background**: `linear-gradient(145deg, var(--panel-dark), rgba(11, 61, 145, 0.3))`
- **Border**: `2px solid var(--text-cyan)`
- **Border Radius**: `10px`

### Body Background:
- **Background**: `linear-gradient(135deg, var(--deep-space) 0%, var(--nasa-blue) 100%)`

### Typography:
- **Primary Font**: `'Orbitron', monospace`
- **Mission Title**: `2.5em`, `font-weight: 900`, `color: var(--text-cyan)`
- **Mission Subtitle**: `1.2em`, `color: var(--nasa-red)`

### Status Colors (Stock Status Coloring):
- 🟢 **HIGH STOCK**: `#00ff41` (Mission Green)
- 🟡 **MEDIUM STOCK**: `#FFD23F` (Status Yellow)  
- 🔴 **LOW STOCK**: `#FC3D21` (NASA Red)
- 🔵 **BACKUP/READY**: `#00F5FF` (Text Cyan)
- 🟣 **HOME/COMMAND**: `#9A48D0` (Accent Purple)

### ❌ WHAT NOT TO DO:
- Never change the panel order
- Never use different gradient directions
- Never modify the NASA color scheme
- Never change the Orbitron font family
- Never alter the border styling

### ✅ FEATURES IMPLEMENTED:
- ✅ Panel collapsible functionality
- ✅ Full-width navigation expansion
- ✅ Google Maps integration with tactical styling
- ✅ Stock-status color coding for locations
- ✅ Real-time GPS tracking with trails
- ✅ Shared viewing capability
- ✅ GrubHub/DoorDash app integration

This theme reference must be consulted before making ANY changes to prevent theme drift.
