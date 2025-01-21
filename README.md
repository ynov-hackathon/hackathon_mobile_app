# Recycly ♻️  
**Empowering Waste Sorting Through Gamification & Innovation**

## Introduction  
Recycly is a mobile app designed to revolutionize waste sorting by combining **daily challenges**, **user rankings**, and **barcode scanning** to provide instant recycling guidance. Built during a 36-hour hackathon, it leverages OpenFoodFacts data to turn eco-friendly habits into engaging experiences.

## Key Features  
- **Daily Recycling Challenges**: Earn points by completing actionable eco-tasks.  
- **Live User Rankings**: Compete with friends and track progress via a leaderboard.  
- **Barcode Scanner**:  
  - Scan product barcodes to retrieve recycling instructions via OpenFoodFacts API.  
  - *Note: Product info display UI is currently in development.*  

## Architecture & Tech Stack  
**Pattern**: MVVM (Model-View-ViewModel) with state management via **Provider**.  

| Package                | Version | Purpose                          |  
|------------------------|---------|----------------------------------|  
| `provider`             | ^6.1.2  | State management & DI            |  
| `get_it`               | ^8.0.3  | Service locator                  |  
| `logger`               | ^2.5.0  | Debugging & logging              |  
| `mobile_scanner`       | ^6.0.3  | Real-time barcode scanning       |  
| `openfoodfacts`        | ^3.18.1 | Product data integration         |  

**Toolchain**:  
- Flutter 3.22.1 (managed via `.fvm`)  
- Dart 3.4.1  

## ⚙️ Installation  
1. **Clone the repository**:  
   ```bash  
   git clone git@github.com:ynov-hackathon/hackathon_mobile_app.git```
2. **Install dependencies**
 ```flutter pub get```
2. **Run the app**
 ```flutter run```

## Resources
[GitHub Repository](git@github.com:ynov-hackathon/hackathon_mobile_app.git) <br/>
[OpenFoodFacts API Docs]( https://fr.openfoodfacts.org) <br/>
[MVVM Implementation Guide](https://medium.com/androidmood/comprendre-larchitecture-mvvm-sur-android-aa285e4fe9dd)