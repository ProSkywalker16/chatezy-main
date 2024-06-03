

***Chatezy - A Minimal Chat App in Flutter***

**Description**

Chatezy is a lightweight chat application built using the Flutter framework and Firebase for real-time communication. It provides a user-friendly interface for one-on-one or group conversations, making it ideal for personal or small-scale group chats.

**Prerequisites**

- Flutter development environment set up ([https://docs.flutter.dev/](https://docs.flutter.dev/))
- Firebase project with enabled features ([https://console.firebase.google.com/](https://console.firebase.google.com/))
  - Realtime Database ([https://firebase.google.com/docs/database](https://firebase.google.com/docs/database))
  - Authentication ([https://firebase.google.com/docs/auth](https://firebase.google.com/docs/auth)) (optional, for user login)

**Installation**

1. Clone the repository:

   ```bash
   git clone https://github.com/<your-username>/chatezy.git
   ```

2. Navigate to the project directory:

   ```bash
   cd chatezy
   ```

3. Install dependencies:

   ```bash
   flutter pub get
   ```

**Configuration**

1. Replace the placeholder values in `firebase_config.dart` with your Firebase project configuration:

   ```dart
   // firebase_config.dart

   const firebaseConfig = {
     // ... your Firebase project configuration details ...
   };
   ```

2. (Optional) If using Firebase Authentication, configure authentication methods in your Firebase console and implement the login flow in the app.

**Running the App**

1. Connect your device or launch an emulator.

2. Run the app:

   ```bash
   flutter run
   ```

**Usage**

1. Open the app on your device or emulator.

2. Enter a username (and optionally sign in if using authentication).

3. Start chatting with friends or create groups for conversations.

**Features**

- Real-time messaging using Firebase Realtime Database
- User interface for sending and receiving messages
- (Optional) User authentication using Firebase Authentication

**Contributing**

We welcome contributions to improve Chatezy! Feel free to fork the repository, make changes, and submit pull requests. This app was made by the guidance of renowned youtuber Mr Hussain Mustafa's videos.

**License**

This project is licensed under the MIT License ([https://opensource.org/license/mit](https://opensource.org/license/mit)).
