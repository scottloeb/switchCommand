#!/bin/bash

echo "🔧 VERCEL DEPLOYMENT FIX"
echo "========================"

cd /Users/scottloeb/Desktop/GitHub/switchCommand

echo "📊 Adding vercel.json fix..."
git add vercel.json

echo ""
echo "📝 Committing deployment fix..."
git commit -m "🔧 FIX: Vercel deployment serving HTML as JavaScript

ISSUE: Vercel serving index.html with wrong content-type
SOLUTION: Updated vercel.json to explicitly set Content-Type headers
RESULT: HTML will now render properly instead of showing raw code

Technical fix:
- Removed conflicting rewrites that caused content-type issues
- Added explicit Content-Type header for index.html
- Maintained security headers for all other routes

This should resolve the browser showing JavaScript code instead of the 
NASA Mission Control interface."

echo ""
echo "🚀 Pushing fix to GitHub (auto-deploys to Vercel)..."
git push origin main

echo ""
echo "✅ DEPLOYMENT FIX PUSHED!"
echo "🌐 Vercel will auto-deploy in 30-60 seconds"
echo "📱 Check: https://switch-command.vercel.app"
echo ""
echo "🎯 Expected result: Proper NASA Mission Control interface instead of code"