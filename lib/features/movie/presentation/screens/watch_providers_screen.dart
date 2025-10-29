import 'package:cached_network_image/cached_network_image.dart';
import 'package:cine_spot/core/network/tmdb_image_helper.dart';
import 'package:cine_spot/features/movie/domain/entities/movie_watch_providers_entity.dart';
import 'package:cine_spot/features/movie/presentation/bloc/movie_bloc.dart';
import 'package:cine_spot/core/di/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class WatchProvidersScreen extends StatefulWidget {
  final int movieId;
  final String movieTitle;

  const WatchProvidersScreen({
    super.key,
    required this.movieId,
    required this.movieTitle,
  });

  @override
  State<WatchProvidersScreen> createState() => _WatchProvidersScreenState();
}

class _WatchProvidersScreenState extends State<WatchProvidersScreen> {
  String _selectedCountry = 'EG'; // Default to Egypt
  bool _isLoadingCountry = true;

  @override
  void initState() {
    super.initState();
    _detectDeviceCountry();
  }

  Future<void> _detectDeviceCountry() async {
    try {
      // Try to get device country from locale
      final locale = WidgetsBinding.instance.platformDispatcher.locale;
      final countryCode = locale.countryCode?.toUpperCase();

      if (countryCode != null && _availableRegions.containsKey(countryCode)) {
        setState(() {
          _selectedCountry = countryCode;
          _isLoadingCountry = false;
        });
      } else {
        setState(() {
          _isLoadingCountry = false;
        });
      }
    } catch (e) {
      setState(() {
        _isLoadingCountry = false;
      });
    }
  }

  // Available regions from the JSON document
  final Map<String, String> _availableRegions = {
    'AD': 'Andorra',
    'AE': 'United Arab Emirates',
    'AG': 'Antigua & Barbuda',
    'AL': 'Albania',
    'AR': 'Argentina',
    'AT': 'Austria',
    'AU': 'Australia',
    'BA': 'Bosnia & Herzegovina',
    'BB': 'Barbados',
    'BE': 'Belgium',
    'BG': 'Bulgaria',
    'BH': 'Bahrain',
    'BM': 'Bermuda',
    'BO': 'Bolivia',
    'BR': 'Brazil',
    'BS': 'Bahamas',
    'CA': 'Canada',
    'CH': 'Switzerland',
    'CI': 'Côte d\'Ivoire',
    'CL': 'Chile',
    'CO': 'Colombia',
    'CR': 'Costa Rica',
    'CU': 'Cuba',
    'CV': 'Cape Verde',
    'CZ': 'Czech Republic',
    'DE': 'Germany',
    'DK': 'Denmark',
    'DO': 'Dominican Republic',
    'DZ': 'Algeria',
    'EC': 'Ecuador',
    'EE': 'Estonia',
    'EG': 'Egypt',
    'ES': 'Spain',
    'FI': 'Finland',
    'FJ': 'Fiji',
    'FR': 'France',
    'GB': 'United Kingdom',
    'GF': 'French Guiana',
    'GH': 'Ghana',
    'GI': 'Gibraltar',
    'GP': 'Guadeloupe',
    'GQ': 'Equatorial Guinea',
    'GR': 'Greece',
    'GT': 'Guatemala',
    'HK': 'Hong Kong SAR China',
    'HN': 'Honduras',
    'HR': 'Croatia',
    'HU': 'Hungary',
    'ID': 'Indonesia',
    'IE': 'Ireland',
    'IL': 'Israel',
    'IN': 'India',
    'IQ': 'Iraq',
    'IS': 'Iceland',
    'IT': 'Italy',
    'JM': 'Jamaica',
    'JO': 'Jordan',
    'JP': 'Japan',
    'KE': 'Kenya',
    'KR': 'South Korea',
    'KW': 'Kuwait',
    'LB': 'Lebanon',
    'LC': 'St. Lucia',
    'LI': 'Liechtenstein',
    'LT': 'Lithuania',
    'LV': 'Latvia',
    'LY': 'Libya',
    'MA': 'Morocco',
    'MC': 'Monaco',
    'MD': 'Moldova',
    'MK': 'Macedonia',
    'MT': 'Malta',
    'MU': 'Mauritius',
    'MX': 'Mexico',
    'MY': 'Malaysia',
    'MZ': 'Mozambique',
    'NE': 'Niger',
    'NG': 'Nigeria',
    'NL': 'Netherlands',
    'NO': 'Norway',
    'NZ': 'New Zealand',
    'OM': 'Oman',
    'PA': 'Panama',
    'PE': 'Peru',
    'PF': 'French Polynesia',
    'PH': 'Philippines',
    'PK': 'Pakistan',
    'PL': 'Poland',
    'PS': 'Palestinian Territories',
    'PT': 'Portugal',
    'PY': 'Paraguay',
    'QA': 'Qatar',
    'RO': 'Romania',
    'RS': 'Serbia',
    'RU': 'Russia',
    'SA': 'Saudi Arabia',
    'SC': 'Seychelles',
    'SE': 'Sweden',
    'SG': 'Singapore',
    'SI': 'Slovenia',
    'SK': 'Slovakia',
    'SM': 'San Marino',
    'SN': 'Senegal',
    'SV': 'El Salvador',
    'TC': 'Turks & Caicos Islands',
    'TH': 'Thailand',
    'TN': 'Tunisia',
    'TR': 'Turkey',
    'TT': 'Trinidad & Tobago',
    'TW': 'Taiwan',
    'TZ': 'Tanzania',
    'UG': 'Uganda',
    'US': 'United States',
    'UY': 'Uruguay',
    'VA': 'Vatican City',
    'VE': 'Venezuela',
    'XK': 'Kosovo',
    'YE': 'Yemen',
    'ZA': 'South Africa',
    'ZM': 'Zambia',
  };
  void _showCountryPicker(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final TextEditingController searchController = TextEditingController();

    // Local variable to hold filtered results
    Map<String, String> filteredRegions = Map.from(_availableRegions);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF1F222B) : Colors.white,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  // Handle bar
                  Container(
                    margin: const EdgeInsets.only(top: 12),
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Title
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Select Country',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Search bar
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: 'Search country...',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onChanged: (value) {
                        final query = value.toLowerCase();
                        setModalState(() {
                          filteredRegions = _availableRegions.entries
                              .where(
                                (entry) =>
                                    entry.key.toLowerCase().contains(query) ||
                                    entry.value.toLowerCase().contains(query),
                              )
                              .fold<Map<String, String>>({}, (map, entry) {
                                map[entry.key] = entry.value;
                                return map;
                              });
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Countries list
                  Expanded(
                    child: ListView.builder(
                      itemCount: filteredRegions.length,
                      itemBuilder: (context, index) {
                        final entry = filteredRegions.entries.elementAt(index);
                        final isSelected = _selectedCountry == entry.key;

                        return ListTile(
                          leading: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: isDark
                                  ? Colors.grey[800]
                                  : Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                entry.key,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: isDark ? Colors.white : Colors.black,
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            entry.value,
                            style: TextStyle(
                              color: isDark ? Colors.white : Colors.black,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                          trailing: isSelected
                              ? const Icon(
                                  Icons.check,
                                  color: Color(0xFFE21221),
                                )
                              : null,
                          onTap: () {
                            setState(() {
                              _selectedCountry = entry.key;
                            });
                            Navigator.pop(context);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<MovieBloc>()..add(MovieEvent.loadWatchProviders(widget.movieId)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Where to Watch'),
          actions: [
            // Country selector button
            IconButton(
              icon: const Icon(Icons.language),
              onPressed: () => _showCountryPicker(context),
            ),
          ],
        ),
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
                          MovieEvent.loadWatchProviders(widget.movieId),
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

              // Get selected country data
              final countryData = providers.results[_selectedCountry];

              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Movie Title
                    Text(
                      widget.movieTitle,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Selected Country Chip
                    GestureDetector(
                      onTap: () => _showCountryPicker(context),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE21221),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: Colors.white,
                              size: 16,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              _availableRegions[_selectedCountry] ??
                                  _selectedCountry,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.white,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Check if data exists for selected country
                    if (countryData == null)
                      Center(
                        child: Column(
                          children: [
                            const SizedBox(height: 40),
                            Icon(
                              Icons.tv_off,
                              size: 80,
                              color: Colors.grey[400],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'No streaming providers available in ${_availableRegions[_selectedCountry]}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 16),
                            TextButton(
                              onPressed: () => _showCountryPicker(context),
                              child: const Text('Try another country'),
                            ),
                          ],
                        ),
                      )
                    else ...[
                      // Stream Section
                      if (countryData.flatrate != null &&
                          countryData.flatrate!.isNotEmpty) ...[
                        _ProviderSection(
                          title: 'Stream',
                          providers: countryData.flatrate!,
                          icon: Icons.play_circle_filled,
                        ),
                        const SizedBox(height: 24),
                      ],

                      // Rent Section
                      if (countryData.rent != null &&
                          countryData.rent!.isNotEmpty) ...[
                        _ProviderSection(
                          title: 'Rent',
                          providers: countryData.rent!,
                          icon: Icons.shopping_bag,
                        ),
                        const SizedBox(height: 24),
                      ],

                      // Buy Section
                      if (countryData.buy != null &&
                          countryData.buy!.isNotEmpty) ...[
                        _ProviderSection(
                          title: 'Buy',
                          providers: countryData.buy!,
                          icon: Icons.shopping_cart,
                        ),
                        const SizedBox(height: 24),
                      ],

                      // Ads Section
                      if (countryData.ads != null &&
                          countryData.ads!.isNotEmpty) ...[
                        _ProviderSection(
                          title: 'Free with Ads',
                          providers: countryData.ads!,
                          icon: Icons.tv,
                        ),
                      ],

                      // Check if no providers at all
                      if ((countryData.flatrate == null ||
                              countryData.flatrate!.isEmpty) &&
                          (countryData.rent == null ||
                              countryData.rent!.isEmpty) &&
                          (countryData.buy == null ||
                              countryData.buy!.isEmpty) &&
                          (countryData.ads == null || countryData.ads!.isEmpty))
                        Center(
                          child: Column(
                            children: [
                              const SizedBox(height: 40),
                              Icon(
                                Icons.tv_off,
                                size: 80,
                                color: Colors.grey[400],
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'No streaming options available in ${_availableRegions[_selectedCountry]}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),

                      // Link to TMDB
                      if (countryData.link != null) ...[
                        const SizedBox(height: 24),
                        Center(
                          child: TextButton.icon(
                            onPressed: () async {
  final uri = Uri.parse(countryData.link!);
  try {
    final launched = await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
    if (!launched && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Could not open link'),
          backgroundColor: Colors.red,
        ),
      );
    }
  } catch (e) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
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
