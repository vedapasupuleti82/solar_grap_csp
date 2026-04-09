# 🌱 Organic Farming Assistant App

An Android mobile application built with Flutter to help farmers practice organic farming by providing intelligent crop recommendations and organic compost guidance.

A Community Service Project (CSP) for B.Tech final year students, aimed at helping farmers transition to organic farming practices.

## � Problem & Solution

### Problem Statement
- Farmers lack guidance on suitable crops for their soil and season
- Limited knowledge about organic alternatives to chemical pesticides
- Need for structured approach to organic compost preparation
- Difficulty in scheduling and tracking compost preparation activities

### Solution
A mobile app that:
- ✅ Recommends crops based on soil type, season, and budget
- ✅ Suggests organic compost alternatives (no pesticides)
- ✅ Provides YouTube video tutorials for compost preparation
- ✅ Schedules notifications for compost preparation steps
- ✅ Tracks progress of compost preparation

## 🌟 Features

### 1. Intelligent Crop Recommendation
- Input soil type (Clay, Sandy, Loamy, Silt, Peaty, Chalky)
- Select season (Kharif, Rabi, Zaid)
- Enter preferred crop or get suggestions
- Validates crop suitability
- Suggests alternatives if crop is not suitable

### 2. Organic Compost Guidance
- Recommends specific organic compost for each crop
- Provides detailed preparation steps
- Lists required ingredients
- Shows preparation timeline
- 100% organic - No chemical pesticides

### 3. Video Tutorials
- Curated YouTube video links
- Step-by-step compost making guides
- Opens directly in YouTube app

### 4. Smart Scheduling (Planned)
- Creates preparation schedule
- Sends timely notifications
- Tracks task completion
- Progress monitoring

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.0.0 or higher)
- Android Studio
- Android SDK
- Android Emulator or Physical Device

### Installation Steps

**1. Install Flutter**
- Follow: [SETUP_GUIDE.md](SETUP_GUIDE.md)

**2. Clone/Create Project**
```bash
cd "d:\Organic Farming"
flutter create organic_farming_app
cd organic_farming_app
```

**3. Copy Sample Code**
- Copy all files from sample_code/ to your project
- Follow: [IMPLEMENTATION_GUIDE.md](IMPLEMENTATION_GUIDE.md)

**4. Install Dependencies**
```bash
flutter pub get
```

**5. Run App**
```bash
flutter run
```

## � Project Structure

```
organic_farming_app/
├── lib/
│   ├── main.dart                 # App entry point
│   ├── models/                   # Data models
│   │   ├── soil_type.dart
│   │   ├── season.dart
│   │   ├── crop.dart
│   │   └── compost.dart
│   ├── screens/                  # UI screens
│   │   ├── home_screen.dart
│   │   ├── input_screen.dart
│   │   ├── recommendation_screen.dart
│   │   ├── compost_screen.dart
│   │   └── schedule_screen.dart
│   ├── services/                 # Business logic
│   │   ├── notification_service.dart
│   │   └── schedule_service.dart
│   └── data/                     # Static data
│       ├── crops_data.dart
│       └── compost_data.dart
├── android/                      # Android-specific files
└── pubspec.yaml                  # Dependencies
```

## 🎨 Key Technologies

- **Framework**: Flutter 3.x
- **Language**: Dart
- **UI**: Material Design
- **State Management**: Provider (planned)
- **Local Storage**: SharedPreferences
- **Notifications**: flutter_local_notifications
- **URL Launcher**: url_launcher

## 🌾 Supported Crops

The app includes data for 15+ crops:
- **Cereals**: Paddy, Wheat, Maize
- **Vegetables**: Tomato, Potato, Onion, Cabbage, Cauliflower, Brinjal, Chilli
- **Cash Crops**: Cotton, Sugarcane
- **Oilseeds**: Groundnut, Soybean
- **Pulses**: Chickpea

## 🍂 Organic Compost Types

The app recommends 7 types of organic compost:
- **Vermicompost** - Using earthworms
- **FYM** (Farm Yard Manure) - From cattle waste
- **Green Manure** - Growing and ploughing plants
- **Compost** - From crop residues
- **Neem Cake** - Natural pest repellent
- **Bone Meal** - Phosphorus-rich
- **Jeevamrut** - Liquid organic fertilizer

## 🧪 Testing

### Manual Testing
```bash
flutter run
```

### Build APK
```bash
flutter build apk --release
```

APK location: `build/app/outputs/flutter-apk/app-release.apk`

## 📚 Documentation

- **SETUP_GUIDE.md** - Complete setup instructions
- **PROJECT_PLAN.md** - Detailed project planning
- **IMPLEMENTATION_GUIDE.md** - Step-by-step implementation
- **FLUTTER_COMMANDS.md** - Flutter command reference

## 🌍 Social Impact

### Benefits to Farmers
- ✅ Reduces dependency on chemical pesticides
- ✅ Improves soil health and fertility
- ✅ Reduces farming costs
- ✅ Increases crop yield naturally
- ✅ Better market prices for organic produce

### Environmental Benefits
- ✅ Reduces soil pollution
- ✅ Protects water sources
- ✅ Promotes biodiversity
- ✅ Sustainable farming practices

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 📞 Support & Contact

For support, bug reports, or feature requests:
- GitHub Issues: [Issue Tracker](https://github.com/vedapasupuleti82/solar_grap_csp/issues)
- Email: support@organicfarming.io

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Agricultural research community for insights
- Farmers for inspiration and feedback

---

**Made with ❤️ for farmers and sustainable agriculture**

🌾 **Grow Organic, Grow Healthy 🌱**

## 🧪 Testing

Run all tests:
```bash
flutter test
```

Run tests with coverage:
```bash
flutter test --coverage
```

## 📦 Build & Deployment

### Build APK (Android)
```bash
flutter build apk --release
```

### Build AAB (Android App Bundle)
```bash
flutter build appbundle --release
```

### Build IPA (iOS)
```bash
flutter build ios --release
```

### Build Web
```bash
flutter build web --release
```

## 🔐 Security Notes

- **Supabase Keys**: Keep your anon key and service key secure
- **API Keys**: Never commit sensitive keys to Git
- **Authentication**: Use environment variables for production
- **User Data**: Ensure compliance with data protection regulations

## 📝 Environment Setup

Create a `.env` file for sensitive data:
```
SUPABASE_URL=your_url
SUPABASE_ANON_KEY=your_key
```

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 📞 Support & Contact

For support, bug reports, or feature requests:
- Email: support@solargram.io
- GitHub Issues: [Issue Tracker](https://github.com/vedapasupuleti82/solar_grap_csp/issues)
- Website: www.solargram.io

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Supabase for backend infrastructure
- Solar energy community for insights and feedback

---

**Made with ☀️ for a sustainable future!**
#
