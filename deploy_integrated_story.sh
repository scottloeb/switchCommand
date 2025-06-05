#!/bin/bash

echo "🚨 INTEGRATED MISSION CONTROL + POST-MISSION STORY"
echo "================================================="

cd /Users/scottloeb/Desktop/GitHub/switchCommand

echo "📊 Integrating story elements into existing mission control dashboard..."

# Create the integrated version - mission control with story elements
cat > index.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NASA Mission Control: Switch 2 Acquisition</title>
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
        
        /* Acquisition Strategy Side Panel */
        .strategy-tab {
            position: fixed;
            top: 50%;
            right: 0;
            transform: translateY(-50%) rotate(-90deg);
            background: linear-gradient(145deg, #FC3D21, #0B3D91);
            color: white;
            padding: 8px 16px;
            cursor: pointer;
            border-radius: 8px 8px 0 0;
            z-index: 1001;
            font-weight: bold;
            letter-spacing: 1px;
        }
        
        .strategy-panel {
            position: fixed;
            top: 80px;
            right: -400px;
            width: 400px;
            height: calc(100vh - 80px);
            background: linear-gradient(145deg, #0d1117 0%, #1a1a1a 100%);
            border-left: 3px solid #FC3D21;
            z-index: 1000;
            transition: right 0.3s ease;
            overflow-y: auto;
            padding: 20px;
        }
        
        .strategy-panel.open {
            right: 0;
        }
        
        .success-probability {
            background: linear-gradient(145deg, #0B3D91, #1a1a1a);
            border: 2px solid #00FF41;
            border-radius: 12px;
            padding: 20px;
            margin: 20px 0;
            text-align: center;
        }
        
        .success-rate {
            font-size: 3em;
            color: #00FF41;
            font-weight: bold;
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
        
        .master-controls {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin: 20px 0;
        }
        
        .master-button {
            background: linear-gradient(145deg, #FC3D21, #0B3D91);
            border: 1px solid #00FF41;
            color: #FFFFFF;
            padding: 8px 16px;
            border-radius: 6px;
            cursor: pointer;
            font-family: inherit;
            font-size: 0.9em;
            text-transform: uppercase;
            transition: all 0.3s ease;
        }
        
        .master-button:hover {
            background: linear-gradient(145deg, #00FF41, #0B3D91);
            box-shadow: 0 0 10px #00FF41;
        }
        
        .header-countdown {
            background: rgba(0, 0, 0, 0.5);
            border: 2px solid #FC3D21;
            border-radius: 8px;
            padding: 15px;
            margin: 20px auto 0;
            max-width: 600px;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            font-family: 'Courier New', monospace;
        }
        
        .countdown-section {
            text-align: center;
        }
        
        .countdown-label {
            font-size: 0.9em;
            color: #FFA500;
            margin-bottom: 5px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        
        .countdown-value {
            font-size: 1.8em;
            font-weight: bold;
            color: #FC3D21;
            text-shadow: 0 0 5px #FC3D21;
        }
        
        .countdown-value.next-event {
            color: #00FF41;
            text-shadow: 0 0 5px #00FF41;
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
            justify-content: space-between;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .panel-title:hover {
            color: #FFFFFF;
            text-shadow: 0 0 5px #00FF41;
        }
        
        .panel-title-left {
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
        
        .collapse-indicator {
            color: #00FF41;
            font-size: 1.2em;
            transition: transform 0.3s ease;
        }
        
        .panel.collapsed .collapse-indicator {
            transform: rotate(-90deg);
        }
        
        .panel-content {
            transition: all 0.3s ease;
            overflow: hidden;
        }
        
        .panel.collapsed .panel-content {
            max-height: 0;
            opacity: 0;
            margin: 0;
            padding: 0;
        }
        
        /* MISSION STATUS PANEL - POST-MISSION */
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
        
        /* COMMUNICATION LOG STYLES */
        .comms-panel {
            background: linear-gradient(145deg, #1a1a1a 0%, #0d1117 100%);
            border: 2px solid #FF4444;
            grid-column: 1 / -1;
        }
        
        .comms-log {
            max-height: 400px;
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
        
        /* REST OF ORIGINAL PANELS */
        .timeline-panel {
            background: linear-gradient(145deg, #000000 0%, #0d1117 100%);
            border: 2px solid #00FF41;
        }
        
        .navigation-panel {
            background: linear-gradient(145deg, #1a252f 0%, #2c3e50 100%);
            border: 2px solid #27ae60;
        }
        
        .social-panel {
            background: linear-gradient(145deg, #1a1a2e 0%, #16213e 100%);
            border: 2px solid #3498db;
        }
        
        .current-time {
            background: #000;
            padding: 15px;
            text-align: center;
            border: 2px solid #00FF41;
            border-radius: 8px;
            font-size: 1.5em;
            color: #00FF41;
            margin-bottom: 20px;
            font-family: 'Courier New', monospace;
        }
        
        /* Enhanced Timeline Styles */
        .timeline-container {
            max-height: 400px;
            overflow-y: auto;
            background: #000;
            border-radius: 8px;
            padding: 20px;
        }
        
        .timeline-event {
            display: flex;
            align-items: center;
            margin: 20px 0;
            position: relative;
            transition: all 0.3s ease;
        }
        
        .timeline-time {
            font-family: 'Courier New', monospace;
            font-weight: bold;
            color: #FFA500;
            font-size: 1.1em;
            width: 60px;
            letter-spacing: 1px;
        }
        
        .timeline-line {
            width: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 15px;
            position: relative;
        }
        
        .timeline-line::before {
            content: '';
            position: absolute;
            width: 2px;
            height: 60px;
            background: #00FF41;
            top: -20px;
            z-index: 1;
        }
        
        .timeline-dot {
            width: 12px;
            height: 12px;
            border: 2px solid #00FF41;
            border-radius: 50%;
            background: transparent;
            position: relative;
            z-index: 2;
            transition: all 0.3s ease;
        }
        
        .timeline-event.future .timeline-dot {
            background: #00FF41;
            box-shadow: 0 0 10px #00FF41;
        }
        
        .timeline-event.next .timeline-dot {
            background: #FC3D21;
            border-color: #FC3D21;
            box-shadow: 0 0 15px #FC3D21;
            animation: pulse 1s infinite;
        }
        
        .timeline-event.past {
            opacity: 0.5;
        }
        
        .timeline-event.past .timeline-time {
            color: #666;
        }
        
        .timeline-event.past .timeline-dot {
            border-color: #666;
            background: transparent;
        }
        
        .timeline-event.missed {
            background: rgba(255, 68, 68, 0.1);
            border-left: 4px solid #FF4444;
            border-radius: 8px;
            padding: 10px;
        }
        
        .timeline-details {
            flex: 1;
        }
        
        .timeline-store {
            font-weight: bold;
            color: #FFFFFF;
            font-size: 1.1em;
            cursor: pointer;
            transition: all 0.3s ease;
            display: inline-block;
        }
        
        .timeline-store:hover {
            color: #00FF41;
            text-shadow: 0 0 5px #00FF41;
        }
        
        .timeline-action {
            color: #00FF41;
            font-size: 0.9em;
            margin-top: 2px;
        }
        
        .timeline-status {
            display: flex;
            align-items: center;
            gap: 8px;
            margin-top: 4px;
        }
        
        .status-indicator {
            width: 8px;
            height: 8px;
            border-radius: 50%;
            background: #FFA500;
        }
        
        .status-indicator.confirmed {
            background: #00FF41;
            box-shadow: 0 0 5px #00FF41;
        }
        
        /* Navigation Panel Styles */
        .coordinates {
            font-size: 1.2em;
            color: #27ae60;
            text-align: center;
            margin: 15px 0;
            font-weight: bold;
            letter-spacing: 1px;
            font-family: 'Courier New', monospace;
        }
        
        .map-container {
            width: 100%;
            height: 300px;
            background: #1a252f;
            border: 2px solid #34495e;
            border-radius: 10px;
            margin: 15px 0;
            position: relative;
            overflow: hidden;
            box-shadow: inset 0 0 20px rgba(0, 0, 0, 0.5);
        }
        
        #map {
            width: 100%;
            height: 100%;
            border-radius: 8px;
        }
        
        .map-loading {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100%;
            color: #7f8c8d;
            font-size: 14px;
        }
        
        .nav-controls {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 8px;
            margin-top: 15px;
        }
        
        .nav-button {
            background: #27ae60;
            color: white;
            border: none;
            border-radius: 6px;
            padding: 8px;
            font-family: 'Orbitron', monospace;
            font-size: 11px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
            text-transform: uppercase;
        }
        
        .nav-button:hover {
            background: #229954;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(39, 174, 96, 0.4);
        }
        
        .nav-button.center { background: #27ae60; }
        .nav-button.route { background: #3498db; }
        .nav-button.traffic { background: #16a085; }
        .nav-button.track { background: #9b59b6; }
        
        .nav-button.active {
            box-shadow: 0 0 10px currentColor;
        }
        
        /* Social Feed Styles */
        .social-feed {
            max-height: 350px;
            overflow-y: auto;
            background: #000;
            border-radius: 8px;
            padding: 15px;
        }
        
        .feed-item {
            background: rgba(52, 152, 219, 0.1);
            border-left: 4px solid #3498db;
            padding: 15px;
            margin-bottom: 15px;
            border-radius: 8px;
            transition: all 0.3s ease;
            cursor: pointer;
        }
        
        .feed-item:hover {
            background: rgba(52, 152, 219, 0.2);
            border-left-color: #00FF41;
        }
        
        .feed-item.live-item {
            background: rgba(0, 255, 65, 0.1);
            border-left: 4px solid #00FF41;
            animation: livePulse 3s infinite;
        }
        
        @keyframes livePulse {
            0%, 100% { border-left-color: #00FF41; }
            50% { border-left-color: #FFA500; }
        }
        
        .auto-refresh {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 15px;
        }
        
        .refresh-indicator {
            width: 12px;
            height: 12px;
            border-radius: 50%;
            background: #00FF41;
            animation: pulse 2s infinite;
        }
        
        .refresh-text {
            color: #FFA500;
            font-size: 0.8em;
            font-family: 'Courier New', monospace;
        }
        
        .button {
            background: linear-gradient(145deg, #0B3D91, #1a1a1a);
            border: 2px solid #00FF41;
            color: #FFFFFF;
            padding: 8px 16px;
            border-radius: 6px;
            cursor: pointer;
            font-family: inherit;
            text-transform: uppercase;
            transition: all 0.3s ease;
            font-size: 0.8em;
        }
        
        .button:hover {
            background: linear-gradient(145deg, #FC3D21, #0B3D91);
            box-shadow: 0 0 15px #FC3D21;
        }
    </style>
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700;900&display=swap" rel="stylesheet">
</head>
<body>
    <!-- CRITICAL MISSION ALERT -->
    <div class="mission-alert">
        <div class="alert-text">
            <span class="alert-icon">🚨</span>
            <span>FIELD AGENT COMMUNICATIONS LOST - MISSION STATUS UNKNOWN</span>
            <span class="alert-icon">🚨</span>
        </div>
    </div>

    <!-- Strategy Panel -->
    <div class="strategy-tab" onclick="toggleStrategy()">
        ACQUISITION STRATEGY
    </div>
    
    <div class="strategy-panel" id="strategyPanel">
        <h2 style="color: #00FF41; text-align: center; margin-bottom: 30px;">MISSION STRATEGY</h2>
        
        <div class="success-probability">
            <div class="success-rate">92%</div>
            <div style="color: #FFA500; margin: 10px 0;">SUCCESS PROBABILITY</div>
            <div style="font-size: 0.9em;">
                <div>DC Positioning: +15%</div>
                <div>Multi-Location: +22%</div>
                <div>Supply Constraints: -5%</div>
            </div>
        </div>
        
        <div style="margin: 20px 0;">
            <h3 style="color: #FFA500; margin-bottom: 15px;">LOCATION HEALTH</h3>
            
            <div style="background: rgba(52, 73, 94, 0.3); padding: 15px; border-radius: 8px; margin: 10px 0;">
                <div style="display: flex; align-items: center; gap: 10px;">
                    <div style="width: 12px; height: 12px; border-radius: 50%; background: #00FF41;"></div>
                    <strong>Best Buy Annapolis</strong>
                </div>
                <div style="font-size: 0.9em; margin-top: 8px;">PRIMARY TARGET - Status Unknown</div>
            </div>
            
            <div style="background: rgba(52, 73, 94, 0.3); padding: 15px; border-radius: 8px; margin: 10px 0;">
                <div style="display: flex; align-items: center; gap: 10px;">
                    <div style="width: 12px; height: 12px; border-radius: 50%; background: #FFA500;"></div>
                    <strong>Target Annapolis</strong>
                </div>
                <div style="font-size: 0.9em; margin-top: 8px;">SECONDARY - Status Unknown</div>
            </div>
            
            <div style="background: rgba(52, 73, 94, 0.3); padding: 15px; border-radius: 8px; margin: 10px 0;">
                <div style="display: flex; align-items: center; gap: 10px;">
                    <div style="width: 12px; height: 12px; border-radius: 50%; background: #FFA500;"></div>
                    <strong>GameStop Mall</strong>
                </div>
                <div style="font-size: 0.9em; margin-top: 8px;">BACKUP - Status Unknown</div>
            </div>
        </div>
    </div>

    <div class="main-content">
        <div class="header">
            <div class="logo">🚀 NASA MISSION CONTROL</div>
            <div class="subtitle">OPERATION: SWITCH 2 ACQUISITION</div>
            <div class="mission-status">POST-MISSION ANALYSIS MODE</div>
            
            <div class="master-controls">
                <button class="master-button" onclick="expandAll()">📊 EXPAND ALL</button>
                <button class="master-button" onclick="collapseAll()">📋 COLLAPSE ALL</button>
                <button class="master-button" onclick="focusMode()">🎯 FOCUS MODE</button>
            </div>
            
            <div class="header-countdown">
                <div class="countdown-section">
                    <div class="countdown-label">Mission Complete</div>
                    <div class="countdown-value" id="launch-countdown">AWAITING DEBRIEF</div>
                </div>
                <div class="countdown-section">
                    <div class="countdown-label">Last Contact</div>
                    <div class="countdown-value next-event" id="next-event-countdown">21:11 EST</div>
                </div>
            </div>
        </div>
        
        <div class="container">
            <!-- MISSION STATUS PANEL - FIRST (tells the outcome) -->
            <div class="panel status-panel" id="panel-status">
                <div class="panel-title" onclick="togglePanel('status')">
                    <div class="panel-title-left">
                        <span class="panel-badge">MS</span>
                        🎯 MISSION STATUS
                    </div>
                    <span class="collapse-indicator">▼</span>
                </div>
                
                <div class="panel-content">
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
                            • 18:00 - Brandy Post-Surgery Complications<br>
                            • 19:45 - Medical Situation Stabilized<br>
                            • 21:11 - Final Transmission (Best Buy)<br>
                            • 21:15 - Signal Lost
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- TACTICAL TIMELINE - SECOND (shows what was planned vs reality) -->
            <div class="panel timeline-panel" id="panel-timeline">
                <div class="panel-title" onclick="togglePanel('timeline')">
                    <div class="panel-title-left">
                        <span class="panel-badge">TL</span>
                        ⏰ TACTICAL TIMELINE
                    </div>
                    <span class="collapse-indicator">▼</span>
                </div>
                
                <div class="panel-content">
                    <div class="current-time" id="current-time">MISSION COMPLETE</div>
                    
                    <div class="timeline-container" id="timeline-container">
                        <!-- Timeline events will be populated by JavaScript -->
                    </div>
                </div>
            </div>
            
            <!-- COMMUNICATION LOG - THIRD (tells the story chronologically) -->
            <div class="panel comms-panel" id="panel-comms">
                <div class="panel-title" onclick="togglePanel('comms')">
                    <div class="panel-title-left">
                        <span class="panel-badge">CL</span>
                        📡 FIELD COMMUNICATIONS LOG
                    </div>
                    <span class="collapse-indicator">▼</span>
                </div>
                
                <div class="panel-content">
                    <div class="comms-log" id="comms-log">
                        <!-- Communications will be populated by JavaScript -->
                    </div>
                </div>
            </div>
            
            <!-- Navigation Panel -->
            <div class="panel navigation-panel" id="panel-navigation">
                <div class="panel-title" onclick="togglePanel('navigation')">
                    <div class="panel-title-left">
                        <span class="panel-badge">NAV</span>
                        🗺️ TACTICAL NAVIGATION
                    </div>
                    <span class="collapse-indicator">▼</span>
                </div>
                
                <div class="panel-content">
                    <div class="coordinates" id="coordinates">
                        38.9784° N, 76.4951° W
                    </div>
                    
                    <div class="map-container">
                        <div id="map">
                            <div class="map-loading">
                                LAST KNOWN POSITION: BEST BUY PARKING LOT
                            </div>
                        </div>
                    </div>
                    
                    <div class="nav-controls">
                        <button class="nav-button center" onclick="centerMap()">CENTER</button>
                        <button class="nav-button route" onclick="plotRoute()">ROUTE</button>
                        <button class="nav-button traffic" onclick="toggleTraffic()">TRAFFIC</button>
                        <button class="nav-button track" onclick="toggleTracking()">TRACK</button>
                    </div>
                </div>
            </div>
            
            <!-- Social Intelligence -->
            <div class="panel social-panel" id="panel-social">
                <div class="panel-title" onclick="togglePanel('social')">
                    <div class="panel-title-left">
                        <span class="panel-badge">SI</span>
                        📡 SOCIAL INTELLIGENCE
                    </div>
                    <span class="collapse-indicator">▼</span>
                </div>
                <div class="panel-content">
                    <div class="auto-refresh">
                        <div class="refresh-indicator"></div>
                        <span class="refresh-text">🔴 MONITORING SUSPENDED - AWAITING FIELD REPORT</span>
                        <button class="button" onclick="forceRefreshSocial()">🔍 GATHER INTEL</button>
                    </div>
                    
                    <div class="social-feed" id="social-feed">
                        <!-- Social feed will be populated by JavaScript -->
                    </div>
                </div>
            </div>
            
            <!-- Stock Monitoring -->
            <div class="panel" id="panel-stock">
                <div class="panel-title" onclick="togglePanel('stock')">
                    <div class="panel-title-left">
                        <span class="panel-badge">SC</span>
                        📈 STOCK MONITORING
                    </div>
                    <span class="collapse-indicator">▼</span>
                </div>
                <div class="panel-content">
                    <div class="auto-refresh">
                        <div class="refresh-indicator"></div>
                        <span class="refresh-text">FINAL STATUS - ALL LOCATIONS</span>
                        <button class="button" onclick="forceStockCheck()">🔄 FORCE</button>
                    </div>
                    
                    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 15px;">
                        <div style="background: rgba(255, 68, 68, 0.1); border: 1px solid #FF4444; padding: 15px; border-radius: 8px;">
                            <strong>Best Buy</strong><br>
                            <span style="color: #FF4444;">MISSION INCOMPLETE</span>
                        </div>
                        <div style="background: rgba(255, 68, 68, 0.1); border: 1px solid #FF4444; padding: 15px; border-radius: 8px;">
                            <strong>Target</strong><br>
                            <span style="color: #FF4444;">NOT ATTEMPTED</span>
                        </div>
                        <div style="background: rgba(255, 68, 68, 0.1); border: 1px solid #FF4444; padding: 15px; border-radius: 8px;">
                            <strong>GameStop</strong><br>
                            <span style="color: #FF4444;">NOT ATTEMPTED</span>
                        </div>
                        <div style="background: rgba(255, 68, 68, 0.1); border: 1px solid #FF4444; padding: 15px; border-radius: 8px;">
                            <strong>Staples</strong><br>
                            <span style="color: #FF4444;">NOT MONITORED</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script>
        let strategyOpen = false;
        let map;
        let markers = {};
        let userLocation = null;
        let trackingActive = false;
        let nextEvent = null;
        
        // Communications log data with corrected medical context
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
                message: 'Houston, we have a problem. Brandy post-surgery complications - refusing food and elimination. Medical monitoring required.',
                type: 'critical',
                status: 'MEDICAL PRIORITY'
            },
            {
                timestamp: '18:15',
                source: 'MISSION CONTROL',
                message: 'Copy medical priority. Post-surgical complications take absolute precedence. Mission secondary to Brandy\'s recovery. Monitor closely.',
                type: 'critical',
                status: 'FAMILY FIRST PROTOCOL'
            },
            {
                timestamp: '19:45',
                source: 'FIELD AGENT',
                message: 'Good news - Brandy responding well to encouragement. Eating small portions and bathroom functioning restored. Surgery recovery on track.',
                type: 'warning',
                status: 'MEDICAL STABLE'
            },
            {
                timestamp: '20:45',
                source: 'FIELD AGENT',
                message: 'Unable to make 22:30 Best Buy lineup. All early events missed due to medical priorities. Proceeding to Best Buy for assessment.',
                type: 'critical',
                status: 'TIMELINE COMPROMISED'
            },
            {
                timestamp: '21:11',
                source: 'FIELD AGENT',
                message: 'Arrived Best Buy parking lot. Massive crowd visible. Brandy stable at home. Attempting to assess situation and... [SIGNAL DEGRADED]',
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
        const timelineEvents = [
            // June 4 Events
            { time: '11:00', date: '2025-06-04', type: 'departure', store: 'Blackbird Salon (DC)', action: 'Strategic haircut appointment', status: 'COMPLETED ✅', priority: 'high', eventStatus: 'success' },
            { time: '12:30', date: '2025-06-04', type: 'departure', store: 'Best Buy Annapolis', action: 'Depart DC for Annapolis area', status: 'COMPLETED ✅', priority: 'high', eventStatus: 'success' },
            { time: '15:00', date: '2025-06-04', type: 'prepare', store: 'GameStop Mall', action: 'Event participation (optional guaranteed pickup)', status: 'MISSED - MEDICAL PRIORITY ❌', priority: 'medium', eventStatus: 'missed' },
            { time: '22:00', date: '2025-06-04', type: 'departure', store: 'Best Buy Annapolis', action: 'Depart for midnight lineup', status: 'MISSED - MEDICAL PRIORITY ❌', priority: 'high', eventStatus: 'missed' },
            { time: '22:30', date: '2025-06-04', type: 'prepare', store: 'Best Buy Annapolis', action: 'Arrive and begin lineup (UPDATED)', status: 'MISSED - MEDICAL PRIORITY ❌', priority: 'high', eventStatus: 'missed' },
            
            // June 5 Events (Launch Day)
            { time: '00:01', date: '2025-06-05', type: 'launch', store: 'Best Buy Annapolis', action: 'EXECUTE MISSION - Store opens + commemorative coins', status: 'STATUS UNKNOWN ❓', priority: 'high', eventStatus: 'unknown' },
            { time: '00:01', date: '2025-06-05', type: 'launch', store: 'GameStop Mall', action: 'Midnight pickup (if pre-paid)', status: 'STATUS UNKNOWN ❓', priority: 'medium', eventStatus: 'unknown' },
            { time: '07:00', date: '2025-06-05', type: 'departure', store: 'Target Annapolis', action: 'Depart for backup strategy', status: 'STATUS UNKNOWN ❓', priority: 'medium', eventStatus: 'unknown' },
            { time: '07:30', date: '2025-06-05', type: 'prepare', store: 'Target Annapolis', action: 'Ticket system lineup', status: 'STATUS UNKNOWN ❓', priority: 'medium', eventStatus: 'unknown' },
            { time: '08:00', date: '2025-06-05', type: 'launch', store: 'Target Annapolis', action: 'Ticket distribution begins', status: 'STATUS UNKNOWN ❓', priority: 'medium', eventStatus: 'unknown' }
        ];
        
        // Social intelligence data
        let socialIntelligence = [
            {
                source: '@mattswider',
                time: '4h ago',
                content: '⏰Who still needs a Switch 2? I\'m monitoring all retailers for real-time restocks...',
                priority: 'high',
                verified: true,
                url: 'https://twitter.com/mattswider',
                isLive: false
            },
            {
                source: 'MISSION CONTROL',
                time: 'Last Update',
                content: '🔴 SOCIAL MONITORING SUSPENDED - Field Agent communications lost. Awaiting mission debrief.',
                priority: 'critical',
                verified: true,
                url: '#',
                isLive: false
            }
        ];
        
        // Store locations
        const locations = {
            bestBuy: {
                name: 'Best Buy Annapolis',
                coords: { lat: 38.9784, lng: -76.4951 },
                address: '2643 Housley Rd, Annapolis, MD 21401',
                status: 'Last Known Position'
            },
            target: {
                name: 'Target Annapolis',
                coords: { lat: 38.9820, lng: -76.5020 },
                address: 'Annapolis Mall, Annapolis, MD 21401',
                status: 'Not Attempted'
            },
            gamestop: {
                name: 'GameStop Mall',
                coords: { lat: 38.9750, lng: -76.4800 },
                address: '179 Annapolis Mall, Annapolis, MD 21401',
                status: 'Not Attempted'
            },
            home: {
                name: 'Home Base',
                coords: { lat: 38.9800, lng: -76.4900 },
                address: 'Secure Location',
                status: 'Operational'
            }
        };
        
        // Strategy panel functions
        function toggleStrategy() {
            const panel = document.getElementById('strategyPanel');
            strategyOpen = !strategyOpen;
            panel.classList.toggle('open');
        }
        
        // Panel management functions
        function togglePanel(panelName) {
            const panel = document.getElementById(`panel-${panelName}`);
            panel.classList.toggle('collapsed');
        }
        
        function expandAll() {
            const panels = document.querySelectorAll('.panel');
            panels.forEach(panel => panel.classList.remove('collapsed'));
        }
        
        function collapseAll() {
            const panels = document.querySelectorAll('.panel');
            panels.forEach(panel => panel.classList.add('collapsed'));
        }
        
        function focusMode() {
            const criticalPanels = ['status', 'timeline', 'comms'];
            const allPanels = document.querySelectorAll('.panel');
            
            allPanels.forEach(panel => {
                const panelId = panel.id.replace('panel-', '');
                if (criticalPanels.includes(panelId)) {
                    panel.classList.remove('collapsed');
                } else {
                    panel.classList.add('collapsed');
                }
            });
            
            // Also open strategy panel in focus mode
            if (!strategyOpen) {
                toggleStrategy();
            }
        }
        
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
        
        function renderTimeline() {
            const container = document.getElementById('timeline-container');
            
            container.innerHTML = timelineEvents.map(event => {
                const icon = getActionIcon(event.type);
                
                return `
                    <div class="timeline-event ${event.eventStatus}" data-time="${event.time}">
                        <div class="timeline-time">${event.time}</div>
                        <div class="timeline-line">
                            <div class="timeline-dot"></div>
                        </div>
                        <div class="timeline-details">
                            <div class="timeline-store" onclick="openNavigation('${event.store}')">
                                ${icon} ${event.store}
                            </div>
                            <div class="timeline-action">${event.action}</div>
                            <div class="timeline-status">
                                <div class="status-indicator confirmed"></div>
                                <span style="font-size: 0.8em; color: #${event.priority === 'high' ? '00FF41' : event.priority === 'medium' ? 'FFA500' : 'FC3D21'};">
                                    ${event.status}
                                </span>
                            </div>
                        </div>
                    </div>
                `;
            }).join('');
        }
        
        function getActionIcon(type) {
            switch(type) {
                case 'departure': return '🚗';
                case 'prepare': return '⏳';
                case 'launch': return '🚀';
                default: return '📍';
            }
        }
        
        function getStoreAddress(storeName) {
            const addresses = {
                'Best Buy Annapolis': '2643 Housley Rd, Annapolis, MD 21401',
                'Target Annapolis': 'Annapolis Mall, Annapolis, MD 21401', 
                'GameStop Mall': '179 Annapolis Mall, Annapolis, MD 21401',
                'Blackbird Salon (DC)': '1920 L St NW, Washington, DC 20036'
            };
            return addresses[storeName] || storeName;
        }
        
        function openNavigation(storeName) {
            const address = getStoreAddress(storeName);
            const encodedAddress = encodeURIComponent(address);
            window.open(`https://www.google.com/maps/dir/?api=1&destination=${encodedAddress}&travelmode=driving`, '_blank');
        }
        
        // Social feed rendering
        function renderSocialFeed() {
            const feedContainer = document.getElementById('social-feed');
            
            feedContainer.innerHTML = socialIntelligence.map(item => {
                const isLive = item.isLive;
                const liveIndicator = isLive ? '<span style="color: #00FF41; font-size: 0.8em;">● LIVE</span>' : '';
                
                return `
                    <div class="feed-item ${isLive ? 'live-item' : ''}" onclick="openSocialLink('${item.url}')">
                        <div style="display: flex; justify-content: space-between; margin-bottom: 10px;">
                            <div style="font-weight: bold; color: #3498db;">${item.source}${item.verified ? ' ✓' : ''} ${liveIndicator}</div>
                            <div style="color: #FFA500; font-size: 0.8em;">${item.time}</div>
                        </div>
                        <div style="color: #FFFFFF; line-height: 1.4;">${item.content}</div>
                    </div>
                `;
            }).join('');
        }
        
        function openSocialLink(url) {
            if (url !== '#') {
                window.open(url, '_blank');
            }
        }
        
        function forceRefreshSocial() {
            console.log('🔍 Social monitoring suspended - awaiting field report');
        }
        
        function forceStockCheck() {
            console.log('🔄 Final mission status - all objectives incomplete');
        }
        
        // Google Maps functions
        function initMap() {
            const center = { lat: 38.9784, lng: -76.4951 };
            
            map = new google.maps.Map(document.getElementById('map'), {
                zoom: 13,
                center: center,
                mapTypeId: google.maps.MapTypeId.SATELLITE,
                styles: [
                    {
                        "elementType": "geometry",
                        "stylers": [{"color": "#0a0a0a"}]
                    },
                    {
                        "elementType": "labels",
                        "stylers": [{"visibility": "off"}]
                    },
                    {
                        "featureType": "road",
                        "elementType": "geometry",
                        "stylers": [{"color": "#34495e"}, {"weight": 1}]
                    },
                    {
                        "featureType": "water",
                        "elementType": "geometry",
                        "stylers": [{"color": "#0f3460"}]
                    }
                ],
                disableDefaultUI: true
            });
            
            // Add location markers
            Object.keys(locations).forEach(key => {
                const location = locations[key];
                
                const marker = new google.maps.Marker({
                    position: location.coords,
                    map: map,
                    title: location.name,
                    icon: {
                        path: google.maps.SymbolPath.CIRCLE,
                        fillColor: key === 'bestBuy' ? '#FF4444' : getLocationColor(location.status),
                        fillOpacity: 1,
                        strokeColor: '#ffffff',
                        strokeWeight: 2,
                        scale: key === 'bestBuy' ? 12 : 8
                    }
                });
                
                markers[key] = marker;
                
                // Add click listener
                marker.addListener('click', () => {
                    openNavigation(location.address);
                });
            });
        }
        
        function getLocationColor(status) {
            switch(status) {
                case 'Operational': return '#00FF41';
                case 'Last Known Position': return '#FF4444';
                case 'Not Attempted': return '#808080';
                default: return '#7f8c8d';
            }
        }
        
        function centerMap() {
            map.setCenter({ lat: 38.9784, lng: -76.4951 });
            map.setZoom(14);
        }
        
        function plotRoute() {
            const destination = locations.bestBuy.coords;
            const url = `https://www.google.com/maps/dir/?api=1&destination=${destination.lat},${destination.lng}`;
            window.open(url, '_blank');
        }
        
        function toggleTraffic() {
            const button = document.querySelector('.nav-button.traffic');
            button.classList.toggle('active');
        }
        
        function toggleTracking() {
            const button = document.querySelector('.nav-button.track');
            button.textContent = 'LOST';
            button.style.background = '#FF4444';
        }
        
        // Initialize everything
        function init() {
            renderTimeline();
            renderSocialFeed();
            renderCommunicationsLog();
            
            // Initialize map when Google Maps loads
            if (typeof google !== 'undefined') {
                initMap();
            }
            
            console.log('🚨 POST-MISSION ANALYSIS MODE ACTIVE');
            console.log('📡 Communications log loaded - field agent missing');
            console.log('⏰ Mission timeline shows critical delays');
            console.log('🐕 Brandy\'s post-surgery status: STABLE');
            console.log('🎮 Mission outcome: UNKNOWN - awaiting debrief...');
        }
        
        // Start the post-mission system
        init();
    </script>
    
    <!-- Google Maps API -->
    <script async defer 
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCTdJQ1Pk-PdixNjh82D3k7_Xqmfhhj1I0&callback=initMap">
    </script>
</body>
</html>
EOF

echo "✅ Integrated mission control with post-mission story elements created!"

echo ""
echo "📊 Adding integrated mission control deployment..."
git add .

echo ""
echo "📝 Committing integrated mission control with story elements..."
git commit -m "🚨 INTEGRATED MISSION CONTROL: Story Elements + Dashboard Combined

🎯 STRATEGIC PANEL ORDERING FOR STORY FLOW:
1. MISSION STATUS (MS) - Shows outcome unknown, last contact, critical events
2. TACTICAL TIMELINE (TL) - Shows planned vs actual with medical delays
3. COMMUNICATIONS LOG (CL) - Full story chronologically (Brandy surgery recovery)
4. Navigation, Social, Stock - Supporting context with post-mission status

🚨 FLASHING ALERT BANNER:
- Red flashing banner: 'FIELD AGENT COMMUNICATIONS LOST'
- Positioned at top, adjusts all content below
- Creates immediate dramatic impact for Zach

📡 INTEGRATED STORY ELEMENTS:
- Mission Status: STATUS UNKNOWN, Last Contact 21:11 EST
- Communications Log: Full story from haircut → Brandy complications → blackout
- Timeline: Shows COMPLETED ✅, MISSED - MEDICAL PRIORITY ❌, STATUS UNKNOWN ❓
- Strategy Panel: All locations now show 'Status Unknown'
- Stock Monitoring: All locations show mission failure states

🐕 BRANDY MEDICAL CONTEXT:
- Post-surgery complications requiring medical priority
- Family first protocol properly established
- Recovery confirmed before Best Buy departure
- Appropriate medical concern without scary details

📊 DASHBOARD INTEGRATION:
- All original mission control features preserved
- Story elements woven naturally into existing panels
- Master controls (Expand/Collapse/Focus) work with story panels
- Strategy side panel updated for post-mission context

🎮 PERFECT STORY ARC FOR ZACH:
1. Flashing alert gets attention immediately
2. Mission Status shows the outcome mystery
3. Timeline reveals what went wrong when
4. Communications tells the full Brandy story
5. All other panels support the post-mission context

Ready for Zach's dramatic wake-up discovery! 🚨"

echo ""
echo "🚀 Pushing integrated mission control to GitHub..."
git push origin main

echo ""
echo "✅ INTEGRATED MISSION CONTROL DEPLOYED!"
echo "📍 Repository: https://github.com/scottloeb/switchCommand"
echo "🌐 Live deployment: https://switch-command.vercel.app"
echo "🚨 Complete story integrated into mission control dashboard!"
echo ""
echo "🎖️ STORY STATUS: READY FOR ZACH'S DISCOVERY"
echo "📡 Panel flow: Status → Timeline → Communications → Context"
echo "🚨 Alert system: Immediate attention-grabbing banner"
echo "🐕 Medical context: Appropriate post-surgery priority story"
echo "🎮 Mission mystery: Perfect setup for your real debrief!"