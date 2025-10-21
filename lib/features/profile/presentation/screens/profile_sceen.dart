import 'package:cine_spot/core/routing/routes.dart';
import 'package:cine_spot/core/theme/theme_constants.dart';
import 'package:cine_spot/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:cine_spot/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:cine_spot/features/theme/domain/entities/app_theme_mode.dart';
import 'package:cine_spot/features/theme/presentation/bloc/theme_bloc.dart';
import 'package:cine_spot/features/theme/presentation/bloc/theme_event.dart';
import 'package:cine_spot/features/theme/presentation/bloc/theme_state.dart';
import 'package:cine_spot/l10n/app_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId != null) {
      context.read<ProfileBloc>().add(ProfileEvent.loadProfile(userId));
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 28,
              errorBuilder: (_, __, ___) => const Icon(Icons.movie, size: 28),
            ),
            const SizedBox(width: 8),
            Text(
              l10n.profile,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (profile) =>
                _buildProfileContent(context, profile, isDark, l10n),
            notFound: () => _buildNotFoundContent(context),
            error: (message) => Center(child: Text('Error: $message')),
            orElse: () => const SizedBox(),
          );
        },
      ),
    );
  }

  Widget _buildNotFoundContent(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.person_off_outlined, size: 80, color: Colors.grey),
          const SizedBox(height: 16),
          const Text('No profile found'),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.fillProfileScreen);
            },
            child: const Text('Create Profile'),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileContent(
    BuildContext context,
    profile,
    bool isDark,
    AppLocalizations l10n,
  ) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 24),
          // Profile Picture
          Stack(
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: ThemeConstants.primaryLight,
                    width: 3,
                  ),
                  image: profile.photoUrl != null
                      ? DecorationImage(
                          image: NetworkImage(profile.photoUrl!),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: profile.photoUrl == null
                    ? Icon(Icons.person, size: 60, color: Colors.grey[400])
                    : null,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    // Navigate to edit profile
                    Navigator.pushNamed(context, Routes.editProfileScreen);
                  },
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
                    child: const Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Name
          Text(
            profile.fullName,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          // Email
          Text(
            profile.email,
            style: TextStyle(
              fontSize: 14,
              color: isDark ? Colors.grey[400] : Colors.grey[600],
            ),
          ),
          const SizedBox(height: 32),
          // Premium Banner
          _buildPremiumBanner(isDark),
          const SizedBox(height: 24),
          // Menu Items
          _buildMenuItem(
            icon: Icons.person_outline,
            title: l10n.editProfile,
            isDark: isDark,
            onTap: () {
              Navigator.pushNamed(context, Routes.editProfileScreen);
            },
          ),
          _buildMenuItem(
            icon: Icons.notifications_outlined,
            title: l10n.notifications,
            isDark: isDark,
            onTap: () {},
          ),
          _buildMenuItem(
            icon: Icons.download_outlined,
            title: l10n.downloads,
            isDark: isDark,
            onTap: () {},
          ),
          _buildMenuItem(
            icon: Icons.security_outlined,
            title: l10n.security,
            isDark: isDark,
            onTap: () {},
          ),
          _buildMenuItem(
            icon: Icons.language_outlined,
            title: l10n.language,
            trailing: l10n.native_language,
            isDark: isDark,
            onTap: () {
              // Navigate to language screen
              Navigator.pushNamed(context, Routes.languageScreen);
            },
          ),
          _buildDarkModeItem(isDark, l10n),
          _buildMenuItem(
            icon: Icons.help_outline,
            title: l10n.helpCenter,
            isDark: isDark,
            onTap: () {},
          ),
          _buildMenuItem(
            icon: Icons.privacy_tip_outlined,
            title: l10n.privacyPolicy,
            isDark: isDark,
            onTap: () {},
          ),
          const SizedBox(height: 24),
          // Logout Button
          _buildLogoutButton(context, isDark, l10n),
          const SizedBox(height: 160),
        ],
      ),
    );
  }

  Widget _buildPremiumBanner(bool isDark) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: ThemeConstants.primaryLight, width: 2),
        color: isDark
            ? ThemeConstants.surfaceDark
            : ThemeConstants.backgroundLight,
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: ThemeConstants.primaryLight.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.workspace_premium,
              color: ThemeConstants.primaryLight,
              size: 32,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Join Premium!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: ThemeConstants.primaryLight,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Enjoy watching Full-HD movies,\nwithout restrictions and without ads',
                  style: TextStyle(
                    fontSize: 12,
                    color: isDark ? Colors.grey[400] : Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: ThemeConstants.primaryLight,
            size: 20,
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    String? trailing,
    required bool isDark,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
      leading: Icon(icon, color: isDark ? Colors.white : Colors.black),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (trailing != null)
            Text(
              trailing,
              style: TextStyle(
                fontSize: 14,
                color: isDark ? Colors.grey[400] : Colors.grey[600],
              ),
            ),
          const SizedBox(width: 8),
          Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: isDark ? Colors.grey[600] : Colors.grey[400],
          ),
        ],
      ),
      onTap: onTap,
    );
  }

  Widget _buildDarkModeItem(bool isDark, AppLocalizations l10n) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        bool isDarkMode = false;
        if (state is ThemeLoaded) {
          isDarkMode = state.themeMode == AppThemeMode.dark;
        }

        return ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 4,
          ),
          leading: Icon(
            Icons.dark_mode_outlined,
            color: isDark ? Colors.white : Colors.black,
          ),
          title: Text(
            l10n.darkTheme,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          trailing: Switch(
            value: isDarkMode,
            activeColor: ThemeConstants.primaryLight,
            onChanged: (value) {
              context.read<ThemeBloc>().add(
                ChangeThemeEvent(
                  value ? AppThemeMode.dark : AppThemeMode.light,
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildLogoutButton(
    BuildContext context,
    bool isDark,
    AppLocalizations l10n,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: ElevatedButton(
          onPressed: () {
            _showLogoutDialog(context, isDark, l10n);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: ThemeConstants.primaryLight,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          child: Text(
            l10n.logout,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  void _showLogoutDialog(
    BuildContext context,
    bool isDark,
    AppLocalizations l10n,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          backgroundColor: isDark
              ? ThemeConstants.surfaceDark
              : ThemeConstants.backgroundLight,
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  l10n.logout,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: ThemeConstants.primaryLight,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  l10n.logoutConfirmation,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 32),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.pop(dialogContext),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: isDark
                                ? Colors.white.withOpacity(0.3)
                                : Colors.black.withOpacity(0.3),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: Text(
                          l10n.cancel,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: isDark ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(dialogContext);
                          context.read<AuthBloc>().add(SignOut());
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            Routes.letYouInScreen,
                            (route) => false,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ThemeConstants.primaryLight,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: Text(
                          l10n.logout,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
