import 'package:cine_spot/core/network/tmdb_image_helper.dart';
import 'package:cine_spot/features/explore/domain/entities/multi/search_result_entity.dart';
import 'package:cine_spot/features/explore/presentation/bloc/explore_bloc.dart';
import 'package:cine_spot/features/explore/presentation/bloc/explore_event.dart';
import 'package:cine_spot/features/explore/presentation/bloc/explore_state.dart';
import 'package:cine_spot/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  // Filter states
  String _selectedCategory = 'TV Shows';
  String _selectedRegion = 'All Regions';
  String _selectedGenre = 'Romance';
  String _selectedPeriod = '2022';
  String _selectedSort = 'Popularity';

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    final query = _searchController.text.trim();
    if (query.isNotEmpty) {
      context.read<ExploreBloc>().add(ExploreEvent.searchMulti(query: query));
    } else {
      context.read<ExploreBloc>().add(const ExploreEvent.clearSearch());
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  void _showFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _buildFilterSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: isDark
                            ? const Color(0xFF1F222B)
                            : const Color(0xFFFAFAFA),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextField(
                        controller: _searchController,
                        focusNode: _searchFocusNode,
                        decoration: InputDecoration(
                          hintText: l10n.search,
                          prefixIcon: Icon(
                            Icons.search,
                            color: isDark ? Colors.white70 : Colors.black54,
                          ),
                          suffixIcon: _searchController.text.isNotEmpty
                              ? IconButton(
                                  icon: const Icon(Icons.clear),
                                  onPressed: () {
                                    _searchController.clear();
                                    context.read<ExploreBloc>().add(
                                      const ExploreEvent.clearSearch(),
                                    );
                                  },
                                )
                              : null,
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: _showFilterBottomSheet,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE21221).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.tune, color: Color(0xFFE21221)),
                    ),
                  ),
                ],
              ),
            ),

            // Content
            Expanded(
              child: BlocBuilder<ExploreBloc, ExploreState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => _buildInitialState(l10n),
                    loading: () => const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xFFE21221),
                      ),
                    ),
                    multiSearchLoaded: (searchResponse) =>
                        _buildSearchResults(searchResponse.results),
                    movieSearchLoaded: (movieSearchResponse) =>
                        _buildMovieResults(movieSearchResponse.results),
                    tvShowSearchLoaded: (tvSearchResponse) =>
                        _buildTvResults(tvSearchResponse.results),
                    personSearchLoaded: (personSearchResponse) =>
                        _buildPersonResults(personSearchResponse.results),
                    companySearchLoaded: (companySearchResponse) =>
                        _buildCompanyResults(companySearchResponse.results),
                    error: (message) => _buildErrorState(message),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInitialState(AppLocalizations l10n) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Top Searches',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildTopSearchItem(
              'Stranger Things',
              'https://image.tmdb.org/t/p/w200/49WJfeN0moxb9IPfGn8AIqMGskD.jpg',
            ),
            _buildTopSearchItem(
              'Vincenzo',
              'https://image.tmdb.org/t/p/w200/dvXJgEDQXhL9Ouot2WkBHpQiHGd.jpg',
              badge: 'EPISODES',
              badgeColor: Colors.red,
            ),
            _buildTopSearchItem(
              'Money Heist',
              'https://image.tmdb.org/t/p/w200/reEMJA1uzscCbkpeRJeTT2bjqUp.jpg',
            ),
            _buildTopSearchItem(
              'Squid Game',
              'https://image.tmdb.org/t/p/w200/dDlEmu3EZ0Pgg93K2SVNLCjCSvE.jpg',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopSearchItem(
    String title,
    String imageUrl, {
    String? badge,
    Color? badgeColor,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              width: 120,
              height: 70,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 120,
                height: 70,
                color: Colors.grey[800],
                child: const Icon(Icons.movie, color: Colors.white54),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (badge != null) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: badgeColor ?? Colors.red,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          badge,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey[700],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          'WEEKLY',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchResults(List<SearchResultEntity> results) {
    if (results.isEmpty) {
      return _buildNotFoundState();
    }

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: results.length,
      itemBuilder: (context, index) {
        final result = results[index];
        return _buildResultCard(result);
      },
    );
  }

  Widget _buildResultCard(SearchResultEntity result) {
    final posterPath = result.posterPath;
    final title = result.title ?? result.name ?? 'Unknown';
    final rating = result.voteAverage;
    final personImage = result.profilePath;

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        children: [
          if (posterPath != null)
            Image.network(
              TMDBImageHelper.getPoster(posterPath, PosterSize.w500),
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                color: Colors.grey[800],
                child: const Icon(Icons.movie, size: 50, color: Colors.white54),
              ),
            )
          else if (personImage != null)
            Image.network(
              TMDBImageHelper.getPoster(personImage, PosterSize.w500),
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                color: Colors.grey[800],
                child: const Icon(Icons.movie, size: 50, color: Colors.white54),
              ),
            )
          else
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.grey[800],
              child: const Icon(Icons.movie, size: 50, color: Colors.white54),
            ),
          Positioned(
            top: 8,
            left: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFE21221),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                rating.toStringAsFixed(1),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black.withOpacity(0.8), Colors.transparent],
                ),
              ),
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMovieResults(results) {
    return const Center(child: Text('Movie Results'));
  }

  Widget _buildTvResults(results) {
    return const Center(child: Text('TV Results'));
  }

  Widget _buildPersonResults(results) {
    return const Center(child: Text('Person Results'));
  }

  Widget _buildCompanyResults(results) {
    return const Center(child: Text('Company Results'));
  }

  Widget _buildNotFoundState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/404.png',
            width: 200,
            height: 200,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.search_off, size: 100, color: Colors.grey),
          ),
          const SizedBox(height: 24),
          const Text(
            'Not Found',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFFE21221),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Sorry, the keyword you entered could not be found.\nTry to check again or search with other keywords.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 64, color: Colors.red),
          const SizedBox(height: 16),
          Text(
            'Error: $message',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterSheet() {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF181A20) : Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[600],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Sort & Filter',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFFE21221),
              ),
            ),
          ),
          const Divider(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildFilterSection(
                    'Categories',
                    ['Movie', 'TV Shows', 'K-Drama', 'Anime'],
                    _selectedCategory,
                    (value) => setState(() => _selectedCategory = value),
                  ),
                  const SizedBox(height: 24),
                  _buildFilterSection(
                    'Regions',
                    ['All Regions', 'US', 'South Korea', 'China'],
                    _selectedRegion,
                    (value) => setState(() => _selectedRegion = value),
                  ),
                  const SizedBox(height: 24),
                  _buildFilterSection(
                    'Genre',
                    ['Action', 'Comedy', 'Romance', 'Thriller'],
                    _selectedGenre,
                    (value) => setState(() => _selectedGenre = value),
                  ),
                  const SizedBox(height: 24),
                  _buildFilterSection(
                    'Time/Periods',
                    ['All Periods', '2022', '2021', '2020'],
                    _selectedPeriod,
                    (value) => setState(() => _selectedPeriod = value),
                  ),
                  const SizedBox(height: 24),
                  _buildFilterSection(
                    'Sort',
                    ['Popularity', 'Latest Release'],
                    _selectedSort,
                    (value) => setState(() => _selectedSort = value),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      setState(() {
                        _selectedCategory = 'TV Shows';
                        _selectedRegion = 'All Regions';
                        _selectedGenre = 'Romance';
                        _selectedPeriod = '2022';
                        _selectedSort = 'Popularity';
                      });
                      Navigator.pop(context);
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      side: BorderSide(
                        color: isDark ? Colors.white30 : Colors.black26,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: const Text('Reset'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      // Apply filters logic here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE21221),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: const Text(
                      'Apply',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterSection(
    String title,
    List<String> options,
    String selectedValue,
    Function(String) onSelected,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: options.map((option) {
            final isSelected = option == selectedValue;
            return GestureDetector(
              onTap: () => onSelected(option),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color(0xFFE21221)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isSelected
                        ? const Color(0xFFE21221)
                        : Colors.grey[600]!,
                  ),
                ),
                child: Text(
                  option,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.grey[300],
                    fontWeight: isSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
