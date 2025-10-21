// Optimized main_screen.dart
// ignore_for_file: deprecated_member_use

import 'package:cine_spot/core/routing/routes.dart';
import 'package:cine_spot/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:cine_spot/features/profile/presentation/screens/profile_sceen.dart';
import 'package:cine_spot/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:cine_spot/features/home/presentation/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = const [
    HomeScreen(),
    ExploreScreen(),
    MyListScreen(),
    DownloadScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      extendBody: true,
      // OPTIMIZED: Removed AnimatedSwitcher - causes unnecessary rebuilds
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: Container(
          decoration: BoxDecoration(
            // OPTIMIZED: Simplified styling, removed BackdropFilter
            color: isDark ? const Color(0xFF1F222B) : Colors.white,
            borderRadius: BorderRadius.circular(32),
            border: Border.all(
              color: isDark
                  ? Colors.white.withOpacity(0.1)
                  : Colors.black.withOpacity(0.1),
            ),
            // OPTIMIZED: Reduced shadow complexity
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 12,
                offset: const Offset(0, 4),
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
                l10n.home,
                l10n.explore,
                l10n.myList,
                l10n.downloads,
                l10n.profile,
              ];
              final isSelected = index == _currentIndex;

              return BottomNavigationBarItem(
                label: labels[index],
                // OPTIMIZED: Simplified animation
                icon: AnimatedScale(
                  scale: isSelected ? 1.15 : 1.0,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeOut,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      if (isSelected)
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFFE21221).withOpacity(0.1),
                          ),
                        ),
                      Icon(isSelected ? icons[index] : outlinedIcons[index]),
                    ],
                  ),
                ),
              );
            }),
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
  Widget build(BuildContext context) =>
      _buildPlaceholder(AppLocalizations.of(context)!.explore);
}

class MyListScreen extends StatelessWidget {
  const MyListScreen({super.key});

  @override
  Widget build(BuildContext context) =>
      _buildPlaceholder(AppLocalizations.of(context)!.myList);
}

class DownloadScreen extends StatelessWidget {
  const DownloadScreen({super.key});

  @override
  Widget build(BuildContext context) =>
      _buildPlaceholder(AppLocalizations.of(context)!.downloads);
}

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) => _buildPlaceholder("Profile");
// }

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
