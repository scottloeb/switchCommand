#!/bin/bash

echo "🚀 MISSION CONTROL REPOSITORY CONSOLIDATION"
echo "============================================"

cd /Users/scottloeb/Desktop/GitHub/switchCommand

echo "📊 Current repository status:"
git status

echo ""
echo "🎯 Adding enhanced Mission Control files..."
git add .

echo ""
echo "📝 Committing tactical timeline enhancement..."
git commit -m "🎯 TACTICAL TIMELINE - MISSION CONTROL CONSOLIDATION

✨ ENHANCED FEATURES DEPLOYED:
- Real-time tactical timeline with military clock display
- 3-phase mission structure per store (Departure/Lineup/Launch)
- Visual event states (past/future/active with animations)
- Auto-scroll to next event functionality
- Clickable events for Google Maps navigation
- Time-to-next countdown display
- Store-specific color coding and phase indicators
- Complete NASA aesthetic with collapsible panels
- Master controls (Expand/Collapse/Focus Mode)
- Mission log with export functionality
- Live system monitoring and diagnostics

🎯 MISSION TIMELINE:
- Best Buy: 06:30 Departure → 07:00 Lineup → 10:00 Launch  
- GameStop: 10:45 Departure → 11:00 Lineup → 12:00 Launch
- Target: 12:30 Departure → 12:45 Lineup → 14:00 Launch
- Walmart: 15:00 Departure → 15:15 Lineup → 16:00 Launch

🏛️ REPOSITORY CONSOLIDATION:
- Removed duplicate switch2-mission-command repository
- All development now in switchCommand (github.com/scottloeb/switchCommand)
- Ready for Vercel connection to https://switch-command.vercel.app
- Single source of truth for Mission Control

Houston, repository consolidation complete and ready for deployment!"

echo ""
echo "🚀 Pushing to GitHub..."
git push origin main

echo ""
echo "✅ MISSION CONTROL CONSOLIDATION COMPLETE!"
echo "📍 Repository: https://github.com/scottloeb/switchCommand"
echo "🌐 Next step: Connect to Vercel for https://switch-command.vercel.app"
