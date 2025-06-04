# WEB SCRAPER SPECIFICATIONS
## Switch 2 Stock Monitoring System

### 🎯 OVERVIEW

Automated web scraping system to monitor Nintendo Switch 2 inventory across major retailers in real-time, with iPhone push notifications for immediate alerts during the launch window.

### 🏪 TARGET RETAILERS

#### Primary Targets (Annapolis Area)
```javascript
const primaryTargets = {
  bestBuy: {
    name: "Best Buy",
    url: "https://www.bestbuy.com/site/nintendo-switch-2/consoles",
    selector: ".sr-size, .fulfillment-add-to-cart-button",
    stockKeywords: ["Add to Cart", "In Stock", "Available"],
    outOfStockKeywords: ["Sold Out", "Coming Soon", "Unavailable"],
    priority: "HIGH",
    checkInterval: 15 // seconds
  },
  target: {
    name: "Target", 
    url: "https://www.target.com/p/nintendo-switch-2-console",
    selector: "[data-test='shippingButton'], [data-test='addToCartButton']",
    stockKeywords: ["Add to cart", "Ship it", "Pick it up"],
    outOfStockKeywords: ["Out of stock", "Temporarily unavailable"],
    priority: "HIGH",
    checkInterval: 15
  },
  gamestop: {
    name: "GameStop",
    url: "https://www.gamestop.com/consoles-hardware/nintendo-switch-2",
    selector: ".add-to-cart, .availability",
    stockKeywords: ["Add to Cart", "Available", "In Stock"],
    outOfStockKeywords: ["Not Available", "Out of Stock"],
    priority: "MEDIUM", 
    checkInterval: 30
  },
  staples: {
    name: "Staples",
    url: "https://www.staples.com/gaming/nintendoswitch2",
    selector: ".add-to-cart-button, .availability-msg",
    stockKeywords: ["Add to Cart", "Available"],
    outOfStockKeywords: ["Out of Stock", "Unavailable"],
    priority: "LOW",
    checkInterval: 60
  }
};
```

#### Secondary Targets (Backup Options)
```javascript
const secondaryTargets = {
  walmart: {
    name: "Walmart",
    url: "https://www.walmart.com/shop/switch2",
    selector: "[data-automation-id='add-to-cart'], .availability-text",
    stockKeywords: ["Add to cart", "In stock"],
    outOfStockKeywords: ["Out of stock", "Get in-stock alert"],
    priority: "MEDIUM",
    checkInterval: 30
  },
  amazon: {
    name: "Amazon", 
    url: "https://www.amazon.com/s?k=nintendo+switch+2",
    selector: "#add-to-cart-button, .availability",
    stockKeywords: ["Add to Cart", "In Stock"],
    outOfStockKeywords: ["Currently unavailable", "Out of Stock"],
    priority: "LOW",
    checkInterval: 60
  },
  costco: {
    name: "Costco",
    url: "https://www.costco.com/nintendo-switch-2",
    selector: ".add-to-cart, .availability",
    stockKeywords: ["Add to Cart", "Available"],
    outOfStockKeywords: ["Out of Stock", "Item is no longer available"],
    priority: "LOW", 
    checkInterval: 120
  }
};
```

### 🔧 TECHNICAL IMPLEMENTATION

#### Core Scraper Architecture
```python
import requests
from bs4 import BeautifulSoup
import time
import json
from datetime import datetime
import smtplib
from email.mime.text import MIMEText
import pushbullet  # For iPhone notifications

class Switch2StockMonitor:
    def __init__(self):
        self.session = requests.Session()
        self.session.headers.update({
            'User-Agent': 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_7_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.2 Mobile/15E148 Safari/604.1',
            'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
            'Accept-Language': 'en-US,en;q=0.5',
            'Accept-Encoding': 'gzip, deflate',
            'DNT': '1',
            'Connection': 'keep-alive',
            'Upgrade-Insecure-Requests': '1'
        })
        self.pb = pushbullet.Pushbullet("YOUR_PUSHBULLET_API_KEY")
        
    def check_stock(self, retailer_config):
        try:
            response = self.session.get(retailer_config['url'], timeout=10)
            soup = BeautifulSoup(response.content, 'html.parser')
            
            # Look for stock indicators
            elements = soup.select(retailer_config['selector'])
            page_text = response.text.lower()
            
            in_stock = any(keyword.lower() in page_text for keyword in retailer_config['stockKeywords'])
            out_of_stock = any(keyword.lower() in page_text for keyword in retailer_config['outOfStockKeywords'])
            
            if in_stock and not out_of_stock:
                return {'status': 'IN_STOCK', 'timestamp': datetime.now()}
            elif out_of_stock:
                return {'status': 'OUT_OF_STOCK', 'timestamp': datetime.now()}
            else:
                return {'status': 'UNKNOWN', 'timestamp': datetime.now()}
                
        except Exception as e:
            return {'status': 'ERROR', 'error': str(e), 'timestamp': datetime.now()}
    
    def send_alert(self, retailer_name, status, url):
        if status == 'IN_STOCK':
            title = f"🚨 SWITCH 2 IN STOCK: {retailer_name}"
            message = f"Nintendo Switch 2 is available at {retailer_name}!\n\nBUY NOW: {url}"
            
            # Pushbullet notification to iPhone
            self.pb.push_note(title, message)
            
            # Also send email as backup
            self.send_email_alert(title, message)
            
    def send_email_alert(self, subject, body):
        # Configure email settings
        smtp_server = "smtp.gmail.com"
        smtp_port = 587
        email = "your-email@gmail.com"
        password = "your-app-password"
        
        msg = MIMEText(body)
        msg['Subject'] = subject
        msg['From'] = email
        msg['To'] = email
        
        with smtplib.SMTP(smtp_server, smtp_port) as server:
            server.starttls()
            server.login(email, password)
            server.send_message(msg)
    
    def monitor_all_retailers(self):
        while True:
            for retailer_name, config in primaryTargets.items():
                result = self.check_stock(config)
                
                print(f"[{datetime.now()}] {retailer_name}: {result['status']}")
                
                if result['status'] == 'IN_STOCK':
                    self.send_alert(retailer_name, result['status'], config['url'])
                
                time.sleep(config['checkInterval'])
```

#### iPhone Integration
```javascript
// PWA (Progressive Web App) for iPhone
// Can be added to home screen for native app experience

// Service Worker for background notifications
self.addEventListener('push', function(event) {
    const data = event.data.json();
    
    if (data.type === 'STOCK_ALERT') {
        const options = {
            body: `Nintendo Switch 2 available at ${data.retailer}!`,
            icon: '/icon-switch2.png',
            badge: '/badge-icon.png',
            vibrate: [200, 100, 200],
            actions: [
                {
                    action: 'buy',
                    title: 'Buy Now',
                    icon: '/buy-icon.png'
                },
                {
                    action: 'dismiss', 
                    title: 'Dismiss',
                    icon: '/dismiss-icon.png'
                }
            ],
            requireInteraction: true,
            tag: 'stock-alert'
        };
        
        event.waitUntil(
            self.registration.showNotification('🚨 SWITCH 2 IN STOCK!', options)
        );
    }
});

// Handle notification clicks
self.addEventListener('notificationclick', function(event) {
    event.notification.close();
    
    if (event.action === 'buy') {
        // Open retailer URL
        event.waitUntil(
            clients.openWindow(event.notification.data.url)
        );
    }
});
```

### 📱 MOBILE DASHBOARD

#### Real-time Status Display
```html
<!-- Mobile-optimized stock status dashboard -->
<div class="stock-dashboard">
    <div class="retailer-status" data-retailer="bestbuy">
        <div class="retailer-name">Best Buy</div>
        <div class="stock-status out-of-stock">OUT OF STOCK</div>
        <div class="last-check">Checked: 30s ago</div>
    </div>
    
    <div class="retailer-status" data-retailer="target">
        <div class="retailer-name">Target</div>
        <div class="stock-status checking">CHECKING...</div>
        <div class="last-check">Checking now</div>
    </div>
    
    <div class="retailer-status" data-retailer="gamestop">
        <div class="retailer-name">GameStop</div>
        <div class="stock-status in-stock">🚨 IN STOCK!</div>
        <div class="last-check">Updated: NOW</div>
    </div>
</div>

<style>
.stock-dashboard {
    display: grid;
    gap: 10px;
    padding: 20px;
    font-family: 'Orbitron', monospace;
}

.retailer-status {
    background: #1a1a1a;
    border: 2px solid #333;
    border-radius: 8px;
    padding: 15px;
    text-align: center;
}

.stock-status.in-stock {
    color: #00FF41;
    font-weight: bold;
    animation: pulse 1s infinite;
}

.stock-status.out-of-stock {
    color: #FF4444;
}

.stock-status.checking {
    color: #FFA500;
}

@keyframes pulse {
    0%, 100% { opacity: 1; }
    50% { opacity: 0.5; }
}
</style>
```

### ⚡ DEPLOYMENT OPTIONS

#### Option 1: Cloud-Based (Recommended)
```yaml
# Deploy to Heroku/Railway/DigitalOcean
services:
  stock-monitor:
    image: python:3.9
    environment:
      - PUSHBULLET_API_KEY=${PUSHBULLET_API_KEY}
      - EMAIL_USERNAME=${EMAIL_USERNAME}
      - EMAIL_PASSWORD=${EMAIL_PASSWORD}
    command: python stock_monitor.py
    restart: always
    
  web-dashboard:
    image: nginx:alpine
    ports:
      - "80:80"
    volumes:
      - ./dashboard:/usr/share/nginx/html
```

#### Option 2: Local Development
```bash
# Run locally for testing
pip install -r requirements.txt
python stock_monitor.py

# Requirements.txt
requests==2.28.1
beautifulsoup4==4.11.1
pushbullet.py==0.12.0
flask==2.2.2
```

#### Option 3: Serverless (AWS Lambda)
```python
import json
import boto3
from lambda_function import Switch2StockMonitor

def lambda_handler(event, context):
    monitor = Switch2StockMonitor()
    
    # Check all retailers
    results = {}
    for retailer, config in primaryTargets.items():
        results[retailer] = monitor.check_stock(config)
        
        if results[retailer]['status'] == 'IN_STOCK':
            # Send SNS notification to iPhone
            sns = boto3.client('sns')
            sns.publish(
                TopicArn='arn:aws:sns:us-east-1:123456789:switch2-alerts',
                Message=f"Switch 2 available at {retailer}!",
                Subject="🚨 SWITCH 2 IN STOCK!"
            )
    
    return {
        'statusCode': 200,
        'body': json.dumps(results)
    }
```

### 📊 MONITORING & ALERTS

#### Alert Hierarchy
1. **CRITICAL**: Best Buy/Target in stock (immediate notification)
2. **HIGH**: GameStop/Walmart in stock (5-minute delay notification)
3. **MEDIUM**: Staples/Costco in stock (15-minute delay notification)  
4. **LOW**: Amazon/other retailers (hourly summary)

#### Notification Channels
- **Primary**: iPhone push notification via Pushbullet
- **Secondary**: SMS via Twilio
- **Tertiary**: Email alert
- **Backup**: Discord webhook to private channel

#### Rate Limiting & Ethics
```python
# Respectful scraping practices
RATE_LIMITS = {
    'bestbuy': 15,    # seconds between requests
    'target': 15,     # seconds between requests  
    'gamestop': 30,   # seconds between requests
    'walmart': 30,    # seconds between requests
    'amazon': 60,     # seconds between requests
}

# Rotate User-Agent strings
USER_AGENTS = [
    'Mozilla/5.0 (iPhone; CPU iPhone OS 14_7_1 like Mac OS X)...',
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7)...',
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64)...'
]

# Use proxy rotation for high-frequency checks
PROXY_LIST = [
    'http://proxy1.example.com:8080',
    'http://proxy2.example.com:8080'
]
```

### 🔐 SECURITY & RELIABILITY

#### Error Handling
```python
class StockMonitorError(Exception):
    pass

def robust_check_stock(retailer_config, max_retries=3):
    for attempt in range(max_retries):
        try:
            return check_stock(retailer_config)
        except (requests.Timeout, requests.ConnectionError) as e:
            if attempt == max_retries - 1:
                raise StockMonitorError(f"Failed after {max_retries} attempts: {e}")
            time.sleep(2 ** attempt)  # Exponential backoff
```

#### Data Persistence
```python
# Log all checks for analysis
import sqlite3

def log_check_result(retailer, status, timestamp):
    conn = sqlite3.connect('stock_monitoring.db')
    cursor = conn.cursor()
    cursor.execute(
        "INSERT INTO stock_checks (retailer, status, timestamp) VALUES (?, ?, ?)",
        (retailer, status, timestamp)
    )
    conn.commit()
    conn.close()
```

### 📈 SUCCESS METRICS

**Key Performance Indicators**:
- Alert latency: < 30 seconds from stock appearance
- False positive rate: < 5%
- Uptime: > 99% during launch window
- Coverage: All primary retailers monitored simultaneously

**Testing Protocol**:
1. Simulate stock changes on test URLs
2. Verify notification delivery to iPhone
3. Test failover to backup notification methods
4. Validate rate limiting compliance
5. Confirm mobile dashboard real-time updates

---

*This web scraper system provides comprehensive, real-time inventory monitoring with immediate iPhone alerts, giving you a significant advantage during the Switch 2 launch window.*
