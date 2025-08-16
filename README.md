# 🔐 Flutter Advanced Authentication System

A comprehensive authentication system built with Flutter that supports multiple login methods including email/password, Google Sign-In, and Apple Sign-In.

## ✨ Features

- 📧 **Email/Password Authentication** - Traditional email and password login
- 🔍 **Google Sign-In** - Quick login with Google accounts
- 🍎 **Apple Sign-In** - Seamless Apple ID authentication
- 🔒 **Secure Authentication** - Firebase-powered backend security
- 📱 **Beautiful UI** - Clean and modern interface design
- 🚀 **Fast & Reliable** - Optimized performance with Firebase
- 🔄 **Password Recovery** - Forgot password functionality
- 👤 **User Registration** - Easy account creation process

## 📸 Screenshots

<div align="center">
  <img src="sscreenshots\S1.jpg" alt="Login Screen" width="300"/>
</div>

*Beautiful and intuitive login interface with multiple authentication options*

## 🛠️ Technologies Used

- **Flutter** - Cross-platform mobile development framework
- **Firebase Auth** - Backend authentication service
- **Google Sign-In** - Google authentication integration
- **Apple Sign-In** - Apple ID authentication (iOS)

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_svg: ^2.2.0
  firebase_core: ^4.0.0
  firebase_auth: ^6.0.1
  google_sign_in: ^5.4.2
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (latest stable version)
- Firebase project setup
- Google Cloud Console project (for Google Sign-In)
- Apple Developer account (for Apple Sign-In on iOS)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/OnoPUNPUN/authentication.git
   cd flutter-auth-system
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Firebase Setup**
   - Create a new Firebase project at [Firebase Console](https://console.firebase.google.com/)
   - Add your Android/iOS app to the project
   - Download and add `google-services.json` (Android) and `GoogleService-Info.plist` (iOS)
   - Enable Authentication methods in Firebase Console

4. **Google Sign-In Setup**
   - Configure OAuth 2.0 in Google Cloud Console
   - Add SHA-1 fingerprint for Android
   - Configure OAuth consent screen

5. **Run the app**
   ```bash
   flutter run
   ```

## 🔧 Configuration

### Firebase Configuration

1. **Android Setup** (`android/app/google-services.json`)
   - Place the downloaded `google-services.json` in `android/app/`

2. **iOS Setup** (`ios/Runner/GoogleService-Info.plist`)
   - Place the downloaded `GoogleService-Info.plist` in `ios/Runner/`

### Authentication Methods

Enable the following authentication methods in your Firebase Console:

- ✅ Email/Password
- ✅ Google
- ✅ Apple (iOS only)

## 📱 Usage

### Email/Password Authentication
```dart
// Sign in with email and password
await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: _emailTEcontroller.text.trim(),
    password: _passwordTEcontroller.text,
);
```

### Google Sign-In
```dart
// Google Sign-In implementation
final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
final GoogleSignInAuthentication gAuth = await gUser!.authentication;
final creadential = GoogleAuthProvider.credential(
    accessToken: gAuth.accessToken,
    idToken: gAuth.idToken,
);
```

### Apple Sign-In (iOS)
```dart
// Apple Sign-In implementation
final appleCredential = await SignInWithApple.getAppleIDCredential(
  scopes: [
    AppleIDAuthorizationScopes.email,
    AppleIDAuthorizationScopes.fullName,
  ],
);
```

## 🎨 UI Components

- **Login Screen** - Main authentication interface
- **Registration Form** - New user account creation
- **Password Recovery** - Forgot password functionality
- **Social Login Buttons** - Google and Apple sign-in options
- **Form Validation** - Real-time input validation
- **Loading States** - Beautiful loading animations

## 🔐 Security Features

- ✅ Firebase Authentication backend
- ✅ Secure token management
- ✅ Input validation and sanitization
- ✅ Password strength requirements
- ✅ Account verification via email
- ✅ Secure logout functionality

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📞 Support

If you have any questions or need help, please feel free to:

- 🐛 Open an issue on GitHub
- 📧 Send an email to [punpunonodera754@gmail.com]
- 💬 Start a discussion in the repository

## 🙏 Acknowledgments

- Firebase team for the robust authentication service
- Flutter team for the amazing framework
- Google Sign-In package contributors
- The open-source community for continuous support

---

<div align="center">
  <p>Made with ❤️ using Flutter</p>
  <p>⭐ Star this repo if you found it helpful!</p>
</div>