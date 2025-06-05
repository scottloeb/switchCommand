        function getEventStatus(event) {
            const now = new Date();
            const eventDateTime = new Date(`${event.date}T${event.time}:00-04:00`);
            
            if (eventDateTime < now) {
                return 'past';
            } else {
                if (nextEvent && nextEvent === event) {
                    return 'next';
                } else {
                    return 'future';
                }
            }
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
        
        function navigateToNextEvent() {
            if (nextEvent) {
                openNavigation(nextEvent.store);
            }
        }
        
        function renderTimeline() {
            const container = document.getElementById('timeline-container');
            
            container.innerHTML = timelineEvents.map(event => {
                const status = getEventStatus(event);
                const icon = getActionIcon(event.type);
                
                return `
                    <div class="timeline-event ${status}" data-time="${event.time}">
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
                                <div class="status-indicator ${event.status}"></div>
                                <span style="font-size: 0.8em; color: #${event.priority === 'high' ? '00FF41' : event.priority === 'medium' ? 'FFA500' : 'FC3D21'};">
                                    ${event.priority.toUpperCase()} PRIORITY
                                </span>
                            </div>
                        </div>
                    </div>
                `;
            }).join('');
        }
        
        function forceStockCheck() {
            const button = event.target;
            const originalText = button.textContent;
            button.textContent = '🔄 CHECKING...';
            button.style.background = 'linear-gradient(145deg, #FFA500, #0B3D91)';
            
            setTimeout(() => {
                button.textContent = originalText;
                button.style.background = 'linear-gradient(145deg, #0B3D91, #1a1a1a)';
            }, 2000);
        }
        
        // Initialize and update functions
        function init() {
            renderTimeline();
            renderSocialFeed();
            updateCurrentTime();
            updateLaunchCountdown();
            updateNextEventCountdown();
            
            // Update every second
            setInterval(() => {
                updateCurrentTime();
                updateLaunchCountdown();
                updateNextEventCountdown();
                renderTimeline(); // Re-render to update event statuses
            }, 1000);
            
            console.log('🚀 ACQUISITION STRATEGY MISSION CONTROL ACTIVATED');
            console.log('📊 Strategy Panel: Accessible from right edge');
            console.log('💯 Success Probability: 92%');
            console.log('🏪 Location Health: Best Buy (🟢), Target (🟡), GameStop (🟡)');
        }
        
        // Start the mission control system
        init();
    </script>
    
</body>
</html>