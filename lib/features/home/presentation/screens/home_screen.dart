// lib/features/home/presentation/screens/home_screen.dart
import 'package:cine_spot/core/theme/theme_constants.dart';
import 'package:cine_spot/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:cine_spot/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Load user profile
    final authState = context.read<AuthBloc>().state;
    authState.maybeWhen(
      authenticated: (user) {
        context.read<ProfileBloc>().add(
          ProfileEvent.loadProfile(user.id),
        );
      },
      orElse: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CineSpot',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Implement search
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              // TODO: Implement notifications
            },
          ),
        ],
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, profileState) {
          return BlocBuilder<AuthBloc, AuthState>(
            builder: (context, authState) {
              return authState.maybeWhen(
                authenticated: (user) {
                  return profileState.maybeWhen(
                    loaded: (profile) {
                      return SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(ThemeConstants.spacingL),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // User Header
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundImage: profile.photoUrl != null
                                        ? NetworkImage(profile.photoUrl!)
                                        : null,
                                    child: profile.photoUrl == null
                                        ? const Icon(Icons.person, size: 30)
                                        : null,
                                  ),
                                  const SizedBox(width: ThemeConstants.spacingM),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Welcome back,',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: isDark
                                                ? Colors.grey[400]
                                                : Colors.grey[600],
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          profile.fullName,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: ThemeConstants.spacingXL),

                              // Categories
                              const Text(
                                'Categories',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: ThemeConstants.spacingM),
                              SizedBox(
                                height: 120,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    _buildCategoryCard('Action', Icons.local_fire_department, isDark),
                                    _buildCategoryCard('Comedy', Icons.emoji_emotions, isDark),
                                    _buildCategoryCard('Drama', Icons.theater_comedy, isDark),
                                    _buildCategoryCard('Horror', Icons.nightlight, isDark),
                                    _buildCategoryCard('Sci-Fi', Icons.rocket_launch, isDark),
                                  ],
                                ),
                              ),
                              const SizedBox(height: ThemeConstants.spacingXL),

                              // Popular Movies
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Popular Movies',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: const Text('See All'),
                                  ),
                                ],
                              ),
                              const SizedBox(height: ThemeConstants.spacingM),
                              
                              // Placeholder for movie grid
                              Center(
                                child: Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                    color: isDark
                                        ? ThemeConstants.surfaceDark
                                        : ThemeConstants.surfaceLight,
                                    borderRadius: BorderRadius.circular(
                                      ThemeConstants.radiusL,
                                    ),
                                  ),
                                  child: const Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.movie_outlined, size: 64),
                                        SizedBox(height: 16),
                                        Text(
                                          'Movies coming soon!',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    error: (message) => Center(
                      child: Text('Error: $message'),
                    ),
                    orElse: () => const Center(
                      child: Text('No profile found'),
                    ),
                  );
                },
                orElse: () => const Center(
                  child: Text('Not authenticated'),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ThemeConstants.primaryLight,
        unselectedItemColor: isDark ? Colors.grey[600] : Colors.grey[500],
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'My List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          // TODO: Implement navigation
          if (index == 3) {
            // Show logout dialog or profile screen
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Sign Out'),
                content: const Text('Do you want to sign out?'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(const AuthEvent.signOut());
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Sign Out',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildCategoryCard(String name, IconData icon, bool isDark) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: ThemeConstants.spacingM),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ThemeConstants.primaryLight,
            ThemeConstants.primaryLight.withOpacity(0.7),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(ThemeConstants.radiusL),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 36),
          const SizedBox(height: 8),
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}