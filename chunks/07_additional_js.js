                    const hours = Math.floor(timeLeft / (60 * 60 * 1000));
                    const minutes = Math.floor((timeLeft % (60 * 60 * 1000)) / (60 * 1000));
                    const seconds = Math.floor((timeLeft % (60 * 1000)) / 1000);
                    
                    // Update header countdown
                    document.getElementById('next-event-countdown').textContent = 
                        `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`;
                    
                    // Update next event panel
                    document.getElementById('next-event-name').textContent = nextEvent.store;
                    document.getElementById('next-event-action').textContent = nextEvent.action;
                    document.getElementById('next-event-time-remaining').textContent = 
                        `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`;
                } else {
                    document.getElementById('next-event-countdown').textContent = 'EVENT ACTIVE';
                    document.getElementById('next-event-time-remaining').textContent = 'ACTIVE NOW';
                }
            } else {
                document.getElementById('next-event-countdown').textContent = 'MISSION COMPLETE';
                document.getElementById('next-event-name').textContent = 'All Events Complete';
                document.getElementById('next-event-action').textContent = 'Mission accomplished!';
                document.getElementById('next-event-time-remaining').textContent = 'COMPLETE';
            }
        }
        
        function renderSocialFeed() {
            const feedContainer = document.getElementById('social-feed');
            
            feedContainer.innerHTML = socialIntelligence.map(item => {
                const isLive = item.isLive;
                const liveIndicator = isLive ? '<span style="color: #00FF41; font-size: 0.8em;">● LIVE</span>' : '';
                
                return `
                    <div class="feed-item priority-${item.priority} ${isLive ? 'live-item' : ''}" onclick="openSocialLink('${item.url}')">
                        <div class="feed-header">
                            <div class="feed-source">${item.source}${item.verified ? ' ✓' : ''} ${liveIndicator}</div>
                            <div class="feed-time">${item.time}</div>
                        </div>
                        <div class="feed-content">${item.content}</div>
                        <div class="feed-tags">
                            ${item.tags.map(tag => `<span class="feed-tag">${tag}</span>`).join('')}
                        </div>
                    </div>
                `;
            }).join('');
        }
        
        function openSocialLink(url) {
            window.open(url, '_blank');
        }
        
        async function forceRefreshSocial() {
            const button = event.target;
            const originalText = button.textContent;
            button.textContent = '🔍 GATHERING INTEL...';
            button.style.background = 'linear-gradient(145deg, #00FF41, #0B3D91)';
            
            // Simulate intelligence gathering
            setTimeout(() => {
                button.textContent = '✅ UPDATED';
                checkForStrategyUpdates(); // Trigger strategy update notification
                setTimeout(() => {
                    button.textContent = originalText;
                    button.style.background = 'linear-gradient(145deg, #0B3D91, #1a1a1a)';
                }, 2000);
            }, 1500);
        }