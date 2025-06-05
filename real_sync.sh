#!/bin/bash

echo "🗺️ REAL GITHUB SYNC - TACTICAL NAVIGATION MODULE"
echo "================================================"

cd /Users/scottloeb/Desktop/GitHub/switchCommand

echo "📊 Checking git status..."
git status

echo ""
echo "📦 Adding all changes..."
git add .

echo ""
echo "📝 Committing tactical navigation module..."
git commit -m "🗺️ MAJOR ENHANCEMENT: Tactical Navigation Module Integration

🎯 NAVIGATION MODULE - POSITION #2:
- Fully integrated Google Maps with NASA tactical styling
- Professional panel matching dashboard theme
- Expandable map functionality (📐 EXPAND button)
- Real-time coordinates display with GPS updates
- NASA badge 'NAV' with proper panel hierarchy

🏠 HOME LOCATION ADDED:
- Added Home Base: 1034 Timber Creek Dr., Annapolis, MD 21403
- Green operational status marker
- Command center designation with secure status
- Integrated with all navigation functions

🍔 FAST FOOD INTEGRATION:
- Added McDonald's, Chick-fil-A, Panera, Starbucks within 0.3 miles
- Small orange markers (scale: 6) near key retailers
- Info windows showing location details and nearest retailer
- Enhanced mission logistics for extended operations

🎨 STOCK STATUS COLORING:
- Green: In Stock / Operational (Home Base)
- Red: Out of Stock (Best Buy, Target) 
- Orange: Monitoring (GameStop)
- Orange: Fast Food locations
- White: Current GPS position

⚡ ENHANCED MAP FEATURES:
- Full-width expansion capability (spans all columns)
- Tactical map styling with NASA color scheme
- Click-to-expand location details with stock status
- Live GPS tracking with purple movement trails
- Traffic overlay toggle with live data
- Intelligent routing with turn-by-turn directions
- CENTER, ROUTE, TRAFFIC, TRACK controls

🚀 PROFESSIONAL INTEGRATION:
- Matches dashboard NASA theme perfectly
- Smooth animations and hover effects
- Collapsible panel with expand indicator
- Focus mode includes navigation as critical panel
- Google Maps API integration with error handling

🎖️ TACTICAL FEATURES:
- Real-time coordinate updates
- Location highlighting on marker click
- Professional modal dialogs for location details
- Call and Navigate buttons for direct action
- Enhanced legend with stock status explanations

Houston, tactical navigation is fully operational! 🗺️"

echo ""
echo "🚀 PUSHING TO GITHUB FOR REAL..."
git push origin main

echo ""
echo "✅ REAL GITHUB SYNC COMPLETE!"
echo "📍 Repository: https://github.com/scottloeb/switchCommand"
echo "🌐 Live deployment: https://switch-command.vercel.app"
echo "⏱️ Vercel auto-deploy will happen in 60-90 seconds"
echo ""
echo "🎖️ MISSION STATUS: TACTICAL NAVIGATION SYNCED TO GITHUB"
