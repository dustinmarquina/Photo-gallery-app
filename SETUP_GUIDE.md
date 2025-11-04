# Photo Gallery App - Setup Guide

## Installation Steps

1. **Install Flutter SDK**

   - Download from: https://flutter.dev/docs/get-started/install
   - Add Flutter to your PATH

2. **Verify Installation**

   ```bash
   flutter doctor
   ```

3. **Install Dependencies**

   ```bash
   flutter pub get
   ```

4. **Run the App**

   For Android:

   ```bash
   flutter run
   ```

   For iOS (macOS only):

   ```bash
   flutter run
   ```

## Project Structure

```
lib/
├── main.dart                    # Entry point
├── screens/
│   └── gallery_screen.dart      # Main gallery UI with GridView
├── services/
│   └── image_service.dart       # Image handling & permissions
└── widgets/
    └── image_grid_item.dart     # Grid item widget

android/                         # Android-specific configurations
├── app/
│   ├── build.gradle            # App-level build config
│   └── src/main/
│       ├── AndroidManifest.xml # Permissions configuration
│       └── kotlin/
│           └── MainActivity.kt

ios/
└── Runner/
    └── Info.plist              # iOS permissions configuration
```

## Features Implemented

### ✅ Core Features

- **Camera Integration**: Take photos using device camera
- **Gallery Access**: Pick images from photo library
- **Grid Display**: Beautiful grid layout with 3 columns
- **Local Storage**: Persistent storage using path_provider
- **Permission Handling**: Runtime permissions for camera & storage

### ✅ UI/UX Features

- Material 3 design
- Bottom sheet for image source selection
- Full-screen image viewer with pinch-to-zoom
- Long press to delete images
- Confirmation dialogs
- Empty state with helpful message
- Loading indicators
- Snackbar notifications

### ✅ Technical Implementation

- **Packages Used**:

  - `image_picker: ^1.0.4` - Camera & gallery access
  - `permission_handler: ^11.0.1` - Runtime permissions
  - `path_provider: ^2.1.1` - Local storage paths
  - `path: ^1.8.3` - Path manipulation

- **State Management**: StatefulWidget with setState
- **Error Handling**: Try-catch blocks with user feedback
- **Image Quality**: Optimized to 80% to save storage

## Permissions Configured

### Android (AndroidManifest.xml)

- `CAMERA` - Access device camera
- `READ_EXTERNAL_STORAGE` - Read images
- `WRITE_EXTERNAL_STORAGE` - Save images (Android 12 and below)
- `READ_MEDIA_IMAGES` - Read images (Android 13+)

### iOS (Info.plist)

- `NSCameraUsageDescription` - Camera access
- `NSPhotoLibraryUsageDescription` - Photo library read
- `NSPhotoLibraryAddUsageDescription` - Photo library write

## Testing

1. **Test on Android Emulator**

   ```bash
   flutter emulators
   flutter emulators --launch <emulator_id>
   flutter run
   ```

2. **Test on iOS Simulator** (macOS only)

   ```bash
   open -a Simulator
   flutter run
   ```

3. **Test on Physical Device**
   - Enable USB debugging (Android) or Developer mode (iOS)
   - Connect device via USB
   - Run: `flutter run`

## Troubleshooting

### Common Issues

1. **"flutter command not found"**

   - Add Flutter to PATH
   - Restart terminal

2. **Permission denied errors**

   - Check AndroidManifest.xml for Android
   - Check Info.plist for iOS
   - Reinstall app to apply new permissions

3. **Camera not working on emulator**

   - Use physical device for best results
   - Configure emulator camera in AVD settings

4. **Gradle build errors**
   - Run: `flutter clean`
   - Run: `flutter pub get`
   - Rebuild: `flutter run`

## Building Release APK

```bash
flutter build apk --release
```

Output: `build/app/outputs/flutter-apk/app-release.apk`

## Building iOS App (macOS only)

```bash
flutter build ios --release
```

## How to Use the App

1. **Add Photos**

   - Tap the floating action button (+)
   - Choose "Take Photo" or "Choose from Gallery"
   - Grant necessary permissions when prompted

2. **View Photos**

   - Tap any image to view full screen
   - Pinch to zoom in/out
   - Swipe to dismiss

3. **Delete Photos**

   - Long press on any image
   - Confirm deletion in dialog

4. **Gallery Info**
   - Tap info icon (ℹ️) in app bar
   - View total photo count

## Learning Outcomes

This project demonstrates:

- ✅ Flutter UI development with Material Design
- ✅ Native device feature integration
- ✅ Permission handling for Android & iOS
- ✅ File system operations
- ✅ Image handling and optimization
- ✅ State management
- ✅ Platform-specific configurations
- ✅ User experience best practices

## Next Steps for Enhancement

1. Add image editing features
2. Implement cloud backup
3. Add image search/filter
4. Create albums/folders
5. Add share functionality
6. Implement image compression
7. Add metadata (date, location)
8. Support video capture

## License

Educational project for learning Flutter and native device integration.
