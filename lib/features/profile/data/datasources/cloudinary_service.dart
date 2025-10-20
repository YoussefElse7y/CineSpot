import 'dart:io';
import 'package:dio/dio.dart';

class CloudinaryService {
  // Replace with your actual credentials from Cloudinary dashboard
  static const String cloudName = 'du37feglh'; // Find this in Dashboard
  static const String apiKey = '226556228578167'; // Your API key
  static const String uploadPreset = 'cinespot_profiles'; // Create unsigned preset
  
  final Dio _dio;

  CloudinaryService({Dio? dio}) : _dio = Dio() {
    _dio.options = BaseOptions(
      baseUrl: 'https://api.cloudinary.com/v1_1/$cloudName',
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'multipart/form-data',
      },
    );
  }

  /// Uploads an image to Cloudinary and returns the secure URL
  /// This uses unsigned upload (no signature required)
  Future<String> uploadImage(File imageFile) async {
    try {
      // Create form data
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          imageFile.path,
          filename: imageFile.path.split('/').last,
        ),
        'upload_preset': uploadPreset,
        'api_key': apiKey,
        'folder': 'profiles', // Optional: organize images in folders
      });

      // Upload to Cloudinary
      final response = await _dio.post(
        '/image/upload',
        data: formData,
        onSendProgress: (sent, total) {
          final progress = (sent / total * 100).toStringAsFixed(0);
          print('Upload progress: $progress%');
        },
      );

      if (response.statusCode == 200 && response.data != null) {
        final secureUrl = response.data['secure_url'] as String;
        final publicId = response.data['public_id'] as String;
        
        print('Image uploaded successfully!');
        print('URL: $secureUrl');
        print('Public ID: $publicId');
        
        return secureUrl;
      } else {
        throw Exception('Failed to upload image: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        print('Cloudinary error: ${e.response?.data}');
        throw Exception(
          'Upload failed: ${e.response?.data['error']?['message'] ?? e.message}',
        );
      } else {
        throw Exception('Network error: ${e.message}');
      }
    } catch (e) {
      throw Exception('Failed to upload image: $e');
    }
  }

  /// Uploads an image with transformation options
  Future<String> uploadImageWithTransformation(
    File imageFile, {
    int? width,
    int? height,
    String quality = 'auto',
  }) async {
    try {
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(imageFile.path),
        'upload_preset': uploadPreset,
        'api_key': apiKey,
        'folder': 'profiles',
        // Transformations
        if (width != null) 'width': width,
        if (height != null) 'height': height,
        'quality': quality,
        'crop': 'fill', // Crop and fill to exact dimensions
        'gravity': 'face', // Focus on faces when cropping
      });

      final response = await _dio.post('/image/upload', data: formData);

      if (response.statusCode == 200 && response.data != null) {
        return response.data['secure_url'] as String;
      } else {
        throw Exception('Failed to upload image');
      }
    } catch (e) {
      throw Exception('Failed to upload image: $e');
    }
  }

  /// Deletes an image from Cloudinary
  /// Note: This requires authenticated requests with API secret
  /// For production, implement this on your backend
  Future<void> deleteImage(String publicId) async {
    // Note: Deletion requires API secret and signature
    // This should be done from backend for security
    // For now, we'll just keep old images (free tier has 25GB)
    print('Image deletion should be handled by backend');
    
    // If you really need client-side deletion, you'll need to:
    // 1. Generate signature on backend
    // 2. Send signed request
    // 3. Or use Admin API from backend only
  }

  /// Generates a thumbnail URL from an existing Cloudinary URL
  String getThumbnailUrl(String cloudinaryUrl, {int size = 200}) {
    // Extract public_id from URL
    final uri = Uri.parse(cloudinaryUrl);
    final pathSegments = uri.pathSegments;
    
    if (pathSegments.length < 3) return cloudinaryUrl;
    
    // Insert transformation parameters
    final uploadIndex = pathSegments.indexOf('upload');
    if (uploadIndex == -1) return cloudinaryUrl;
    
    final transformation = 'w_$size,h_$size,c_fill,g_face,q_auto';
    final newPath = [
      ...pathSegments.sublist(0, uploadIndex + 1),
      transformation,
      ...pathSegments.sublist(uploadIndex + 1),
    ].join('/');
    
    return '${uri.scheme}://${uri.host}/$newPath';
  }
}