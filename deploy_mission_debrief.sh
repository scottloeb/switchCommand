#!/bin/bash

echo "🚨 MISSION DEBRIEF MODE DEPLOYMENT"
echo "=================================="

cd /Users/scottloeb/Desktop/GitHub/switchCommand

echo "📊 Creating post-mission debrief interface..."

# Create the mission debrief version
cat > index.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NASA Mission Control: Post-Mission Debrief</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        
        body {
            font-family: 'Orbitron', monospace;
            background: linear-gradient(135deg, #000000 0%, #0B3D91 50%, #000000 100%);
            color: #FFFFFF;
            min-height: 100vh;
        }
        
        /* CRITICAL ALERT BANNER */
        .mission-alert {
            position: fixed;
            top: 0;
            left: 0;
            width: 100vw;
            background: linear-gradient(90deg, #FF0000 0%, #CC0000 50%, #FF0000 100%);
            color: #FFFFFF;
            padding: 15px;
            text-align: center;
            z-index: 2000;
            font-size: 1.5em;
            font-weight: bold;
            letter-spacing: 2px;
            animation: criticalAlert 2s infinite;
            box-shadow: 0 5px 20px rgba(255, 0, 0, 0.5);
        }
        
        @keyframes criticalAlert {
            0%, 100% { opacity: 1; background: linear-gradient(90deg, #FF0000 0%, #CC0000 50%, #FF0000 100%); }
            50% { opacity: 0.7; background: linear-gradient(90deg, #CC0000 0%, #FF0000 50%, #CC0000 100%); }
        }
        
        .mission-alert .alert-text {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 15px;
        }
        
        .mission-alert .alert-icon {
            font-size: 2em;
            animation: pulse 1s infinite;
        }
        
        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.2); }
        }
        
        /* ADJUST MAIN CONTENT FOR ALERT */
        .main-content {
            margin-top: 80px;
        }
        
        .header {
            background: linear-gradient(90deg, #0B3D91 0%, #1a1a1a 100%);
            padding: 20px;
            text-align: center;
            border-bottom: 3px solid #FC3D21;
            position: relative;
            overflow: hidden;
        }
        
        .header::after {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
            animation: sweep 3s infinite;
        }
        
        @keyframes sweep {
            0% { left: -100%; }
            100% { left: 100%; }
        }
        
        .logo {
            font-size: 2.5em;
            font-weight: bold;
            color: #FFFFFF;
            margin-bottom: 10px;
            text-shadow: 0 0 10px #0B3D91;
        }
        
        .subtitle {
            color: #FC3D21;
            font-size: 1.2em;
            letter-spacing: 2px;
            margin-bottom: 10px;
        }
        
        .mission-status {
            color: #FF0000;
            font-size: 1.4em;
            font-weight: bold;
            letter-spacing: 3px;
            margin-top: 10px;
            animation: statusBlink 3s infinite;
        }
        
        @keyframes statusBlink {
            0%, 100% { opacity: 1; }
            50% { opacity: 0.3; }
        }
        
        .container {
            padding: 20px;
            max-width: 1400px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: 1fr;
            gap: 20px;
        }
        
        @media (min-width: 768px) {
            .container {
                grid-template-columns: repeat(2, 1fr);
            }
        }
        
        @media (min-width: 1200px) {
            .container {
                grid-template-columns: repeat(3, 1fr);
            }
        }
        
        .panel {
            background: linear-gradient(145deg, #0d1117 0%, #1a1a1a 100%);
            border: 2px solid #30363d;
            border-radius: 12px;
            padding: 20px;
            position: relative;
            transition: all 0.3s ease;
        }
        
        .panel::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 3px;
            background: linear-gradient(90deg, #FC3D21, #FFA500, #00FF41);
            border-radius: 12px 12px 0 0;
        }
        
        .panel-title {
            font-size: 1.3em;
            color: #00FF41;
            margin-bottom: 20px;
            text-transform: uppercase;
            letter-spacing: 1px;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .panel-badge {
            background: #FC3D21;
            color: #FFFFFF;
            padding: 4px 8px;
            border-radius: 50%;
            font-size: 0.7em;
            font-weight: bold;
        }
        
        /* COMMUNICATION LOG STYLES */
        .comms-panel {
            background: linear-gradient(145deg, #1a1a1a 0%, #0d1117 100%);
            border: 2px solid #FF4444;
            grid-column: 1 / -1;
        }
        
        .comms-log {
            max-height: 500px;
            overflow-y: auto;
            background: #000;
            border-radius: 8px;
            padding: 20px;
            font-family: 'Courier New', monospace;
        }
        
        .comms-log::-webkit-scrollbar {
            width: 8px;
        }
        
        .comms-log::-webkit-scrollbar-track {
            background: #1a1a1a;
        }
        
        .comms-log::-webkit-scrollbar-thumb {
            background: #FF4444;
            border-radius: 4px;
        }
        
        .comm-entry {
            margin-bottom: 20px;
            padding: 15px;
            border-left: 4px solid transparent;
            border-radius: 8px;
            animation: fadeIn 0.5s ease-in;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .comm-entry.success {
            background: rgba(0, 255, 65, 0.1);
            border-left-color: #00FF41;
        }
        
        .comm-entry.warning {
            background: rgba(255, 165, 0, 0.1);
            border-left-color: #FFA500;
        }
        
        .comm-entry.critical {
            background: rgba(255, 68, 68, 0.1);
            border-left-color: #FF4444;
        }
        
        .comm-entry.blackout {
            background: rgba(128, 128, 128, 0.1);
            border-left-color: #808080;
            opacity: 0.7;
        }
        
        .comm-timestamp {
            color: #FFA500;
            font-size: 0.9em;
            margin-bottom: 8px;
            font-weight: bold;
        }
        
        .comm-source {
            color: #00FF41;
            font-weight: bold;
            margin-bottom: 5px;
        }
        
        .comm-message {
            color: #FFFFFF;
            line-height: 1.4;
        }
        
        .comm-status {
            color: #666;
            font-size: 0.8em;
            margin-top: 8px;
            font-style: italic;
        }
        
        /* MISSION STATUS PANEL */
        .status-panel {
            background: linear-gradient(145deg, #2a1a1a 0%, #1a0a0a 100%);
            border: 2px solid #FF0000;
        }
        
        .mission-objective {
            background: rgba(255, 0, 0, 0.1);
            border: 2px solid #FF0000;
            border-radius: 8px;
            padding: 20px;
            text-align: center;
            margin-bottom: 20px;
        }
        
        .objective-status {
            font-size: 2em;
            color: #FF0000;
            font-weight: bold;
            margin-bottom: 10px;
            animation: statusPulse 2s infinite;
        }
        
        @keyframes statusPulse {
            0%, 100% { opacity: 1; }
            50% { opacity: 0.5; }
        }
        
        .last-contact {
            background: rgba(255, 165, 0, 0.1);
            border: 1px solid #FFA500;
            border-radius: 8px;
            padding: 15px;
            margin: 15px 0;
        }
        
        .contact-time {
            color: #FFA500;
            font-weight: bold;
            font-size: 1.1em;
        }
        
        .contact-location {
            color: #FFFFFF;
            margin-top: 5px;
        }
        
        /* TIMELINE PANEL - FAILED EVENTS */
        .timeline-panel {
            background: linear-gradient(145deg, #2a1a1a 0%, #1a0d0d 100%);
            border: 2px solid #FF4444;
        }
        
        .timeline-event {
            display: flex;
            align-items: center;
            margin: 15px 0;
            padding: 10px;
            border-radius: 8px;
            transition: all 0.3s ease;
        }
        
        .timeline-event.missed {
            background: rgba(255, 68, 68, 0.1);
            border-left: 4px solid #FF4444;
        }
        
        .timeline-event.unknown {
            background: rgba(128, 128, 128, 0.1);
            border-left: 4px solid #808080;
        }
        
        .timeline-time {
            font-family: 'Courier New', monospace;
            font-weight: bold;
            color: #FFA500;
            font-size: 1em;
            width: 60px;
            letter-spacing: 1px;
        }
        
        .timeline-details {
            flex: 1;
            margin-left: 15px;
        }
        
        .timeline-store {
            font-weight: bold;
            color: #FFFFFF;
            font-size: 1em;
        }
        
        .timeline-action {
            color: #FF4444;
            font-size: 0.9em;
            margin-top: 2px;
        }
        
        .timeline-status {
            color: #FF0000;
            font-size: 0.8em;
            margin-top: 4px;
            font-weight: bold;
        }
        
        /* DEBRIEF WAITING PANEL */
        .debrief-panel {
            background: linear-gradient(145deg, #1a2a1a 0%, #0d1a0d 100%);
            border: 2px solid #00FF41;
            text-align: center;
        }
        
        .debrief-prompt {
            background: rgba(0, 255, 65, 0.1);
            border: 2px solid #00FF41;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
        }
        
        .debrief-title {
            color: #00FF41;
            font-size: 1.5em;
            font-weight: bold;
            margin-bottom: 15px;
        }
        
        .debrief-message {
            color: #FFFFFF;
            line-height: 1.6;
            margin-bottom: 15px;
        }
        
        .debrief-button {
            background: linear-gradient(145deg, #00FF41, #00CC33);
            border: none;
            color: #000000;
            padding: 15px 30px;
            border-radius: 8px;
            font-family: 'Orbitron', monospace;
            font-size: 1.1em;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
            text-transform: uppercase;
        }
        
        .debrief-button:hover {
            background: linear-gradient(145deg, #00CC33, #00FF41);
            box-shadow: 0 0 20px rgba(0, 255, 65, 0.5);
            transform: translateY(-2px);
        }
    </style>
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700;900&display=swap" rel="stylesheet">
</head>
<body>
    <!-- CRITICAL MISSION ALERT -->
    <div class="mission-alert">
        <div class="alert-text">
            <span class="alert-icon">🚨</span>
            <span>FIELD AGENT COMMUNICATIONS LOST - AWAITING STATUS DEBRIEF</span>
            <span class="alert-icon">🚨</span>
        </div>
    </div>

    <div class="main-content">
        <div class="header">
            <div class="logo">🚀 NASA MISSION CONTROL</div>
            <div class="subtitle">OPERATION: SWITCH 2 ACQUISITION</div>
            <div class="mission-status">POST-MISSION ANALYSIS MODE</div>
        </div>
        
        <div class="container">
            <!-- MISSION STATUS PANEL -->
            <div class="panel status-panel">
                <div class="panel-title">
                    <span class="panel-badge">MS</span>
                    🎯 MISSION STATUS
                </div>
                
                <div class="mission-objective">
                    <div class="objective-status">STATUS UNKNOWN</div>
                    <div style="color: #FFA500;">Nintendo Switch 2 Acquisition</div>
                </div>
                
                <div class="last-contact">
                    <div class="contact-time">LAST CONTACT: 21:11 EST</div>
                    <div class="contact-location">📍 Best Buy Annapolis Parking Lot</div>
                    <div style="color: #FF4444; margin-top: 10px; font-size: 0.9em;">
                        ⚠️ COMMUNICATIONS BLACKOUT: 4h 17m
                    </div>
                </div>
                
                <div style="background: rgba(255, 68, 68, 0.1); border: 1px solid #FF4444; border-radius: 8px; padding: 15px; margin-top: 15px;">
                    <div style="color: #FF4444; font-weight: bold; margin-bottom: 8px;">MISSION CRITICAL EVENTS:</div>
                    <div style="color: #FFFFFF; font-size: 0.9em; line-height: 1.4;">
                        • 18:00 - Brandy Medical Emergency<br>
                        • 21:00 - Timeline Compromised<br>
                        • 21:11 - Final Transmission<br>
                        • 21:15 - Signal Lost
                    </div>
                </div>
            </div>
            
            <!-- COMMUNICATION LOG -->
            <div class="panel comms-panel">
                <div class="panel-title">
                    <span class="panel-badge">CL</span>
                    📡 FIELD COMMUNICATIONS LOG
                </div>
                
                <div class="comms-log" id="comms-log">
                    <!-- Communications will be populated by JavaScript -->
                </div>
            </div>
            
            <!-- MISSION TIMELINE -->
            <div class="panel timeline-panel">
                <div class="panel-title">
                    <span class="panel-badge">TL</span>
                    ⏰ MISSION TIMELINE
                </div>
                
                <div id="mission-timeline">
                    <!-- Timeline events will be populated by JavaScript -->
                </div>
            </div>
            
            <!-- DEBRIEF PROMPT -->
            <div class="panel debrief-panel">
                <div class="panel-title">
                    <span class="panel-badge">DB</span>
                    📋 AWAITING DEBRIEF
                </div>
                
                <div class="debrief-prompt">
                    <div class="debrief-title">MISSION DEBRIEF REQUIRED</div>
                    <div class="debrief-message">
                        Field Agent has returned from Switch 2 acquisition mission.<br>
                        Communications were lost at 21:11 EST during critical phase.<br><br>
                        Mission Control requires immediate status update.
                    </div>
                    <button class="debrief-button" onclick="startDebrief()">
                        🎤 BEGIN DEBRIEF PROTOCOL
                    </button>
                </div>
            </div>
        </div>
    </div>
    
    <script>
        // Communications log data based on the actual mission timeline
        const communicationsLog = [
            {
                timestamp: '11:00',
                source: 'FIELD AGENT',
                message: 'Mission Control, departing home base for DC. Haircut appointment confirmed at Blackbird Salon. Weather clear, traffic nominal.',
                type: 'success',
                status: 'TRANSMITTED'
            },
            {
                timestamp: '11:45',
                source: 'MISSION CONTROL',
                message: 'Copy, Field Agent. You are GO for Phase 1. DC positioning provides strategic advantage. Timeline nominal.',
                type: 'success',
                status: 'ACKNOWLEDGED'
            },
            {
                timestamp: '12:30',
                source: 'FIELD AGENT',
                message: 'Haircut complete. Excellent operational grooming achieved. Proceeding to Annapolis AO. ETA 30 minutes.',
                type: 'success',
                status: 'TRANSMITTED'
            },
            {
                timestamp: '13:15',
                source: 'FIELD AGENT',
                message: 'Arrived Annapolis. Conducting reconnaissance of Best Buy, Target, GameStop. All locations confirmed operational.',
                type: 'success',
                status: 'TRANSMITTED'
            },
            {
                timestamp: '15:00',
                source: 'MISSION CONTROL',
                message: 'Field Agent, GameStop event window opening. Recommend participation for backup option. Primary strategy remains Best Buy midnight.',
                type: 'success',
                status: 'ADVISORY'
            },
            {
                timestamp: '15:05',
                source: 'FIELD AGENT',
                message: 'Negative on GameStop event. Timeline conflicts with dinner prep. Maintaining focus on primary target.',
                type: 'warning',
                status: 'DEVIATION'
            },
            {
                timestamp: '18:00',
                source: 'FIELD AGENT',
                message: 'Houston, we have a problem. Brandy refusing dinner and bathroom breaks. Mission-critical canine situation developing.',
                type: 'critical',
                status: 'EMERGENCY'
            },
            {
                timestamp: '18:15',
                source: 'MISSION CONTROL',
                message: 'Copy emergency status. Recommend immediate veterinary assessment. Mission secondary to family welfare. Keep us informed.',
                type: 'critical',
                status: 'PRIORITY OVERRIDE'
            },
            {
                timestamp: '19:30',
                source: 'FIELD AGENT',
                message: 'Brandy crisis resolved. Minor digestive issue, now eating and functioning normally. Mission timeline severely compressed.',
                type: 'warning',
                status: 'SITUATION NOMINAL'
            },
            {
                timestamp: '20:45',
                source: 'FIELD AGENT',
                message: 'Unable to make 22:30 Best Buy lineup. All early events missed. Proceeding to Best Buy for situational assessment.',
                type: 'critical',
                status: 'TIMELINE FAILURE'
            },
            {
                timestamp: '21:11',
                source: 'FIELD AGENT',
                message: 'Arrived Best Buy parking lot. Massive crowd visible. Attempting to assess situation and... [SIGNAL DEGRADED]',
                type: 'blackout',
                status: 'PARTIAL TRANSMISSION'
            },
            {
                timestamp: '21:15',
                source: 'MISSION CONTROL',
                message: 'Field Agent, please respond. We are not receiving your transmission. Repeat, please respond...',
                type: 'blackout',
                status: 'NO RESPONSE'
            },
            {
                timestamp: '21:30',
                source: 'MISSION CONTROL',
                message: 'All attempts to reach Field Agent unsuccessful. Assuming communications blackout. Standing by for debrief.',
                type: 'blackout',
                status: 'COMMS LOST'
            }
        ];
        
        // Mission timeline events with actual status
        const missionTimeline = [
            { time: '11:00', store: 'Blackbird Salon (DC)', action: 'Strategic haircut appointment', status: 'COMPLETED', type: 'success' },
            { time: '15:00', store: 'GameStop Mall', action: 'Event participation', status: 'MISSED', type: 'missed' },
            { time: '22:30', store: 'Best Buy Annapolis', action: 'Lineup commencement', status: 'MISSED', type: 'missed' },
            { time: '00:01', store: 'Best Buy Annapolis', action: 'Midnight launch execution', status: 'UNKNOWN', type: 'unknown' },
            { time: '07:30', store: 'Target Annapolis', action: 'Backup strategy', status: 'UNKNOWN', type: 'unknown' },
            { time: '08:00', store: 'Target Annapolis', action: 'Ticket distribution', status: 'UNKNOWN', type: 'unknown' }
        ];
        
        function renderCommunicationsLog() {
            const logContainer = document.getElementById('comms-log');
            
            logContainer.innerHTML = communicationsLog.map(comm => `
                <div class="comm-entry ${comm.type}">
                    <div class="comm-timestamp">[${comm.timestamp}] ${comm.status}</div>
                    <div class="comm-source">${comm.source}:</div>
                    <div class="comm-message">${comm.message}</div>
                </div>
            `).join('');
            
            // Auto-scroll to bottom
            logContainer.scrollTop = logContainer.scrollHeight;
        }
        
        function renderMissionTimeline() {
            const timelineContainer = document.getElementById('mission-timeline');
            
            timelineContainer.innerHTML = missionTimeline.map(event => `
                <div class="timeline-event ${event.type}">
                    <div class="timeline-time">${event.time}</div>
                    <div class="timeline-details">
                        <div class="timeline-store">${event.store}</div>
                        <div class="timeline-action">${event.action}</div>
                        <div class="timeline-status">${event.status}</div>
                    </div>
                </div>
            `).join('');
        }
        
        function startDebrief() {
            // Simulate starting debrief session
            alert('🎤 MISSION DEBRIEF INITIATED\\n\\nField Agent, please provide detailed status report on Switch 2 acquisition mission.\\n\\nInclude:\\n• Mission outcome\\n• Brandy medical situation\\n• Best Buy assessment\\n• Lessons learned\\n\\nMission Control standing by...');
            
            // Add debrief started entry to comms log
            const newEntry = {
                timestamp: new Date().toLocaleTimeString('en-US', { hour12: false, hour: '2-digit', minute: '2-digit' }),
                source: 'MISSION CONTROL',
                message: 'Debrief protocol initiated. Field Agent requested to provide comprehensive mission status report.',
                type: 'success',
                status: 'DEBRIEF ACTIVE'
            };
            
            communicationsLog.push(newEntry);
            renderCommunicationsLog();
        }
        
        function updateCurrentTime() {
            const now = new Date();
            const hours = now.getHours().toString().padStart(2, '0');
            const minutes = now.getMinutes().toString().padStart(2, '0');
            const seconds = now.getSeconds().toString().padStart(2, '0');
            
            // Update any time displays if needed
            console.log(`Mission Control Time: ${hours}:${minutes}:${seconds}`);
        }
        
        // Initialize the post-mission interface
        function init() {
            renderCommunicationsLog();
            renderMissionTimeline();
            
            // Update time every second
            setInterval(updateCurrentTime, 1000);
            
            console.log('🚨 POST-MISSION DEBRIEF MODE ACTIVE');
            console.log('📡 Communications log loaded');
            console.log('⏰ Mission timeline analysis complete');
            console.log('🎤 Awaiting field agent debrief...');
        }
        
        // Start the post-mission system
        init();
    </script>
</body>
</html>
EOF

echo "✅ Mission debrief interface created!"

echo ""
echo "📊 Adding mission debrief deployment..."
git add .

echo ""
echo "📝 Committing post-mission debrief system..."
git commit -m "🚨 POST-MISSION DEBRIEF: Field Agent Communications Lost

🚨 CRITICAL MISSION STATUS:
- Field agent communications lost at 21:11 EST
- Last contact: Best Buy Annapolis parking lot
- Mission outcome unknown - awaiting debrief

📡 COMMUNICATION LOG FEATURES:
- Complete mission timeline with actual events
- Early success: DC haircut mission completed
- 18:00 CRISIS: Brandy medical emergency (digestive issue)
- 20:45 TIMELINE FAILURE: All early events missed
- 21:11 FINAL TRANSMISSION: Best Buy arrival, massive crowd
- 21:15 BLACKOUT: Communications lost, no response

⏰ MISSION TIMELINE STATUS:
- 11:00 Haircut: COMPLETED ✅
- 15:00 GameStop: MISSED ❌
- 22:30 Best Buy Lineup: MISSED ❌
- 00:01 Midnight Launch: UNKNOWN ❓
- Morning Events: UNKNOWN ❓

🎮 DRAMATIC STORY ELEMENTS:
- Flashing red ALERT banner
- Mission Control waiting for debrief
- Authentic communication log with timestamps
- Brandy crisis as mission-critical event
- Communications blackout at key moment
- Interactive debrief protocol button

Perfect wake-up surprise for Zach! 🚨"

echo ""
echo "🚀 Pushing mission debrief to GitHub..."
git push origin main

echo ""
echo "✅ MISSION DEBRIEF DEPLOYED!"
echo "📍 Repository: https://github.com/scottloeb/switchCommand"
echo "🌐 Live deployment: https://switch-command.vercel.app"
echo "🚨 Post-mission debrief mode active!"
echo ""
echo "🎖️ STORY STATUS: READY FOR ZACH'S DISCOVERY"
echo "📡 Communication log: Brandy crisis → Best Buy blackout"
echo "🚨 Alert system: Field agent missing, awaiting debrief"
echo "🎤 Interactive: Begin debrief protocol button ready"