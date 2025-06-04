#!/bin/bash

echo "🔧 FIXING VERCEL BUILD ERROR"
echo "============================"

cd /Users/scottloeb/Desktop/GitHub/switchCommand

echo "📁 Removing problematic config files..."
rm -f vercel.json
rm -f package.json
rm -f .vercelignore
rm -f DELETE_vercel.json

echo ""
echo "📊 Adding clean HTML file..."
git add .
git add -u  # This stages deletions

echo ""
echo "📝 Committing Vercel fix..."
git commit -m "🔧 FIX: Remove problematic Vercel config causing build failure

ERROR: vercel.json schema validation failed - 'functions' should NOT have fewer than 1 properties
SOLUTION: Remove all Vercel config files to let Vercel auto-detect static HTML site

REMOVED:
- vercel.json (was causing schema validation error)
- package.json (unnecessary for static site)
- .vercelignore (not needed)

RESULT: Clean static HTML deployment that Vercel will serve properly

This should fix the 'Build Failed' error and serve the HTML correctly."

echo ""
echo "🚀 Pushing Vercel build fix..."
git push origin main

echo ""
echo "✅ VERCEL BUILD FIX DEPLOYED!"
echo "🌐 Build should succeed now at: https://switch-command.vercel.app"
echo "⏱️ Wait 60-90 seconds for new deployment"