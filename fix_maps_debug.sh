#!/bin/bash

echo "🗺️ GOOGLE MAPS DEBUG & FIX DEPLOYMENT"
echo "====================================="

cd /Users/scottloeb/Desktop/GitHub/switchCommand

echo "📊 Adding Google Maps debugging fixes..."
git add .

echo ""
echo "📝 Committing Maps debugging enhancements..."
git commit -m "🔧 FIX: Google Maps API debugging and error handling

🗺️ ENHANCED MAP LOADING:
- Added comprehensive error handling for Google Maps API
- Console logging for map initialization debugging
- Fallback error messages with NASA styling
- Retry mechanism for slow API loading (10 second timeout)
- Better diagnostics for API loading issues

⚠️ ERROR HANDLING:
- Try-catch blocks around map initialization
- Graceful degradation when API fails to load
- User-friendly error messages in mission control style
- Console logging for debugging purposes

🔄 RETRY LOGIC:
- 2-second retry intervals for up to 5 attempts
- Clear timeout messaging for failed API loads
- Automatic fallback to offline mode

This should help diagnose and fix any Google Maps loading issues! 🎯"

echo ""
echo "🚀 Pushing Google Maps fixes to GitHub..."
git push origin main

echo ""
echo "✅ GOOGLE MAPS DEBUG FIX DEPLOYED!"
echo "📍 Repository: https://github.com/scottloeb/switchCommand"
echo "🌐 Live deployment: https://switch-command.vercel.app"
echo "🗺️ Enhanced debugging for Google Maps API issues"
echo ""
echo "🎖️ MISSION STATUS: MAPS DEBUG SYSTEM ACTIVE"
echo "📊 Features: Error handling, retry logic, console debugging"
echo "⚡ Check browser console for detailed map loading diagnostics"
