# bloc_clean_architecture

Flutter Clean Architecture with BLoC state management

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

### Prerequisites
1. **Flutter SDK**: Ensure you have Flutter SDK installed. You can follow the [official installation guide](https://docs.flutter.dev/get-started/install).
2. **Editor**:
    - Visual Studio Code (with Flutter and Dart extensions) **or**
    - Android Studio.
3. **Android Emulator or Physical Device**:
    - Use Android Studio to set up an emulator.
    - If using a physical device, enable *USB Debugging* in Developer Options.
4. **Xcode (for iOS)**:
    - Install Xcode and configure your Apple Developer account for iOS builds.

**Debugging a Flutter App:**

* **Launch in Debug Mode:**
    * Open your Flutter project in your IDE.
    * Select "Debug" mode when running your app.
    * **(VS Code):** Go to "Run" > "Start Debugging" or press F5.
    * **(Android Studio):** Click the green "Debug" button.

**Building a Flutter App:**

* **Build for Different Environments:**
    * **Debug Mode:**
        * Run `flutter run` to build and run your app in debug mode.
    * **Release Mode:**
        * Run `flutter build release` to generate a production-ready build.

* **Customizing Build Options:**
    * **`flutter build` options:**
        * `--target`: Specify the target platform (e.g., `--target android-arm`)
        * `--split-per-abi`: Create separate APKs for different architectures.
        * `--profile`: Build a profile release for performance analysis. 

## **Clean Architecture Overview**

The **Clean Architecture** is a software design pattern that promotes separation of concerns and a well-defined structure. This architecture ensures scalability, testability, and ease of maintenance by dividing the project into distinct layers:

### **Layers of Clean Architecture**

1. **Presentation Layer**
    - Handles the UI (Widgets) and state management using BLoC.
    - Uses `Stream` or `Cubit` to react to changes in state.

2. **Domain Layer**
    - Contains business logic, including **use cases** and **entities**.
    - Pure Dart code without dependencies on external packages.
    - Example: A `LoginUseCase` that defines the rules for login functionality.

3. **Data Layer**
    - Handles data operations, such as API calls, caching, and database operations.
    - Includes **repositories**, which act as an abstraction between the data sources and domain layer.
    - Example: A `UserRepository` that interacts with APIs for login.

4. **Core Layer** (Optional)
    - Contains utilities, error handling, and shared components used across the app.

This separation allows the application to remain modular, making it easier to replace or modify any layer without affecting the others.

---

## **Login Information**

This application includes a sample **Login** implementation with the following credentials:

- **Email**: `eve.holt@reqres.in`
- **Password**: `cityslicka`
