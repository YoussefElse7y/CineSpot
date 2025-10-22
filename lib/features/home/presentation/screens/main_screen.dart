// Updated main_screen.dart
// ignore_for_file: deprecated_member_use

import 'package:cine_spot/core/di/injection_container.dart';
import 'package:cine_spot/core/routing/routes.dart';
import 'package:cine_spot/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:cine_spot/features/explore/presentation/bloc/explore_bloc.dart';
import 'package:cine_spot/features/explore/presentation/bloc/explore_event.dart';
import 'package:cine_spot/features/explore/presentation/screens/explore_screen.dart';
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
  
  late final List<Widget> _screens;
  
  @override
  void initState() {
    super.initState();
    _screens = [
      const HomeScreen(),
      BlocProvider(
        create: (context) => sl<ExploreBloc>()..add(ExploreEvent.trending()),
        child: const ExploreScreen(),
      ),
      const MyListScreen(),
      const DownloadScreen(),
      const ProfileScreen(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      extendBody: true,
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: Container(
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF1F222B) : Colors.white,
            borderRadius: BorderRadius.circular(32),
            border: Border.all(
              color: isDark
                  ? Colors.white.withOpacity(0.1)
                  : Colors.black.withOpacity(0.1),
            ),
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