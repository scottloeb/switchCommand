#!/bin/bash

echo "🎯 NEXT EVENT COUNTDOWN DEPLOYMENT"
echo "================================="

cd /Users/scottloeb/Desktop/GitHub/switchCommand

echo "📊 Adding next event countdown enhancements..."
git add .

echo ""
echo "📝 Committing next event countdown..."
git commit -m "🎯 ENHANCEMENT: Next Event Countdown & Header Integration

✨ HEADER COUNTDOWN DISPLAY:
- Moved Switch 2 launch countdown to header (non-interactive)
- Added dual countdown system: Launch countdown + Next Event countdown
- Header displays both countdowns side-by-side with clear labels
- Enhanced styling with NASA color scheme and professional layout

⏰ NEXT EVENT SYSTEM:
- Intelligent next event detection based on current time
- Real-time countdown to next mission event
- Dedicated Next Event panel with full event details
- Auto-updating navigation to next event location
- Visual integration with tactical timeline

🎯 NEW PANEL: NEXT EVENT (NE):
- Shows upcoming event name, action, and precise countdown
- Large countdown display with military time precision
- Direct navigation button to next event location
- Seamless integration with timeline event status

📱 ENHANCED UX:
- Clean header layout with dual countdown displays
- Focus Mode now includes Next Event panel as critical
- Improved timeline auto-scroll to next event
- Color-coded priorities throughout interface

🚀 REAL-TIME INTELLIGENCE:
- Automatic detection of next chronological event
- Updates every second for mission precision
- Handles past events gracefully
- Mission complete state when all events finished

Houston, next event tracking is fully operational!"

echo ""
echo "🚀 Pushing to GitHub..."
git push origin main

echo ""
echo "✅ NEXT EVENT COUNTDOWN DEPLOYED!"
echo "🌐 Live deployment: https://switch-command.vercel.app"
echo "⏰ Dual countdown system operational"
echo ""
echo "🎖️ MISSION STATUS: NEXT EVENT TRACKING ACTIVE"