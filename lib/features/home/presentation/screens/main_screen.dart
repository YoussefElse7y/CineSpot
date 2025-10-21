// ignore_for_file: deprecated_member_use

import 'dart:ui';
import 'package:cine_spot/core/routing/routes.dart';
import 'package:cine_spot/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:cine_spot/features/home/presentation/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  late AnimationController _controller;

  final List<Widget> _screens = const [
    HomeScreen(),
    ExploreScreen(),
    MyListScreen(),
    DownloadScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
      lowerBound: 0.8,
      upperBound: 1.2,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() => _currentIndex = index);
    _controller.forward(from: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      extendBody: true,
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        switchInCurve: Curves.easeInOut,
        switchOutCurve: Curves.easeInOut,
        child: _screens[_currentIndex],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(32),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 25.0, sigmaY: 25.0),
            child: Container(
              decoration: BoxDecoration(
                color: isDark
                    ? Colors.white.withOpacity(0.05)
                    : Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.circular(32),
                border: Border.all(
                  color: isDark
                      ? Colors.white.withOpacity(0.1)
                      : Colors.black.withOpacity(0.05),
                ),
                boxShadow: [
                  BoxShadow(
                    color: isDark
                        ? Colors.black.withOpacity(0.3)
                        : Colors.grey.withOpacity(0.25),
                    blurRadius: 25,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: BottomNavigationBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                currentIndex: _currentIndex,
                selectedFontSize: 12,
                unselectedFontSize: 12,
                selectedItemColor: const Color(0xFFE21221),
                unselectedItemColor: isDark ? Colors.white70 : Colors.black54,
                showUnselectedLabels: true,
                onTap: _onItemTapped,
                items: List.generate(5, (index) {
                  final icons = [
                    Icons.home,
                    Icons.explore,
                    Icons.bookmark,
                    Icons.download,
                    Icons.person,
                  ];
                  final outlinedIcons = [
                    Icons.home_outlined,
                    Icons.explore_outlined,
                    Icons.bookmark_outline,
                    Icons.download_outlined,
                    Icons.person_outline,
                  ];
                  final labels = [
                    'Home',
                    'Explore',
                    'My List',
                    'Download',
                    'Profile',
                  ];
                  final isSelected = index == _currentIndex;

                  return BottomNavigationBarItem(
                    label: labels[index],
                    icon: AnimatedScale(
                      scale: isSelected ? 1.2 : 1.0,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOutBack,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          if (isSelected)
                            Container(
                              width: 42,
                              height: 42,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(
                                  0xFFE21221,
                                ).withOpacity(0.05),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(
                                      0xFFE21221,
                                    ).withOpacity(0.4),
                                    blurRadius: 12,
                                    spreadRadius: 2,
                                  ),
                                ],
                              ),
                            ),
                          Icon(
                            isSelected ? icons[index] : outlinedIcons[index],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ---------- Placeholder Screens ----------
class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) => _buildPlaceholder("Explore");
}

class MyListScreen extends StatelessWidget {
  const MyListScreen({super.key});

  @override
  Widget build(BuildContext context) => _buildPlaceholder("My List");
}

class DownloadScreen extends StatelessWidget {
  const DownloadScreen({super.key});

  @override
  Widget build(BuildContext context) => _buildPlaceholder("Downloads");
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) => _buildPlaceholder("Profile");
}

// ---------- Helper ----------
Widget _buildPlaceholder(String title) {
  return Scaffold(
    appBar: AppBar(
      title: Text(title),
      centerTitle: true,
      actions: [
        BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                BlocProvider.of<AuthBloc>(context).add(SignOut());
                Navigator.pushReplacementNamed(context, Routes.letYouInScreen);
              },
            );
          },
        ),
      ],
    ),
    body: Center(
      child: Text("$title Screen", style: const TextStyle(fontSize: 24)),
    ),
  );
}
