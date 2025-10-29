import 'package:cached_network_image/cached_network_image.dart';
import 'package:cine_spot/core/network/tmdb_image_helper.dart';
import 'package:cine_spot/features/movie/domain/entities/movie_watch_providers_entity.dart';
import 'package:cine_spot/features/movie/presentation/bloc/movie_bloc.dart';
import 'package:cine_spot/core/di/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class WatchProvidersScreen extends StatelessWidget {
  final int movieId;
  final String movieTitle;

  const WatchProvidersScreen({
    super.key,
    required this.movieId,
    required this.movieTitle,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<MovieBloc>()..add(MovieEvent.loadWatchProviders(movieId)),
      child: Scaffold(
        appBar: AppBar(title: const Text('Where to Watch')),
        body: BlocBuilder<MovieBloc, MovieState>(
          buildWhen: (previous, current) =>
              previous.watchProvidersStatus != current.watchProvidersStatus,
          builder: (context, state) {
            if (state.watchProvidersStatus ==
                MovieWatchProvidersStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.watchProvidersStatus == MovieWatchProvidersStatus.error) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 60,
                      color: Colors.red,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      state.watchProvidersError ?? 'Failed to load providers',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        context.read<MovieBloc>().add(
                          MovieEvent.loadWatchProviders(movieId),
                        );
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
            }

            if (state.watchProvidersStatus ==
                    MovieWatchProvidersStatus.loaded &&
                state.watchProviders != null) {
              final providers = state.watchProviders!;

              // Get Egypt data
              final egyptData = providers.results['EG'];

              if (egyptData == null) {
                return const Center(
                  child: Text('No streaming providers available in Egypt'),
                );
              }

              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Movie Title
                    Text(
                      movieTitle,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Available in Egypt',
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 24),

                    // Stream Section
                    if (egyptData.flatrate != null &&
                        egyptData.flatrate!.isNotEmpty) ...[
                      _ProviderSection(
                        title: 'Stream',
                        providers: egyptData.flatrate!,
                        icon: Icons.play_circle_filled,
                      ),
                      const SizedBox(height: 24),
                    ],

                    // Rent Section
                    if (egyptData.rent != null &&
                        egyptData.rent!.isNotEmpty) ...[
                      _ProviderSection(
                        title: 'Rent',
                        providers: egyptData.rent!,
                        icon: Icons.shopping_bag,
                      ),
                      const SizedBox(height: 24),
                    ],

                    // Buy Section
                    if (egyptData.buy != null && egyptData.buy!.isNotEmpty) ...[
                      _ProviderSection(
                        title: 'Buy',
                        providers: egyptData.buy!,
                        icon: Icons.shopping_cart,
                      ),
                      const SizedBox(height: 24),
                    ],

                    // Ads Section
                    if (egyptData.ads != null && egyptData.ads!.isNotEmpty) ...[
                      _ProviderSection(
                        title: 'Free with Ads',
                        providers: egyptData.ads!,
                        icon: Icons.tv,
                      ),
                    ],

                    // Link to TMDB
                    if (egyptData.link != null) ...[
                      const SizedBox(height: 24),
                      Center(
                        child: TextButton.icon(
                          onPressed: () async {
                            final uri = Uri.parse(egyptData.link!);
                            if (await canLaunchUrl(uri)) {
                              await launchUrl(
                                uri,
                                mode: LaunchMode.externalApplication,
                              );
                            } else {
                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Could not open link'),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                            }
                          },
                          icon: const Icon(Icons.open_in_new),
                          label: const Text('View on TMDB'),
                        ),
                      ),
                    ],
                  ],
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

class _ProviderSection extends StatelessWidget {
  final String title;
  final List<WatchProviderEntity> providers;
  final IconData icon;

  const _ProviderSection({
    required this.title,
    required this.providers,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header
        Row(
          children: [
            Icon(icon, color: const Color(0xFFE21221)),
            const SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Providers Grid
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: providers.map((provider) {
            return _ProviderCard(provider: provider, isDark: isDark);
          }).toList(),
        ),
      ],
    );
  }
}

class _ProviderCard extends StatelessWidget {
  final WatchProviderEntity provider;
  final bool isDark;

  const _ProviderCard({required this.provider, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: isDark ? Colors.grey[850] : Colors.grey[200],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Logo
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: provider.logoPath != null
                ? CachedNetworkImage(
                    imageUrl: TMDBImageHelper.getLogo(
                      provider.logoPath!,
                      LogoSize.w185,
                    ),
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      color: isDark ? Colors.grey[800] : Colors.grey[300],
                    ),
                    errorWidget: (context, url, error) => Container(
                      height: 100,
                      color: isDark ? Colors.grey[800] : Colors.grey[300],
                      child: const Icon(Icons.movie, size: 40),
                    ),
                  )
                : Container(
                    height: 100,
                    width: 100,
                    color: isDark ? Colors.grey[800] : Colors.grey[300],
                    child: const Icon(Icons.movie, size: 40),
                  ),
          ),

          // Provider Name
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              provider.providerName ?? 'Unknown',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: isDark ? Colors.white : Colors.black,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
