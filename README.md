# CineSpot 🎬

A modern Flutter application for discovering and exploring movies and TV shows. CineSpot provides a comprehensive platform for movie enthusiasts to browse trending content, search for specific titles, and manage their watchlists.

## ✨ Features

### 🏠 Home Screen
- **Top Movies This Week** - Discover the most popular movies currently trending
- **Now Playing** - Browse movies currently in theaters
- **Trending TV Shows** - Explore popular television series

### 🔍 Explore & Search
- **Multi-Search** - Search across movies, TV shows, people, and production companies
- **Advanced Filters** - Filter by year, region, and release date
- **Trending Content** - Stay updated with what's popular

### 👤 User Management
- **Authentication** - Secure login with Firebase Auth
- **Social Login** - Sign in with Google, Facebook, and Apple
- **Profile Management** - Customize your profile and preferences

### 🌐 Internationalization
- **Multi-language Support** - English, Arabic, and French
- **Localized Content** - Region-specific movie and TV show data

### 🎨 Theming
- **Dark/Light Mode** - Toggle between themes or follow system preference
- **Customizable UI** - Modern, responsive design

### 📱 Cross-Platform
- **iOS** - Native iOS app
- **Android** - Native Android app
- **Web** - Progressive web application
- **Desktop** - Windows, macOS, and Linux support

## 🛠️ Tech Stack

### Core Framework
- **Flutter** - Cross-platform UI framework
- **Dart** - Programming language

### State Management
- **Flutter Bloc** - Predictable state management
- **Freezed** - Code generation for immutable classes

### Backend & Services
- **Firebase** - Authentication and cloud services
- **Firebase Auth** - User authentication
- **Cloud Firestore** - NoSQL database
- **TMDB API** - The Movie Database API for content

### Architecture
- **Clean Architecture** - Separation of concerns
- **Dependency Injection** - GetIt for service locator
- **Repository Pattern** - Data access abstraction

### Additional Libraries
- **Dio** - HTTP client for API calls
- **Retrofit** - Type-safe REST client
- **Cached Network Image** - Image caching and loading
- **Lottie** - Beautiful animations
- **Shared Preferences** - Local data storage

## 📋 Prerequisites

Before running this project, ensure you have:

- **Flutter SDK** (3.9.2 or higher)
- **Dart SDK** (included with Flutter)
- **Android Studio** or **VS Code** with Flutter extensions
- **Xcode** (for iOS development)
- **Firebase project** with authentication enabled
- **TMDB API key** (for movie/TV show data)

## 🚀 Getting Started

### 1. Clone the Repository
```bash
git clone <repository-url>
cd cine_spot
```

### 2. Install Dependencies
```bash
flutter pub get
```

### 3. Firebase Setup
1. Create a Firebase project at [Firebase Console](https://console.firebase.google.com/)
2. Enable Authentication and Firestore
3. Download `google-services.json` for Android
4. Download `GoogleService-Info.plist` for iOS
5. Place the files in their respective platform directories

### 4. TMDB API Setup
1. Get an API key from [The Movie Database](https://www.themoviedb.org/settings/api)
2. Add your API key to the environment configuration

### 5. Generate Code
```bash
flutter packages pub run build_runner build
```

### 6. Run the Application
```bash
# For development
flutter run

# For specific platforms
flutter run -d android
flutter run -d ios
flutter run -d web
```

## 📁 Project Structure

```
lib/
├── core/                    # Core functionality
│   ├── di/                 # Dependency injection
│   ├── helpers/            # Utility functions
│   ├── network/            # Network configuration
│   ├── routing/            # App navigation
│   └── theme/              # App theming
├── features/               # Feature modules
│   ├── auth/               # Authentication
│   ├── explore/            # Search and discovery
│   ├── home/               # Home screen
│   ├── language/           # Internationalization
│   ├── profile/            # User profile
│   └── theme/              # Theme management
├── l10n/                   # Localization files
└── main.dart              # App entry point
```

## 🎯 Key Features Implementation

### State Management
The app uses Flutter Bloc for state management with a clean architecture:

```dart
// Example: Home Bloc
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  // Handles top movies, now playing, and trending TV shows
}
```

### API Integration
- **TMDB API** for movie and TV show data
- **Retrofit** for type-safe API calls
- **Dio** for HTTP requests with logging

### Authentication Flow
- Firebase Authentication
- Social login providers
- Secure token management

## 🌍 Localization

The app supports multiple languages:
- **English** (en)
- **Arabic** (ar)
- **French** (fr)

Localization files are located in `lib/l10n/` and use ARB (Application Resource Bundle) format.

## 🎨 Theming

The app supports:
- **Light Theme** - Clean, bright interface
- **Dark Theme** - Easy on the eyes
- **System Theme** - Follows device preference

## 📱 Platform Support

| Platform | Status |
|----------|--------|
| Android  | ✅ Supported |
| iOS      | ✅ Supported |
| Web      | ✅ Supported |
| Windows  | ✅ Supported |
| macOS    | ✅ Supported |
| Linux    | ✅ Supported |

## 🔧 Configuration

### Environment Variables
Create a `.env` file in the root directory:
```
TMDB_API_KEY=your_tmdb_api_key_here
FIREBASE_PROJECT_ID=your_firebase_project_id
```

### Firebase Configuration
Ensure your Firebase project is properly configured with:
- Authentication enabled
- Firestore database created
- Platform-specific configuration files in place

## 🧪 Testing

Run tests using:
```bash
# Unit tests
flutter test

# Integration tests
flutter test integration_test/
```

## 📦 Building for Production

### Android
```bash
flutter build apk --release
# or
flutter build appbundle --release
```

### iOS
```bash
flutter build ios --release
```

### Web
```bash
flutter build web --release
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [The Movie Database (TMDB)](https://www.themoviedb.org/) for providing the movie and TV show data
- [Flutter](https://flutter.dev/) for the amazing cross-platform framework
- [Firebase](https://firebase.google.com/) for backend services
- The Flutter community for excellent packages and support

## 📞 Support

If you encounter any issues or have questions, please:
1. Check the [Issues](https://github.com/your-repo/issues) page
2. Create a new issue with detailed information
3. Contact the development team

---

**Happy Movie Watching! 🍿**