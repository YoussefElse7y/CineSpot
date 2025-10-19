// lib/features/profile/data/datasources/profile_remote_datasource.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/profile_model.dart';

abstract class ProfileRemoteDataSource {
  /// Creates a new profile in Firestore
  Future<ProfileModel> createProfile(ProfileModel profile);
  
  /// Updates an existing profile in Firestore
  Future<ProfileModel> updateProfile(ProfileModel profile);
  
  /// Gets a profile by user ID
  Future<ProfileModel?> getProfile(String userId);
  
  /// Checks if a profile exists for a user
  Future<bool> checkProfileExists(String userId);
  
  /// Deletes a profile
  Future<void> deleteProfile(String userId);
  
  /// Stream of profile changes (real-time updates)
  Stream<ProfileModel?> profileStream(String userId);
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final FirebaseFirestore firestore;
  
  static const String _collectionName = 'profiles';

  ProfileRemoteDataSourceImpl(this.firestore);

  @override
  Future<ProfileModel> createProfile(ProfileModel profile) async {
    try {
      // Add timestamps
      final profileWithTimestamp = profile.copyWith(
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      // Save to Firestore
      await firestore
          .collection(_collectionName)
          .doc(profile.userId)
          .set(profileWithTimestamp.toJson());

      print('Profile created successfully for user: ${profile.userId}');
      return profileWithTimestamp;
    } on FirebaseException catch (e) {
      print('Firebase error creating profile: ${e.code} - ${e.message}');
      throw Exception('Failed to create profile: ${e.message}');
    } catch (e) {
      print('Error creating profile: $e');
      throw Exception('Failed to create profile: $e');
    }
  }

  @override
  Future<ProfileModel> updateProfile(ProfileModel profile) async {
    try {
      // Update timestamp
      final profileWithTimestamp = profile.copyWith(
        updatedAt: DateTime.now(),
      );

      // Update in Firestore
      await firestore
          .collection(_collectionName)
          .doc(profile.userId)
          .update(profileWithTimestamp.toJson());

      print('Profile updated successfully for user: ${profile.userId}');
      return profileWithTimestamp;
    } on FirebaseException catch (e) {
      print('Firebase error updating profile: ${e.code} - ${e.message}');
      
      // If document doesn't exist, create it instead
      if (e.code == 'not-found') {
        return await createProfile(profile);
      }
      
      throw Exception('Failed to update profile: ${e.message}');
    } catch (e) {
      print('Error updating profile: $e');
      throw Exception('Failed to update profile: $e');
    }
  }

  @override
  Future<ProfileModel?> getProfile(String userId) async {
    try {
      final doc = await firestore
          .collection(_collectionName)
          .doc(userId)
          .get();

      if (doc.exists && doc.data() != null) {
        print('Profile found for user: $userId');
        return ProfileModel.fromFirestore(doc);
      }
      
      print('No profile found for user: $userId');
      return null;
    } on FirebaseException catch (e) {
      print('Firebase error getting profile: ${e.code} - ${e.message}');
      throw Exception('Failed to get profile: ${e.message}');
    } catch (e) {
      print('Error getting profile: $e');
      throw Exception('Failed to get profile: $e');
    }
  }

  @override
  Future<bool> checkProfileExists(String userId) async {
    try {
      final doc = await firestore
          .collection(_collectionName)
          .doc(userId)
          .get();

      final exists = doc.exists;
      print('Profile exists for user $userId: $exists');
      return exists;
    } on FirebaseException catch (e) {
      print('Firebase error checking profile: ${e.code} - ${e.message}');
      throw Exception('Failed to check profile: ${e.message}');
    } catch (e) {
      print('Error checking profile: $e');
      throw Exception('Failed to check profile: $e');
    }
  }

  @override
  Future<void> deleteProfile(String userId) async {
    try {
      await firestore
          .collection(_collectionName)
          .doc(userId)
          .delete();

      print('Profile deleted for user: $userId');
    } on FirebaseException catch (e) {
      print('Firebase error deleting profile: ${e.code} - ${e.message}');
      throw Exception('Failed to delete profile: ${e.message}');
    } catch (e) {
      print('Error deleting profile: $e');
      throw Exception('Failed to delete profile: $e');
    }
  }

  @override
  Stream<ProfileModel?> profileStream(String userId) {
    try {
      return firestore
          .collection(_collectionName)
          .doc(userId)
          .snapshots()
          .map((snapshot) {
        if (snapshot.exists && snapshot.data() != null) {
          return ProfileModel.fromFirestore(snapshot);
        }
        return null;
      });
    } catch (e) {
      print('Error creating profile stream: $e');
      throw Exception('Failed to create profile stream: $e');
    }
  }

  /// Additional utility methods

  /// Updates only specific fields (partial update)
  Future<void> updateProfileFields(
    String userId,
    Map<String, dynamic> fields,
  ) async {
    try {
      fields['updatedAt'] = FieldValue.serverTimestamp();
      
      await firestore
          .collection(_collectionName)
          .doc(userId)
          .update(fields);

      print('Profile fields updated for user: $userId');
    } on FirebaseException catch (e) {
      print('Firebase error updating fields: ${e.code} - ${e.message}');
      throw Exception('Failed to update profile fields: ${e.message}');
    } catch (e) {
      print('Error updating profile fields: $e');
      throw Exception('Failed to update profile fields: $e');
    }
  }

  /// Updates profile photo URL only
  Future<void> updateProfilePhoto(String userId, String photoUrl) async {
    await updateProfileFields(userId, {'photoUrl': photoUrl});
  }

  /// Gets multiple profiles (for future features like friends list)
  Future<List<ProfileModel>> getProfiles(List<String> userIds) async {
    try {
      if (userIds.isEmpty) return [];

      // Firestore 'in' queries are limited to 10 items
      if (userIds.length > 10) {
        // Split into batches
        final profiles = <ProfileModel>[];
        for (int i = 0; i < userIds.length; i += 10) {
          final batch = userIds.skip(i).take(10).toList();
          final batchProfiles = await getProfiles(batch);
          profiles.addAll(batchProfiles);
        }
        return profiles;
      }

      final querySnapshot = await firestore
          .collection(_collectionName)
          .where(FieldPath.documentId, whereIn: userIds)
          .get();

      return querySnapshot.docs
          .map((doc) => ProfileModel.fromFirestore(doc))
          .toList();
    } on FirebaseException catch (e) {
      print('Firebase error getting profiles: ${e.code} - ${e.message}');
      throw Exception('Failed to get profiles: ${e.message}');
    } catch (e) {
      print('Error getting profiles: $e');
      throw Exception('Failed to get profiles: $e');
    }
  }

  /// Search profiles by name (for future search feature)
  Future<List<ProfileModel>> searchProfiles(String query) async {
    try {
      if (query.isEmpty) return [];

      // Note: Firestore doesn't support full-text search natively
      // This is a simple prefix search
      // For production, consider using Algolia or ElasticSearch
      
      final querySnapshot = await firestore
          .collection(_collectionName)
          .where('fullName', isGreaterThanOrEqualTo: query)
          .where('fullName', isLessThanOrEqualTo: '$query\uf8ff')
          .limit(20)
          .get();

      return querySnapshot.docs
          .map((doc) => ProfileModel.fromFirestore(doc))
          .toList();
    } on FirebaseException catch (e) {
      print('Firebase error searching profiles: ${e.code} - ${e.message}');
      throw Exception('Failed to search profiles: ${e.message}');
    } catch (e) {
      print('Error searching profiles: $e');
      throw Exception('Failed to search profiles: $e');
    }
  }

  /// Get profile statistics (for analytics)
  Future<Map<String, dynamic>> getProfileStats(String userId) async {
    try {
      final profile = await getProfile(userId);
      if (profile == null) return {};

      return {
        'hasPhoto': profile.photoUrl != null,
        'isComplete': profile.photoUrl != null &&
            profile.fullName.isNotEmpty &&
            profile.phoneNumber.isNotEmpty,
        'createdDaysAgo': profile.createdAt != null
            ? DateTime.now().difference(profile.createdAt!).inDays
            : null,
      };
    } catch (e) {
      print('Error getting profile stats: $e');
      return {};
    }
  }
}