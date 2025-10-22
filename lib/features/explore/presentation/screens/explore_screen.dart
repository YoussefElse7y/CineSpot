import 'package:cine_spot/core/helpers/enums.dart';
import 'package:cine_spot/features/explore/domain/entities/movie/movie_search_result_entity.dart';
import 'package:cine_spot/features/explore/domain/entities/multi/search_result_entity.dart';
import 'package:cine_spot/features/explore/domain/entities/person/person_search_entity.dart';
import 'package:cine_spot/features/explore/domain/entities/tv_search_response_entity.dart';
import 'package:cine_spot/features/explore/presentation/bloc/explore_bloc.dart';
import 'package:cine_spot/features/explore/presentation/bloc/explore_event.dart';
import 'package:cine_spot/features/explore/presentation/bloc/explore_state.dart';
import 'package:cine_spot/features/explore/presentation/widgets/active_filters_chips.dart';
import 'package:cine_spot/features/explore/presentation/widgets/category_tabs.dart';
import 'package:cine_spot/features/explore/presentation/widgets/error_state.dart';
import 'package:cine_spot/features/explore/presentation/widgets/filter_bottom_sheet.dart';
import 'package:cine_spot/features/explore/presentation/widgets/initial_search_state.dart';
import 'package:cine_spot/features/explore/presentation/widgets/search_header.dart';
import 'package:cine_spot/features/explore/presentation/widgets/search_results_grid.dart';
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
  final ScrollController _scrollController = ScrollController();

  // Filter states
  SearchCategory _selectedCategory = SearchCategory.multi;
  String? _selectedYear;
  int? _selectedGenreId;
  String? _selectedRegion;
  SortOption _selectedSort = SortOption.popularity;
  int _currentPage = 1;
  bool _isLoadingMore = false;

  // Results cache for pagination
  List<dynamic> _cachedResults = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent * 0.8 &&
        !_isLoadingMore) {
      _loadMoreResults();
    }
  }

  void _loadMoreResults() {
    if (_searchController.text.trim().isEmpty) return;

    setState(() {
      _isLoadingMore = true;
      _currentPage++;
    });

    _performSearch(_searchController.text.trim(), page: _currentPage);
  }

  void _onSearchChanged() {
    final query = _searchController.text.trim();
    if (query.isNotEmpty) {
      _currentPage = 1;
      _cachedResults.clear();
      _performSearch(query);
    } else {
      context.read<ExploreBloc>().add(const ExploreEvent.clearSearch());
      _cachedResults.clear();
    }
  }

  void _performSearch(String query, {int? page}) {
    final languageCode = Localizations.localeOf(context).languageCode;
    final searchPage = page ?? 1;

    switch (_selectedCategory) {
      case SearchCategory.multi:
        context.read<ExploreBloc>().add(
          ExploreEvent.searchMulti(
            query: query,
            language: languageCode,
            page: searchPage,
          ),
        );
        break;
      case SearchCategory.movies:
        context.read<ExploreBloc>().add(
          ExploreEvent.searchMovies(
            query: query,
            language: languageCode,
            year: _selectedYear,
            region: _selectedRegion,
            page: searchPage,
          ),
        );
        break;
      case SearchCategory.tvShows:
        context.read<ExploreBloc>().add(
          ExploreEvent.searchTvShows(
            query: query,
            language: languageCode,
            year: _selectedYear != null ? int.tryParse(_selectedYear!) : null,
            page: searchPage,
          ),
        );
        break;
      case SearchCategory.people:
        context.read<ExploreBloc>().add(
          ExploreEvent.searchPerson(
            query: query,
            language: languageCode,
            page: searchPage,
          ),
        );
        break;
      case SearchCategory.companies:
        context.read<ExploreBloc>().add(
          ExploreEvent.searchCompany(query: query, page: searchPage),
        );
        break;
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _showFilterBottomSheet() {
    SearchCategory tempCategory = _selectedCategory;
    String? tempYear = _selectedYear;
    int? tempGenreId = _selectedGenreId;
    String? tempRegion = _selectedRegion;
    SortOption tempSort = _selectedSort;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => StatefulBuilder(
        builder: (context, setModalState) {
          return FilterBottomSheet(
            tempCategory: tempCategory,
            tempYear: tempYear,
            tempGenreId: tempGenreId,
            tempRegion: tempRegion,
            tempSort: tempSort,
            onCategoryChanged: (category) {
              setModalState(() {
                tempCategory = category;
                tempGenreId = null; // Reset genre when category changes
              });
            },
            onYearChanged: (year) => setModalState(() => tempYear = year),
            onGenreChanged: (genreId) =>
                setModalState(() => tempGenreId = genreId),
            onRegionChanged: (region) =>
                setModalState(() => tempRegion = region),
            onSortChanged: (sort) => setModalState(() => tempSort = sort),
            onReset: () {
              setModalState(() {
                tempCategory = SearchCategory.multi;
                tempYear = null;
                tempGenreId = null;
                tempRegion = null;
                tempSort = SortOption.popularity;
              });
            },
            onApply: () {
              setState(() {
                _selectedCategory = tempCategory;
                _selectedYear = tempYear;
                _selectedGenreId = tempGenreId;
                _selectedRegion = tempRegion;
                _selectedSort = tempSort;
                _currentPage = 1;
                _cachedResults.clear();
              });
              Navigator.pop(context);
              if (_searchController.text.isNotEmpty) {
                _performSearch(_searchController.text.trim());
              }
            },
          );
        },
      ),
    );
  }

  List<dynamic> _sortResults(List<dynamic> results) {
    final sorted = List.from(results);

    switch (_selectedSort) {
      case SortOption.popularity:
        sorted.sort((a, b) {
          final popA = _getPopularity(a);
          final popB = _getPopularity(b);
          return popB.compareTo(popA);
        });
        break;
      case SortOption.latest:
        sorted.sort((a, b) {
          final dateA = _getReleaseDate(a);
          final dateB = _getReleaseDate(b);
          if (dateA == null && dateB == null) return 0;
          if (dateA == null) return 1;
          if (dateB == null) return -1;
          return dateB.compareTo(dateA);
        });
        break;
      case SortOption.rating:
        sorted.sort((a, b) {
          final ratingA = _getRating(a);
          final ratingB = _getRating(b);
          return ratingB.compareTo(ratingA);
        });
        break;
    }

    return sorted;
  }

  double _getPopularity(dynamic item) {
    if (item is SearchResultEntity) return item.popularity;
    if (item is MovieSearchResultEntity) return item.popularity;
    if (item is TvEntity) return item.popularity;
    if (item is PersonSearchEntity) return item.popularity;
    return 0;
  }

  String? _getReleaseDate(dynamic item) {
    if (item is SearchResultEntity) {
      return item.releaseDate ?? item.firstAirDate;
    }
    if (item is MovieSearchResultEntity) return item.releaseDate;
    if (item is TvEntity) return item.firstAirDate;
    return null;
  }

  double _getRating(dynamic item) {
    if (item is SearchResultEntity) return item.voteAverage;
    if (item is MovieSearchResultEntity) return item.voteAverage;
    if (item is TvEntity) return item.voteAverage;
    return 0;
  }

  List<dynamic> _filterByGenre(List<dynamic> results) {
    if (_selectedGenreId == null) return results;

    return results.where((item) {
      List<int>? genreIds;
      if (item is SearchResultEntity) genreIds = item.genreIds;
      if (item is MovieSearchResultEntity) genreIds = item.genreIds;
      if (item is TvEntity) genreIds = item.genreIds;

      return genreIds?.contains(_selectedGenreId) ?? false;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SearchHeader(
              searchController: _searchController,
              searchFocusNode: _searchFocusNode,
              onFilterTap: _showFilterBottomSheet,
              hasActiveFilters:
                  _selectedYear != null ||
                  _selectedGenreId != null ||
                  _selectedRegion != null,
              onClearSearch: () {
                _searchController.clear();
                _cachedResults.clear();
                context.read<ExploreBloc>().add(
                  const ExploreEvent.clearSearch(),
                );
              },
            ),

            CategoryTabs(
              selectedCategory: _selectedCategory,
              onCategorySelected: (category) {
                setState(() {
                  _selectedCategory = category;
                  _currentPage = 1;
                  _cachedResults.clear();
                });
                if (_searchController.text.isNotEmpty) {
                  _performSearch(_searchController.text.trim());
                }
              },
            ),

            ActiveFiltersChips(
              selectedYear: _selectedYear,
              selectedGenreId: _selectedGenreId,
              selectedRegion: _selectedRegion,
              selectedCategory: _selectedCategory,
              onRemoveYear: () {
                setState(() {
                  _selectedYear = null;
                  _currentPage = 1;
                  _cachedResults.clear();
                });
                if (_searchController.text.isNotEmpty) {
                  _performSearch(_searchController.text.trim());
                }
              },
              onRemoveGenre: () {
                setState(() {
                  _selectedGenreId = null;
                  _currentPage = 1;
                  _cachedResults.clear();
                });
                if (_searchController.text.isNotEmpty) {
                  _performSearch(_searchController.text.trim());
                }
              },
              onRemoveRegion: () {
                setState(() {
                  _selectedRegion = null;
                  _currentPage = 1;
                  _cachedResults.clear();
                });
                if (_searchController.text.isNotEmpty) {
                  _performSearch(_searchController.text.trim());
                }
              },
            ),

            Expanded(
              child: BlocConsumer<ExploreBloc, ExploreState>(
                listener: (context, state) {
                  state.maybeWhen(
                    multiSearchLoaded: (searchResponse) {
                      if (_currentPage == 1) {
                        _cachedResults = searchResponse.results;
                      } else {
                        _cachedResults.addAll(searchResponse.results);
                      }
                      setState(() => _isLoadingMore = false);
                    },
                    movieSearchLoaded: (movieSearchResponse) {
                      if (_currentPage == 1) {
                        _cachedResults = movieSearchResponse.results;
                      } else {
                        _cachedResults.addAll(movieSearchResponse.results);
                      }
                      setState(() => _isLoadingMore = false);
                    },
                    tvShowSearchLoaded: (tvSearchResponse) {
                      if (_currentPage == 1) {
                        _cachedResults = tvSearchResponse.results;
                      } else {
                        _cachedResults.addAll(tvSearchResponse.results);
                      }
                      setState(() => _isLoadingMore = false);
                    },
                    personSearchLoaded: (personSearchResponse) {
                      if (_currentPage == 1) {
                        _cachedResults = personSearchResponse.results;
                      } else {
                        _cachedResults.addAll(personSearchResponse.results);
                      }
                      setState(() => _isLoadingMore = false);
                    },
                    orElse: () => setState(() => _isLoadingMore = false),
                  );
                },
                builder: (context, state) {
                  return state.when(
                    initial: (trending) => InitialSearchState(l10n: l10n, trendingTvShows: trending.results, ),
                    loading: () => _currentPage == 1
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Color(0xFFE21221),
                            ),
                          )
                        : SearchResultsGrid(
                            results: _sortResults(
                              _filterByGenre(_cachedResults),
                            ),
                            scrollController: _scrollController,
                            isLoadingMore: _isLoadingMore,
                          ),
                    multiSearchLoaded: (_) => SearchResultsGrid(
                      results: _sortResults(_filterByGenre(_cachedResults)),
                      scrollController: _scrollController,
                      isLoadingMore: _isLoadingMore,
                    ),
                    movieSearchLoaded: (_) => SearchResultsGrid(
                      results: _sortResults(_filterByGenre(_cachedResults)),
                      scrollController: _scrollController,
                      isLoadingMore: _isLoadingMore,
                    ),
                    tvShowSearchLoaded: (_) => SearchResultsGrid(
                      results: _sortResults(_filterByGenre(_cachedResults)),
                      scrollController: _scrollController,
                      isLoadingMore: _isLoadingMore,
                    ),
                    personSearchLoaded: (_) => SearchResultsGrid(
                      results: _sortResults(_cachedResults),
                      scrollController: _scrollController,
                      isLoadingMore: _isLoadingMore,
                    ),
                    companySearchLoaded: (_) =>
                        const Center(child: Text('Company Results')),
                    error: (message) => ErrorState(message: message),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


