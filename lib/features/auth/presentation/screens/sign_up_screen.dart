import 'package:cine_spot/core/routing/routes.dart';
import 'package:cine_spot/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cine_spot/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:lottie/lottie.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleSignUp() {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    context.read<AuthBloc>().add(AuthEvent.signUp(email, password));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.maybeWhen(
            authenticated: (user) {
              context.read<ProfileBloc>().add(
                ProfileEvent.checkProfileExists(user.id),
              );
            },
            error: (message) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(message)));
            },
            orElse: () {},
          );
        },
        child: BlocListener<ProfileBloc, ProfileState>(
          listener: (context, profileState) {
            profileState.maybeWhen(
              notFound: () {
                // No profile, go to fill profile
                Navigator.pushReplacementNamed(
                  context,
                  Routes.fillProfileScreen,
                );
              },
              loaded: (profile) {
                // Profile exists, go to home
                Navigator.pushReplacementNamed(context, Routes.mainScreen);
              },
              orElse: () {},
            );
          },
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  // Back button
                  _backButton(context),
                  const SizedBox(height: 10),
                  // Logo
                  _signUpAnimation(),
                  const SizedBox(height: 40),
                  // Title
                  const Text(
                    'Create Your Account',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 40),
                  // Email field
                  _emailField(),
                  const SizedBox(height: 20),
                  // Password field
                  _passwordField(),
                  const SizedBox(height: 20),
                  // Remember me
                  _rememberMePart(),
                  const SizedBox(height: 30),
                  // Sign up button
                  _signUpButton(),
                  const SizedBox(height: 30),
                  // // Divider
                  // MyDivider(),
                  // const SizedBox(height: 30),
                  // // Social login buttons
                  // _socialLoginButtons(),
                  // const SizedBox(height: 30),
                  // // Sign in link
                  _signInLink(context),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row _signInLink(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account? ',
          style: TextStyle(color: Colors.grey[400]),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, Routes.signInScreen);
          },
          child: const Text(
            'Sign in',
            style: TextStyle(
              color: Color(0xFFD32F2F),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  BlocBuilder<AuthBloc, AuthState> _signUpButton() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        final isLoading = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );

        return SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: isLoading ? null : _handleSignUp,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
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
                    'Sign up',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
          ),
        );
      },
    );
  }

  Row _rememberMePart() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _rememberMe = !_rememberMe;
            });
          },
          child: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFD32F2F), width: 2),
              borderRadius: BorderRadius.circular(6),
              color: _rememberMe ? const Color(0xFFD32F2F) : Colors.transparent,
            ),
            child: _rememberMe
                ? const Icon(Icons.check, color: Colors.white, size: 18)
                : null,
          ),
        ),
        const SizedBox(width: 12),
        const Text('Remember me', style: TextStyle(fontSize: 16)),
      ],
    );
  }

  TextField _passwordField() {
    return TextField(
      controller: _passwordController,
      style: const TextStyle(color: Colors.white),
      obscureText: !_isPasswordVisible,
      decoration: InputDecoration(
        hintText: 'Password',
        hintStyle: TextStyle(color: Colors.grey[600]),
        prefixIcon: Icon(Icons.lock_outline, color: Colors.grey[600]),
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey[600],
          ),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        ),
        border: InputBorder.none,
        contentPadding: const EdgeInsets.all(16),
      ),
    );
  }

  Container _emailField() {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: TextField(
        controller: _emailController,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: 'Email',
          hintStyle: TextStyle(color: Colors.grey[600]),
          prefixIcon: Icon(Icons.email_outlined, color: Colors.grey[600]),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(16),
        ),
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }

  Container _signUpAnimation() {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        // color: const Color(0xFFD32F2F),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Lottie.asset('assets/lotties/login.json'),
    );
  }

  Align _backButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }
}
