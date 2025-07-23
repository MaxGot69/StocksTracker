# 📈 StocksTracker

An elegant and powerful iOS app for tracking stocks.  
Built with **SwiftUI + MVVM + CoreData**, designed for speed, clarity and scalability.

---

## 📸 Screenshots

<p float="left">
  <img src="StocksTracker/Screenshots/screen-1.png" width="200" />
  <img src="StocksTracker/Screenshots/screen-2.png" width="200" />
</p>

---

## 🚀 Features

- 🔍 **Real-time search** for stocks by symbol or name
- ⭐ **Favorites system** — save and manage your favorite stocks locally
- 💾 **CoreData support** — favorites are stored persistently
- 🎨 **Custom UI** with animations and polished visuals
- 💡 Fallback logic when company names are missing
- ⚙️ **Clean MVVM architecture** for maintainability and scalability

---

## 🌐 API & Real-Time Data

This app uses the [Finnhub.io](https://finnhub.io) API to fetch real-time stock data.

- ✅ Quotes & pricing via: `https://finnhub.io/api/v1/quote?symbol=AAPL&token=d1v64upr01qj71gjmmu0d1v64upr01qj71gjmmug`
- 🧠 Integration is handled by `APIClient.swift` using `URLSession`
- 🔐 API key is stored locally inside the app
- 🚀 No mock data — **live stock prices from production API**

---

## 🛠️ Tech Stack

- **SwiftUI** — modern declarative UI
- **MVVM** — clear separation of concerns
- **CoreData** — for local persistence
- **URLSession** — for network communication
- **Combine** — optional use for reactive updates

---

## 🗂 Project Structure

StocksTracker/

├── Models/

├── ViewModel/

├── View/

├── Services/

├── Screenshots/

├── Persistence.swift

└── StocksTrackerApp.swift

## 🧠 Why this project matters

- 🔸 Clean and scalable MVVM in SwiftUI
- 🔸 Real-world use of CoreData for local state
- 🔸 Solid API layer with JSON parsing
- 🔸 Focus on UX and clean, responsive design

---
## 🧩 Future Improvements & Ideas

📊 Interactive stock charts — display price trends over time

🧩 Historical data — show past performance of selected stocks

🌎 Localization (RU/EN) — multi-language support

🔔 Price alerts & notifications — real-time updates when stocks change

🧠 AI-powered stock suggestions — smart suggestions based on historical data and trends

💎 Watchlist customization — tags, color labels, custom groups

💼 iCloud sync — keep favorites synced across devices

📱 iOS Widget — display favorite stocks on the home screen
 🔸+UI

## ✨ Getting Started

```bash
# 1. Clone the repo
git clone https://github.com/MaxGot69/StocksTracker.git

# 2. Open the project
open StocksTracker/StocksTracker.xcodeproj

# 3. Insert your Finnhub API key in APIClient.swift
# (Already done in this project, for review purposes)
private let apiKey = "d1v64upr01qj71gjmmu0d1v64upr01qj71gjmmug"

# 4. Run the app on iOS 16+ simulator or device — no backend required
```
---

## 🧪 License

MIT — use, modify and share freely.

