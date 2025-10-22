import 'dart:io';
import 'package:cine_spot/core/theme/theme_constants.dart';
import 'package:cine_spot/features/profile/domain/entities/profile_entity.dart';
import 'package:cine_spot/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _fullNameController;
  late TextEditingController _nicknameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  String _selectedCountryCode = '+20';
  String _selectedGender = 'Male';
  File? _selectedImage;
  String? _currentPhotoUrl;

  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _fullNameController = TextEditingController();
    _nicknameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();

    // Load current profile
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId != null) {
      context.read<ProfileBloc>().add(ProfileEvent.loadProfile(userId));
    }
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _nicknameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 512,
      maxHeight: 512,
      imageQuality: 75,
    );

    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  void _handleUpdate() {
    if (_formKey.currentState!.validate()) {
      final userId = FirebaseAuth.instance.currentUser?.uid;
      if (userId == null) return;

      final profile = ProfileEntity(
        userId: userId,
        fullName: _fullNameController.text.trim(),
        nickname: _nicknameController.text.trim(),
        email: _emailController.text.trim(),
        phoneNumber: _phoneController.text.trim(),
        countryCode: _selectedCountryCode,
        gender: _selectedGender,
        photoUrl: _currentPhotoUrl,
      );

      context.read<ProfileBloc>().add(
            ProfileEvent.updateProfile(profile, _selectedImage),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {
        state.maybeWhen(
          loaded: (profile) {
            // Pre-fill form with existing data
            if (_fullNameController.text.isEmpty) {
              _fullNameController.text = profile.fullName;
              _nicknameController.text = profile.nickname;
              _emailController.text = profile.email;
              _phoneController.text = profile.phoneNumber;
              _selectedCountryCode = profile.countryCode;
              _selectedGender = profile.gender;
              _currentPhotoUrl = profile.photoUrl;
              setState(() {});
            }

            // Show success message
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Profile updated successfully!')),
            );
          },
          error: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(message), backgroundColor: Colors.red),
            );
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
            title: const Text(
              'Edit Profile',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    // Profile Picture
                    _buildProfilePicture(isDark),
                    const SizedBox(height: 32),
                    // Full Name
                    _buildTextField(
                      controller: _fullNameController,
                      hint: 'Full Name',
                      isDark: isDark,
                    ),
                    const SizedBox(height: 16),
                    // Nickname
                    _buildTextField(
                      controller: _nicknameController,
                      hint: 'Nickname',
                      isDark: isDark,
                    ),
                    const SizedBox(height: 16),
                    // Email
                    _buildTextField(
                      controller: _emailController,
                      hint: 'Email',
                      isDark: isDark,
                      icon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 16),
                    // Phone Number
                    _buildPhoneField(isDark),
                    const SizedBox(height: 16),
                    // Gender
                    _buildGenderField(isDark),
                    const SizedBox(height: 16),
                    // Country
                    _buildTextField(
                      controller: TextEditingController(text: 'United States'),
                      hint: 'Country',
                      isDark: isDark,
                      readOnly: true,
                    ),
                    const SizedBox(height: 48),
                    // Update Button
                    _buildUpdateButton(state),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildProfilePicture(bool isDark) {
    return GestureDetector(
      onTap: _pickImage,
      child: Stack(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isDark
                  ? ThemeConstants.textFieldBackgroundColorDark
                  : ThemeConstants.textFieldBackgroundColorLight,
              image: _selectedImage != null
                  ? DecorationImage(
                      image: FileImage(_selectedImage!),
                      fit: BoxFit.cover,
                    )
                  : _currentPhotoUrl != null
                      ? DecorationImage(
                          image: NetworkImage(_currentPhotoUrl!),
                          fit: BoxFit.cover,
                        )
                      : null,
            ),
            child: _selectedImage == null && _currentPhotoUrl == null
                ? Icon(
                    Icons.person,
                    size: 60,
                    color: isDark ? Colors.grey[700] : Colors.grey[400],
                  )
                : null,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: ThemeConstants.primaryLight,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isDark
                      ? ThemeConstants.backgroundDark
                      : ThemeConstants.backgroundLight,
                  width: 3,
                ),
              ),
              child: const Icon(Icons.edit, color: Colors.white, size: 18),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required bool isDark,
    IconData? icon,
    TextInputType? keyboardType,
    bool readOnly = false,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        suffixIcon: icon != null
            ? Icon(
                icon,
                color: isDark ? Colors.grey[600] : Colors.grey[500],
              )
            : null,
        filled: true,
        fillColor: isDark
            ? ThemeConstants.textFieldBackgroundColorDark
            : ThemeConstants.textFieldBackgroundColorLight,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      keyboardType: keyboardType,
      readOnly: readOnly,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $hint';
        }
        return null;
      },
    );
  }

  Widget _buildPhoneField(bool isDark) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          decoration: BoxDecoration(
            color: isDark
                ? ThemeConstants.textFieldBackgroundColorDark
                : ThemeConstants.textFieldBackgroundColorLight,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              const Text('🇪🇬', style: TextStyle(fontSize: 24)),
              const SizedBox(width: 8),
              const Icon(Icons.keyboard_arrow_down, size: 20),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: TextFormField(
            controller: _phoneController,
            decoration: InputDecoration(
              hintText: '+1 111 467 378 399',
              filled: true,
              fillColor: isDark
                  ? ThemeConstants.textFieldBackgroundColorDark
                  : ThemeConstants.textFieldBackgroundColorLight,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Required';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget _buildGenderField(bool isDark) {
    return DropdownButtonFormField<String>(
      initialValue: _selectedGender,
      decoration: InputDecoration(
        hintText: 'Gender',
        suffixIcon: Icon(
          Icons.keyboard_arrow_down,
          color: isDark ? Colors.grey[600] : Colors.grey[500],
        ),
        filled: true,
        fillColor: isDark
            ? ThemeConstants.textFieldBackgroundColorDark
            : ThemeConstants.textFieldBackgroundColorLight,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      items: ['Male', 'Female', 'Other']
          .map(
            (gender) => DropdownMenuItem(
              value: gender,
              child: Text(gender),
            ),
          )
          .toList(),
      onChanged: (value) {
        setState(() {
          _selectedGender = value!;
        });
      },
    );
  }

  Widget _buildUpdateButton(ProfileState state) {
    final isLoading = state.maybeWhen(
      loading: () => true,
      orElse: () => false,
    );

    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: isLoading ? null : _handleUpdate,
        style: ElevatedButton.styleFrom(
          backgroundColor: ThemeConstants.primaryLight,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: isLoading
            ? const SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
            : const Text(
                'Update',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}