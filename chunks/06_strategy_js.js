        // Strategy Panel Functions
        let strategyOpen = false;
        let strategyUpdateAvailable = false;
        
        function toggleStrategy() {
            const panel = document.getElementById('strategyPanel');
            const tab = document.getElementById('strategyTab');
            
            strategyOpen = !strategyOpen;
            
            if (strategyOpen) {
                panel.classList.add('open');
                tab.classList.remove('pulse');
                strategyUpdateAvailable = false;
            } else {
                panel.classList.remove('open');
            }
        }
        
        function toggleStore(storeId) {
            const module = document.getElementById(`${storeId}Module`);
            const indicator = document.getElementById(`${storeId}Indicator`);
            
            module.classList.toggle('collapsed');
        }
        
        function showAnalysis(storeId) {
            const modal = document.getElementById('analysisModal');
            const title = document.getElementById('modalTitle');
            const content = document.getElementById('modalContent');
            
            const analyses = {
                bestBuy: {
                    title: 'BEST BUY ANNAPOLIS - STRATEGIC ANALYSIS',
                    content: `
                        <div class="analysis-section">
                            <div class="analysis-section-title">GARDEN Framework Assessment</div>
                            <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 15px;">
                                <div>
                                    <strong>Systematic Approach:</strong> 95% match<br>
                                    <strong>Completion-Driven:</strong> 92% match<br>
                                    <strong>Multi-Option Strategy:</strong> 88% match<br>
                                    <strong>Location Optimization:</strong> 85% match
                                </div>
                                <div>
                                    <strong>Success Probability:</strong> 89%<br>
                                    <strong>Risk Factor:</strong> High demand<br>
                                    <strong>Competitive Advantage:</strong> 22:30 early lineup<br>
                                    <strong>Special Incentive:</strong> Commemorative coins
                                </div>
                            </div>
                        </div>
                        
                        <div class="analysis-section">
                            <div class="analysis-section-title">Intelligence Summary</div>
                            <p>Best Buy Annapolis confirmed as PRIMARY TARGET with highest success probability. Midnight launch confirmed with commemorative coins as additional incentive. Intel suggests arriving at 22:30 (30 minutes earlier than originally planned) due to expected long lines based on social media chatter.</p>
                        </div>
                        
                        <div class="analysis-section">
                            <div class="analysis-section-title">Competition Analysis</div>
                            <p>Expected heavy competition for midnight launch. Geographic arbitrage from DC haircut appointment provides positioning advantage. Store historically reliable for console launches with adequate inventory allocation.</p>
                        </div>
                    `
                },
                target: {
                    title: 'TARGET ANNAPOLIS - STRATEGIC ANALYSIS',
                    content: `
                        <div class="analysis-section">
                            <div class="analysis-section-title">GARDEN Framework Assessment</div>
                            <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 15px;">
                                <div>
                                    <strong>Systematic Approach:</strong> 78% match<br>
                                    <strong>Completion-Driven:</strong> 71% match<br>
                                    <strong>Multi-Option Strategy:</strong> 85% match<br>
                                    <strong>Ticket System Compatibility:</strong> 82% match
                                </div>
                                <div>
                                    <strong>Success Probability:</strong> 67%<br>
                                    <strong>Risk Factor:</strong> Bundle delays<br>
                                    <strong>Strategy Window:</strong> 08:00-17:00<br>
                                    <strong>Ticket System:</strong> Organized distribution
                                </div>
                            </div>
                        </div>
                        
                        <div class="analysis-section">
                            <div class="analysis-section-title">Intelligence Summary</div>
                            <p>Target confirmed ticket system launch with extended window (08:00-17:00). Warning: Some bundles delayed to June 11, reducing immediate availability. Ticket system provides organized approach but may limit quantities per customer.</p>
                        </div>
                        
                        <div class="analysis-section">
                            <div class="analysis-section-title">Risk Factors</div>
                            <p>Bundle delays indicate supply constraints. Ticket system may result in lottery-style distribution. Best used as SECONDARY strategy if Best Buy primary fails.</p>
                        </div>
                    `
                },
                gamestop: {
                    title: 'GAMESTOP MALL - STRATEGIC ANALYSIS',
                    content: `
                        <div class="analysis-section">
                            <div class="analysis-section-title">GARDEN Framework Assessment</div>
                            <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 15px;">
                                <div>
                                    <strong>Systematic Approach:</strong> 72% match<br>
                                    <strong>Two-Phase Strategy:</strong> 88% match<br>
                                    <strong>Backup Viability:</strong> 76% match<br>
                                    <strong>Mall Constraints:</strong> 65% match
                                </div>
                                <div>
                                    <strong>Success Probability:</strong> 58%<br>
                                    <strong>Walk-in Units:</strong> ~10 available<br>
                                    <strong>Phase 1:</strong> 15:00 payment<br>
                                    <strong>Phase 2:</strong> 00:00 pickup
                                </div>
                            </div>
                        </div>
                        
                        <div class="analysis-section">
                            <div class="analysis-section-title">Intelligence Summary</div>
                            <p>GameStop offers two-phase strategy: pay at 15:00 event, pickup at midnight. Approximately 10 units available for walk-ins. Mall location presents operational constraints but provides guaranteed pickup if payment completed during Phase 1.</p>
                        </div>
                        
                        <div class="analysis-section">
                            <div class="analysis-section-title">Strategic Value</div>
                            <p>Excellent BACKUP option if Best Buy strategy fails. Two-phase approach reduces midnight competition. Consider participating in 15:00 event as insurance policy while maintaining Best Buy as primary target.</p>
                        </div>
                    `
                }
            };
            
            const analysis = analyses[storeId];
            title.textContent = analysis.title;
            content.innerHTML = analysis.content;
            modal.style.display = 'flex';
        }
        
        function closeAnalysis(event) {
            if (event && event.target !== document.getElementById('analysisModal')) return;
            document.getElementById('analysisModal').style.display = 'none';
        }
        
        function checkForStrategyUpdates() {
            // This would be called when social intelligence detects strategy-affecting updates
            if (!strategyOpen && !strategyUpdateAvailable) {
                const tab = document.getElementById('strategyTab');
                tab.classList.add('pulse');
                strategyUpdateAvailable = true;
            }
        }