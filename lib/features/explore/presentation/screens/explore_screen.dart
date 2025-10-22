import 'package:cine_spot/core/network/tmdb_image_helper.dart';
import 'package:cine_spot/features/explore/domain/entities/movie/movie_search_result_entity.dart';
import 'package:cine_spot/features/explore/domain/entities/multi/search_result_entity.dart';
import 'package:cine_spot/features/explore/domain/entities/person/person_search_entity.dart';
import 'package:cine_spot/features/explore/domain/entities/tv_search_response_entity.dart';
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
  SearchCategory _selectedCategory = SearchCategory.multi;
  String? _selectedYear;
  String? _selectedGenre;
  String _selectedSort = 'Popularity';

  // Available years
  final List<String> _years = List.generate(
    30,
    (index) => (DateTime.now().year - index).toString(),
  );

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    final query = _searchController.text.trim();
    if (query.isNotEmpty) {
      _performSearch(query);
    } else {
      context.read<ExploreBloc>().add(const ExploreEvent.clearSearch());
    }
  }

  void _performSearch(String query) {
    final languageCode = Localizations.localeOf(context).languageCode;

    switch (_selectedCategory) {
      case SearchCategory.multi:
        context.read<ExploreBloc>().add(
          ExploreEvent.searchMulti(query: query, language: languageCode),
        );
        break;
      case SearchCategory.movies:
        context.read<ExploreBloc>().add(
          ExploreEvent.searchMovies(
            query: query,
            language: languageCode,
            year: _selectedYear,
          ),
        );
        break;
      case SearchCategory.tvShows:
        context.read<ExploreBloc>().add(
          ExploreEvent.searchTvShows(
            query: query,
            language: languageCode,
            year: _selectedYear != null ? int.tryParse(_selectedYear!) : null,
          ),
        );
        break;
      case SearchCategory.people:
        context.read<ExploreBloc>().add(
          ExploreEvent.searchPerson(query: query, language: languageCode),
        );
        break;
      case SearchCategory.companies:
        context.read<ExploreBloc>().add(
          ExploreEvent.searchCompany(query: query),
        );
        break;
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  void _showFilterBottomSheet() {
    // Store temporary filter values
    SearchCategory tempCategory = _selectedCategory;
    String? tempYear = _selectedYear;
    String? tempGenre = _selectedGenre;
    String tempSort = _selectedSort;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => StatefulBuilder(
        builder: (context, setModalState) {
          return _buildFilterSheet(
            tempCategory: tempCategory,
            tempYear: tempYear,
            tempGenre: tempGenre,
            tempSort: tempSort,
            onCategoryChanged: (category) {
              setModalState(() => tempCategory = category);
            },
            onYearChanged: (year) {
              setModalState(() => tempYear = year);
            },
            onGenreChanged: (genre) {
              setModalState(() => tempGenre = genre);
            },
            onSortChanged: (sort) {
              setModalState(() => tempSort = sort);
            },
            onReset: () {
              setModalState(() {
                tempCategory = SearchCategory.multi;
                tempYear = null;
                tempGenre = null;
                tempSort = 'Popularity';
              });
            },
            onApply: () {
              setState(() {
                _selectedCategory = tempCategory;
                _selectedYear = tempYear;
                _selectedGenre = tempGenre;
                _selectedSort = tempSort;
              });
              Navigator.pop(context);
              // Re-trigger search with new filters
              if (_searchController.text.isNotEmpty) {
                _performSearch(_searchController.text.trim());
              }
            },
          );
        },
      ),
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
            // Search Bar with Category Tabs
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
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
                          child: Badge(
                            isLabelVisible:
                                _selectedYear != null || _selectedGenre != null,
                            label: const Text(''),
                            child: const Icon(
                              Icons.tune,
                              color: Color(0xFFE21221),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Category Pills
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: SearchCategory.values.map((category) {
                        final isSelected = _selectedCategory == category;
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: FilterChip(
                            selected: isSelected,
                            label: Text(_getCategoryName(category, l10n)),
                            onSelected: (selected) {
                              setState(() => _selectedCategory = category);
                              if (_searchController.text.isNotEmpty) {
                                _performSearch(_searchController.text.trim());
                              }
                            },
                            selectedColor: const Color(0xFFE21221),
                            backgroundColor: isDark
                                ? const Color(0xFF1F222B)
                                : const Color(0xFFFAFAFA),
                            labelStyle: TextStyle(
                              color: isSelected
                                  ? Colors.white
                                  : (isDark ? Colors.white70 : Colors.black87),
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),

            // Active Filters Display
            if (_selectedYear != null || _selectedGenre != null)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    if (_selectedYear != null)
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Chip(
                          label: Text('Year: $_selectedYear'),
                          deleteIcon: const Icon(Icons.close, size: 16),
                          onDeleted: () {
                            setState(() => _selectedYear = null);
                            if (_searchController.text.isNotEmpty) {
                              _performSearch(_searchController.text.trim());
                            }
                          },
                        ),
                      ),
                    if (_selectedGenre != null)
                      Chip(
                        label: Text('Genre: $_selectedGenre'),
                        deleteIcon: const Icon(Icons.close, size: 16),
                        onDeleted: () {
                          setState(() => _selectedGenre = null);
                          if (_searchController.text.isNotEmpty) {
                            _performSearch(_searchController.text.trim());
                          }
                        },
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

  String _getCategoryName(SearchCategory category, AppLocalizations l10n) {
    switch (category) {
      case SearchCategory.multi:
        return 'All';
      case SearchCategory.movies:
        return l10n.movies;
      case SearchCategory.tvShows:
        return l10n.tvShows;
      case SearchCategory.people:
        return 'People';
      case SearchCategory.companies:
        return 'Companies';
    }
  }

  Widget _buildInitialState(AppLocalizations l10n) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Top Searches',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
    final name = result.name ?? 'Unaknown';
    final rating = result.voteAverage;
    final personImage = result.profilePath;
    final type = result.mediaType;
    if (type == 'movie') {
      return _movieType(posterPath, rating, title);
    } else if (type == 'tv') {
      return _tvType(posterPath, rating, title);
    }
    return _personType(personImage, name);
  }

  Widget _buildMovieCard(MovieSearchResultEntity result) {
    final posterPath = result.posterPath;
    final title = result.title;
    final rating = result.voteAverage;
    return _movieType(posterPath, rating, title);
  }

  ClipRRect _movieType(String? posterPath, double rating, String title) {
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
          else
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.grey[800],
              child: const Icon(Icons.movie, size: 50, color: Colors.white54),
            ),
          if (rating > 0)
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

  Widget _buildTvCard(TvEntity result) {
    final posterPath = result.posterPath;
    final title = result.name;
    final rating = result.voteAverage;
    return _tvType(posterPath, rating, title);
  }

  ClipRRect _tvType(String? posterPath, double rating, String title) {
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
          else
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.grey[800],
              child: const Icon(Icons.movie, size: 50, color: Colors.white54),
            ),
          if (rating > 0)
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

  Widget _buildPersonCard(PersonSearchEntity result) {
    final profile = result.profilePath;
    final name = result.name;
    return _personType(profile, name);
  }

  ClipRRect _personType(String? profile, String name) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(350),
      child: Stack(
        children: [
          if (profile != null)
            Image.network(
              TMDBImageHelper.getProfile(profile, ProfileSize.h632),
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
              child: const Icon(Icons.person, size: 50, color: Colors.white54),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMovieResults(List<MovieSearchResultEntity> results) {
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
        return _buildMovieCard(result);
      },
    );
  }

  Widget _buildTvResults(List<TvEntity> results) {
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
        return _buildTvCard(result);
      },
    );
  }

  Widget _buildPersonResults(List<PersonSearchEntity> results) {
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
        return _buildPersonCard(result);
      },
    );
  }

  Widget _buildCompanyResults(results) {
    return const Center(child: Text('Company Results'));
  }

  Widget _buildNotFoundState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_off, size: 100, color: Colors.grey[600]),
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

  Widget _buildFilterSheet({
    required SearchCategory tempCategory,
    required String? tempYear,
    required String? tempGenre,
    required String tempSort,
    required Function(SearchCategory) onCategoryChanged,
    required Function(String?) onYearChanged,
    required Function(String?) onGenreChanged,
    required Function(String) onSortChanged,
    required VoidCallback onReset,
    required VoidCallback onApply,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF181A20) : Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
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
                    SearchCategory.values
                        .map(
                          (c) => _getCategoryName(
                            c,
                            AppLocalizations.of(context)!,
                          ),
                        )
                        .toList(),
                    _getCategoryName(
                      tempCategory,
                      AppLocalizations.of(context)!,
                    ),
                    (value) {
                      final category = SearchCategory.values.firstWhere(
                        (c) =>
                            _getCategoryName(
                              c,
                              AppLocalizations.of(context)!,
                            ) ==
                            value,
                      );
                      onCategoryChanged(category);
                    },
                  ),
                  const SizedBox(height: 24),
                  if (tempCategory == SearchCategory.movies ||
                      tempCategory == SearchCategory.tvShows) ...[
                    _buildFilterSection(
                      'Year',
                      ['All Years', ..._years.take(10)],
                      tempYear ?? 'All Years',
                      (value) =>
                          onYearChanged(value == 'All Years' ? null : value),
                    ),
                    const SizedBox(height: 24),
                  ],
                  _buildFilterSection(
                    'Sort',
                    ['Popularity', 'Latest Release', 'Rating'],
                    tempSort,
                    onSortChanged,
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
                      onReset();
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
                    onPressed: onApply,
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

enum SearchCategory { multi, movies, tvShows, people, companies }
