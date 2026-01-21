
import 'package:cine_spot/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class NotFoundState extends StatelessWidget {
  const NotFoundState({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_off, size: 100, color: Colors.grey[600]),
          const SizedBox(height: 24),
           Text(
            l10n.not_found,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFFE21221),
            ),
          ),
          const SizedBox(height: 8),
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              l10n.not_found_message,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
