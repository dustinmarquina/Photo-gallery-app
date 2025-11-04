import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class ImageService {
  final ImagePicker _picker = ImagePicker();

  // Request camera permission
  Future<bool> requestCameraPermission() async {
    final status = await Permission.camera.request();
    return status.isGranted;
  }

  // Request storage permission (for Android)
  Future<bool> requestStoragePermission() async {
    if (Platform.isAndroid) {
      final status = await Permission.storage.request();
      return status.isGranted || status.isLimited;
    }
    return true; // iOS handles this differently
  }

  // Request photos permission (for iOS)
  Future<bool> requestPhotosPermission() async {
    final status = await Permission.photos.request();
    return status.isGranted || status.isLimited;
  }

  // Pick image from camera
  Future<File?> pickImageFromCamera() async {
    try {
      final hasPermission = await requestCameraPermission();
      if (!hasPermission) {
        return null;
      }

      final XFile? image = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 80,
      );

      if (image != null) {
        return await _saveImagePermanently(image);
      }
      return null;
    } catch (e) {
      print('Error picking image from camera: $e');
      return null;
    }
  }

  // Pick image from gallery
  Future<File?> pickImageFromGallery() async {
    try {
      final hasPermission = await requestPhotosPermission();
      if (!hasPermission) {
        return null;
      }

      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );

      if (image != null) {
        return await _saveImagePermanently(image);
      }
      return null;
    } catch (e) {
      print('Error picking image from gallery: $e');
      return null;
    }
  }

  // Save image permanently to app directory
  Future<File> _saveImagePermanently(XFile image) async {
    final appDir = await getApplicationDocumentsDirectory();
    final fileName =
        '${DateTime.now().millisecondsSinceEpoch}${path.extension(image.path)}';
    final savedImage = File('${appDir.path}/$fileName');
    return File(image.path).copy(savedImage.path);
  }

  // Get all saved images
  Future<List<File>> getSavedImages() async {
    try {
      final appDir = await getApplicationDocumentsDirectory();
      final directory = Directory(appDir.path);

      if (!await directory.exists()) {
        return [];
      }

      final files = directory
          .listSync()
          .where((item) => item is File && _isImageFile(item.path))
          .map((item) => File(item.path))
          .toList();

      // Sort by modification time (newest first)
      files
          .sort((a, b) => b.lastModifiedSync().compareTo(a.lastModifiedSync()));

      return files;
    } catch (e) {
      print('Error getting saved images: $e');
      return [];
    }
  }

  // Check if file is an image
  bool _isImageFile(String filePath) {
    final ext = path.extension(filePath).toLowerCase();
    return ['.jpg', '.jpeg', '.png', '.gif', '.bmp', '.webp'].contains(ext);
  }

  // Delete image
  Future<bool> deleteImage(File file) async {
    try {
      if (await file.exists()) {
        await file.delete();
        return true;
      }
      return false;
    } catch (e) {
      print('Error deleting image: $e');
      return false;
    }
  }

  // Delete all images
  Future<void> deleteAllImages() async {
    try {
      final images = await getSavedImages();
      for (final image in images) {
        await image.delete();
      }
    } catch (e) {
      print('Error deleting all images: $e');
    }
  }
}
