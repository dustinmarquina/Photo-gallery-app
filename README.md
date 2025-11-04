# Photo Gallery App

A Flutter application that integrates native device features for taking pictures and displaying them in a gallery view.

## Features

- 📸 Take photos using device camera
- 🖼️ Pick images from gallery
- 📱 Grid view display of photos
- 💾 Local storage persistence
- 🔒 Permission handling for camera and storage

## Technical Stack

- **Flutter SDK**: 3.0.0+
- **Packages**:
  - `image_picker`: ^1.0.4 - Camera and gallery access
  - `permission_handler`: ^11.0.1 - Runtime permissions
  - `path_provider`: ^2.1.1 - Local storage paths
  - `path`: ^1.8.3 - Path manipulation

## Getting Started

### Prerequisites

- Flutter SDK installed
- Android Studio / Xcode for platform-specific builds
- Device or emulator with camera support

### Installation

1. Clone or download the project
2. Navigate to project directory
3. Install dependencies:

   ```bash
   flutter pub get
   ```

4. Run the app:
   ```bash
   flutter run
   ```

## Platform Configuration

### Android

Permissions are configured in `android/app/src/main/AndroidManifest.xml`

### iOS

Permissions are configured in `ios/Runner/Info.plist`

## Usage

1. **Add Photo**: Tap the floating action button
2. **Choose Source**: Select Camera or Gallery
3. **View Gallery**: Photos display in a grid layout
4. **Delete Photo**: Long press on any image to delete

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── screens/
│   └── gallery_screen.dart   # Main gallery UI
├── services/
│   └── image_service.dart    # Image handling logic
└── widgets/
    └── image_grid_item.dart  # Grid item widget
```

## License

This project is created for educational purposes.
