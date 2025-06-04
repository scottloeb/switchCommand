#!/bin/bash

# Switch Command Repository Setup Script
# Run this to initialize the Git repository and connect to GitHub

echo "🚀 Switch 2 Mission Control - Repository Setup"
echo "=============================================="

# Initialize Git repository
echo "📁 Initializing Git repository..."
git init

# Add all files
echo "📝 Adding files to repository..."
git add .

# Initial commit
echo "💾 Creating initial commit..."
git commit -m "🚀 Initial deployment: Switch 2 Mission Control

Features:
- NASA-style Mission Control interface  
- Real Annapolis retailer intelligence
- Google Maps integration
- Social media monitoring
- Collapsible panel system
- Mobile-responsive design
- Live deployment ready

Mission Status: OPERATIONAL
Target: Nintendo Switch 2
Launch Window: June 5, 2025"

# Instructions for GitHub connection
echo ""
echo "🔗 To connect to GitHub:"
echo "1. Create repository at: https://github.com/new"
echo "2. Repository name: switchCommand"
echo "3. Keep it public for live deployment"
echo "4. Don't initialize with README (we have one)"
echo ""
echo "Then run these commands:"
echo "git branch -M main"
echo "git remote add origin https://github.com/scottloeb/switchCommand.git"
echo "git push -u origin main"
echo ""
echo "🌐 For Vercel deployment:"
echo "1. Connect GitHub repo to Vercel"
echo "2. Deploy from main branch"
echo "3. Use current live domain: switch-command.vercel.app"
echo ""
echo "✅ Repository ready for GitHub deployment!"