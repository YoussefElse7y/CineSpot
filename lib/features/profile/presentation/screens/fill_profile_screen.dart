import 'package:cine_spot/core/routing/routes.dart';
import 'package:cine_spot/core/theme/theme_constants.dart';
import 'package:cine_spot/features/profile/domain/entities/profile_entity.dart';
import 'package:cine_spot/features/profile/presentation/bloc/profile_bloc.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class FillProfileScreen extends StatefulWidget {
  const FillProfileScreen({super.key});

  @override
  State<FillProfileScreen> createState() => _FillProfileScreenState();
}

class _FillProfileScreenState extends State<FillProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _nicknameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  String _selectedCountryCode = '+1';
  String? _selectedGender;
  File? _selectedImage;

  final ImagePicker _picker = ImagePicker();

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

  void _handleContinue() {
    if (_formKey.currentState!.validate()) {
      final userId = FirebaseAuth.instance.currentUser?.uid;
      if (userId == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('User not authenticated'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      final profile = ProfileEntity(
        userId: userId,
        fullName: _fullNameController.text.trim(),
        nickname: _nicknameController.text.trim(),
        email: _emailController.text.trim(),
        phoneNumber: _phoneController.text.trim(),
        countryCode: _selectedCountryCode,
        gender: _selectedGender!,
      );
      print(profile.toString());

      // Dispatch create profile event
      context.read<ProfileBloc>().add(
        ProfileEvent.createProfile(profile, _selectedImage),
      );
    }
  }

  void _handleSkip() {
    // Navigate to home without completing profile
    Navigator.pushReplacementNamed(context, Routes.homeScreen);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        state.maybeWhen(
          loaded: (profile) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Profile created successfully!')),
            );
            Navigator.pushReplacementNamed(context, Routes.homeScreen);
          },
          error: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(message), backgroundColor: Colors.red),
            );
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        appBar: _appBar(context),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(ThemeConstants.spacingL),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  _selectImagePart(isDark),
                  const SizedBox(height: ThemeConstants.spacingXL),
                  // Full Name
                  _fullNameFormField(),
                  const SizedBox(height: ThemeConstants.spacingM),
                  // Nickname
                  _nicknameFormField(isDark),
                  const SizedBox(height: ThemeConstants.spacingM),
                  // Email
                  _emailFormField(isDark),
                  const SizedBox(height: ThemeConstants.spacingM),
                  // Phone Number
                  _phoneNumber(isDark),
                  const SizedBox(height: ThemeConstants.spacingM),
                  // Gender
                  _selectGender(isDark),
                  const SizedBox(height: ThemeConstants.spacingXL * 2),
                  // Continue Button
                  _continueButton(),
                  const SizedBox(height: ThemeConstants.spacingM),
                  // Skip Button
                  _skipButton(isDark),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  DropdownButtonFormField<String> _selectGender(bool isDark) {
    return DropdownButtonFormField<String>(
                  value: _selectedGender,
                  decoration: InputDecoration(
                    hintText: 'Gender',
                    suffixIcon: Icon(
                      Icons.keyboard_arrow_down,
                      color: isDark ? Colors.grey[600] : Colors.grey[500],
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
                      print(value);
                      _selectedGender = value;
                      print(_selectedGender);
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Please select your gender';
                    }
                    return null;
                  },
                );
  }

  Row _phoneNumber(bool isDark) {
    return Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: ThemeConstants.spacingM,
                      ),
                      decoration: BoxDecoration(
                        color: isDark
                            ? ThemeConstants.textFieldBackgroundColorDark
                            : ThemeConstants.textFieldBackgroundColorLight,
                        borderRadius: BorderRadius.circular(
                          ThemeConstants.radiusL,
                        ),
                      ),
                      child: DropdownButton<String>(
                        value: ['+20'].contains(_selectedCountryCode)
                            ? _selectedCountryCode
                            : '+20',
                        underline: const SizedBox(),
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: isDark ? Colors.white : Colors.black,
                        ),
                        items: ['+20']
                            .map(
                              (code) => DropdownMenuItem(
                                value: code,
                                child: Row(
                                  children: [
                                    const Text(
                                      '🇪🇬',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(code),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedCountryCode = value!;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: ThemeConstants.spacingM),
                    Expanded(
                      child: TextFormField(
                        controller: _phoneController,
                        decoration: const InputDecoration(
                          hintText: 'Phone Number',
                        ),
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                );
  }

  GestureDetector _selectImagePart(bool isDark) {
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
                : null,
          ),
          child: _selectedImage == null
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

  AppBar _appBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
      title: const Text(
        'Fill Your Profile',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
      centerTitle: false,
    );
  }

  TextButton _skipButton(bool isDark) {
    return TextButton(
      onPressed: _handleSkip,
      child: Text(
        'Skip',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: isDark ? Colors.grey[400] : Colors.grey[600],
        ),
      ),
    );
  }

  BlocBuilder<ProfileBloc, ProfileState> _continueButton() {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        final isLoading = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );

        return SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: isLoading ? null : _handleContinue,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(ThemeConstants.radiusXL),
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
                    'Continue',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
          ),
        );
      },
    );
  }

  TextFormField _fullNameFormField() {
    return TextFormField(
      controller: _fullNameController,
      decoration: const InputDecoration(hintText: 'Full Name'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your full name';
        }
        if (value.length < 3) {
          return 'Full name must be at least 3 characters long';
        }
        return null;
      },
    );
  }

  TextFormField _emailFormField(bool isDark) {
    return TextFormField(
      controller: _emailController,
      decoration: InputDecoration(
        hintText: 'Email',
        suffixIcon: Icon(
          Icons.email_outlined,
          color: isDark ? Colors.grey[600] : Colors.grey[500],
        ),
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        }
        if (!value.contains('@')) {
          return 'Please enter a valid email';
        }
        return null;
      },
    );
  }

  TextFormField _nicknameFormField(bool isDark) {
    return TextFormField(
      controller: _nicknameController,
      decoration: const InputDecoration(hintText: 'Nickname'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a nickname';
        }
        return null;
      },
    );
  }
}
