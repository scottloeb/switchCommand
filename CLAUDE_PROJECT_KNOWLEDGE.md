# SWITCH 2 MISSION CONTROL - CLAUDE PROJECT KNOWLEDGE

## 🚨 CRITICAL: Always reference GitHub repo for current state

### GitHub Repository (PRIMARY SOURCE):
- **Main Repo**: https://github.com/scottloeb/switchCommand
- **Live Deployment**: https://switch-command.vercel.app
- **Theme Reference**: https://github.com/scottloeb/switchCommand/blob/main/THEME_REFERENCE.md

### File Structure (GitHub-based):
```
switchCommand/
├── index.html (main mission control interface)
├── THEME_REFERENCE.md (official theme documentation)
├── README.md (project overview)
├── vercel.json (deployment configuration)
└── deploy.sh (deployment script)
```

### MANDATORY Panel Order:
1. **TACTICAL TIMELINE** (Position 1) - ⏰ 
2. **TACTICAL NAVIGATION** (Position 2) - 📍 (WITH GOOGLE MAPS)
3. **MISSION COUNTDOWN** (Position 3) - 🎯
4. **ANNAPOLIS MISSION INTEL** (Position 4) - 📊
5. **STOCK MONITORING** (Position 5) - 📈
6. **SOCIAL INTELLIGENCE** (Position 6) - 📱

### Required Navigation Features:
- **Google Maps Integration**: Live map with tactical styling
- **Location Markers**: Color-coded for stock status
- **Real-time GPS**: Current location tracking
- **Route Planning**: Intelligent routing to selected locations
- **Full-width Expansion**: Map can expand to full dashboard width
- **Traffic Overlay**: Real-time traffic data
- **Movement Trails**: GPS tracking with purple trail lines

### Verified Working Map Features (from previous development):
- CENTER button (green) - centers map on user location
- ROUTE button (blue) - intelligent routing to clicked location  
- TRAFFIC button (teal) - toggles traffic overlay
- TRACK button (purple) - GPS tracking with movement trails
- LEGEND button - shows color code explanations
- Full-width EXPAND button in header

### Theme Requirements:
- **ALWAYS use NASA colors** from THEME_REFERENCE.md
- **NEVER change panel order** - Timeline MUST be first
- **Maintain Google Maps integration** in position 2
- **Preserve all working navigation features**

### API Integrations:
- **Google Maps API**: AIzaSyDhyuJmrGlrZvz3t5z1dKjOzHwt_OwrIaU
- **Referrer Restrictions**: *.vercel.app/*, localhost/*
- **Map Styling**: NASA tactical theme (dark satellite view)

### Development Workflow:
1. Check GitHub repo for current state
2. Reference THEME_REFERENCE.md for styling
3. Test changes locally first
4. Commit to GitHub (auto-deploys to Vercel)
5. Verify deployment matches expectations

### CRITICAL Success Factors:
- ✅ Timeline panel ALWAYS first position
- ✅ Navigation panel ALWAYS second position WITH working map
- ✅ NASA theme consistency across all panels
- ✅ Google Maps loads properly on Vercel deployment
- ✅ All navigation features functional (GPS, routing, tracking)
- ✅ No theme drift between local and deployed versions

### Common Failure Points to Avoid:
- ❌ Changing panel order during integration
- ❌ Removing Google Maps API or navigation features
- ❌ Theme inconsistencies between panels
- ❌ Breaking existing working functionality
- ❌ Not testing deployment after changes

### When Making Changes:
1. **Always check GitHub first** for current working version
2. **Reference live deployment** to verify expected behavior
3. **Preserve existing working features** 
4. **Test theme consistency** across all panels
5. **Verify Google Maps functionality** after integration
