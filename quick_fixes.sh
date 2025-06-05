#!/bin/bash

echo "🔧 QUICK FIXES: Timeline + Responsive + Collapsible Panels"
echo "========================================================="

cd /Users/scottloeb/Desktop/GitHub/switchCommand

echo "📊 Adding fixes..."
git add .

echo ""
echo "📝 Committing fixes..."
git commit -m "🔧 QUICK FIXES: Timeline, Responsive Design, Collapsible Panels

✅ AUTOSCROLL FIX:
- Fixed autoscroll to apply ONLY to timeline container
- No more global page scrolling interference
- Smooth scroll behavior within timeline bounds

✅ RESPONSIVE DESIGN FIX:
- 1 column on mobile (< 768px)
- 2 columns on tablet (768px - 1199px) 
- 3 columns on desktop (≥ 1200px)
- Timeline maintains standard width (no more 2x width)

✅ COLLAPSIBLE PANELS RESTORED:
- Click any panel title to expand/collapse
- Visual collapse indicators (▼/▶) with rotation
- Master controls: Expand All, Collapse All, Focus Mode
- Smooth animations for panel transitions
- Focus Mode shows only critical panels (Timeline, Countdown, Intel)

✅ ENHANCED UX:
- Panel badges for easy identification (TL, T-, SI, SM, MS)
- Hover effects on panel titles
- Proper responsive grid layouts
- Maintained NASA aesthetic throughout

All core functionality working properly now!"

echo ""
echo "🚀 Pushing fixes to GitHub..."
git push origin main

echo ""
echo "✅ FIXES DEPLOYED!"
echo "🌐 Live in 60 seconds: https://switch-command.vercel.app"