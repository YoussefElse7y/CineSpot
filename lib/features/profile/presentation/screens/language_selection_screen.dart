import 'package:cine_spot/core/theme/theme_constants.dart';
import 'package:cine_spot/features/language/domain/entities/app_language.dart';
import 'package:cine_spot/features/language/presentation/bloc/language_bloc.dart';
import 'package:cine_spot/features/language/presentation/bloc/language_event.dart';
import 'package:cine_spot/features/language/presentation/bloc/language_state.dart';
import 'package:cine_spot/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title:  Text(
          l10n.language,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          AppLanguage? currentLanguage;
          if (state is LanguageLoaded) {
            currentLanguage = state.language;
          }

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
                  child: Text(
                    l10n.suggested,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                ),
                // English US
                _buildLanguageItem(
                  context: context,
                  language: AppLanguage.english,
                  displayName: l10n.english,
                  isSelected: currentLanguage == AppLanguage.english,
                  isDark: isDark,
                ),

                const SizedBox(height: 8),
                  // Arabic
                _buildLanguageItem(
                  context: context,
                  language: AppLanguage.arabic,
                  displayName: l10n.arabic,
                  isSelected: currentLanguage == AppLanguage.arabic,
                  isDark: isDark,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
                  child: Text(
                     l10n.language,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                ),
                // // Mandarin
                // _buildLanguageItem(
                //   context: context,
                //   language: AppLanguage.english,
                //   displayName: 'Mandarin',
                //   isSelected: false,
                //   isDark: isDark,
                //   onTap: () {},
                // ),
                // // Hindi
                // _buildLanguageItem(
                //   context: context,
                //   language: AppLanguage.english,
                //   displayName: 'Hindi',
                //   isSelected: false,
                //   isDark: isDark,
                //   onTap: () {},
                // ),
                // // Spanish
                // _buildLanguageItem(
                //   context: context,
                //   language: AppLanguage.english,
                //   displayName: 'Spanish',
                //   isSelected: false,
                //   isDark: isDark,
                //   onTap: () {},
                // ),
                // // French
                _buildLanguageItem(
                  context: context,
                  language: AppLanguage.french,
                  displayName:  l10n.french,
                  isSelected: currentLanguage == AppLanguage.french,
                  isDark: isDark,
                ),
              
                // // Bengali
                // _buildLanguageItem(
                //   context: context,
                //   language: AppLanguage.english,
                //   displayName: 'Bengali',
                //   isSelected: false,
                //   isDark: isDark,
                //   onTap: () {},
                // ),
                // // Russian
                // _buildLanguageItem(
                //   context: context,
                //   language: AppLanguage.english,
                //   displayName: 'Russian',
                //   isSelected: false,
                //   isDark: isDark,
                //   onTap: () {},
                // ),
                // // Indonesia
                // _buildLanguageItem(
                //   context: context,
                //   language: AppLanguage.english,
                //   displayName: 'Indonesia',
                //   isSelected: false,
                //   isDark: isDark,
                //   onTap: () {},
                // ),
                const SizedBox(height: 24),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildLanguageItem({
    required BuildContext context,
    required AppLanguage language,
    required String displayName,
    required bool isSelected,
    required bool isDark,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap:
          onTap ??
          () {
            context.read<LanguageBloc>().add(ChangeLanguageEvent(language));
          },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              displayName,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? ThemeConstants.primaryLight
                      : (isDark ? Colors.grey[700]! : Colors.grey[400]!),
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: ThemeConstants.primaryLight,
                        ),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
