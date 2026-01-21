import 'package:cached_network_image/cached_network_image.dart';
import 'package:cine_spot/core/di/injection_container.dart';
import 'package:cine_spot/core/network/tmdb_image_helper.dart';
import 'package:cine_spot/core/routing/routes.dart';
import 'package:cine_spot/core/theme/theme_constants.dart';
import 'package:cine_spot/features/movie/domain/entities/movie_details_entity.dart';
import 'package:cine_spot/features/movie/presentation/bloc/movie_bloc.dart';
import 'package:cine_spot/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:cine_spot/features/tv_show/domain/entities/tv_show_details_entity.dart';
import 'package:cine_spot/features/tv_show/presentation/bloc/tv_show_bloc.dart';
import 'package:cine_spot/l10n/app_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyListScreen extends StatefulWidget {
  const MyListScreen({super.key});

  @override
  State<MyListScreen> createState() => _MyListScreenState();
}

class _MyListScreenState extends State<MyListScreen> {
  final Map<int, MovieDetailsEntity> _movieCache = {};
  final Map<int, bool> _movieLoadingStates = {};

  final Map<int, TvShowDetailsEntity> _tvShowCache = {};
  final Map<int, bool> _tvShowLoadingStates = {};

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  void _loadUserProfile() {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId != null) {
      context.read<ProfileBloc>().add(ProfileEvent.loadProfile(userId));
    }
  }

  void _fetchMovieDetails(int movieId) {
    if (_movieCache.containsKey(movieId) ||
        _movieLoadingStates[movieId] == true) {
      return;
    }

    setState(() {
      _movieLoadingStates[movieId] = true;
    });

    final movieBloc = sl<MovieBloc>();
    movieBloc.add(MovieEvent.loadMovieDetails(movieId));

    movieBloc.stream.listen((state) {
      if (state.detailsStatus == MovieDetailsStatus.loaded &&
          state.movieDetails != null) {
        setState(() {
          _movieCache[movieId] = state.movieDetails!;
          _movieLoadingStates[movieId] = false;
        });
      } else if (state.detailsStatus == MovieDetailsStatus.error) {
        setState(() {
          _movieLoadingStates[movieId] = false;
        });
      }
    });
  }

  void _fetchTvShowDetails(int tvShowId) {
    if (_tvShowCache.containsKey(tvShowId) ||
        _tvShowLoadingStates[tvShowId] == true) {
      return;
    }

    setState(() {
      _tvShowLoadingStates[tvShowId] = true;
    });

    final tvShowBloc = sl<TvShowBloc>();
    tvShowBloc.add(TvShowEvent.loadTvShowDetails(tvShowId));

    tvShowBloc.stream.listen((state) {
      if (state.detailsStatus == TvShowDetailsStatus.loaded &&
          state.tvShowDetails != null) {
        setState(() {
          _tvShowCache[tvShowId] = state.tvShowDetails!;
          _tvShowLoadingStates[tvShowId] = false;
        });
      } else if (state.detailsStatus == TvShowDetailsStatus.error) {
        setState(() {
          _tvShowLoadingStates[tvShowId] = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;
    final userId = FirebaseAuth.instance.currentUser?.uid ?? '';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n.myList,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is Error) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, size: 64, color: Colors.grey[400]),
                  const SizedBox(height: 16),
                  Text(
                    'Failed to load your list',
                    style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: _loadUserProfile,
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          if (state is! Loaded) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.bookmark_border,
                    size: 64,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No profile found',
                    style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                  ),
                ],
              ),
            );
          }

          final wishlistMovieIds = state.profile.wishlistMoviesIds ?? [];
          final wishlistTvIds = state.profile.wishlistTvIds ?? [];

          if (wishlistMovieIds.isEmpty && wishlistTvIds.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.bookmark_border,
                    size: 80,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    l10n.myList,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Your watchlist is empty',
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Add movies and TV shows to watch later',
                    style: TextStyle(fontSize: 14, color: Colors.grey[500]),
                  ),
                ],
              ),
            );
          }

          // Fetch details for all wishlist items
          if (wishlistMovieIds.isNotEmpty) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              for (final movieId in wishlistMovieIds) {
                _fetchMovieDetails(movieId);
              }
            });
          }

          if (wishlistTvIds.isNotEmpty) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              for (final tvShowId in wishlistTvIds) {
                _fetchTvShowDetails(tvShowId);
              }
            });
          }

          return RefreshIndicator(
            onRefresh: () async {
              _loadUserProfile();
              _movieCache.clear();
              _movieLoadingStates.clear();
              _tvShowCache.clear();
              _tvShowLoadingStates.clear();
            },
            child: CustomScrollView(
              slivers: [
                // Movies Section
                if (wishlistMovieIds.isNotEmpty) ...[
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Icon(
                            Icons.movie,
                            color: ThemeConstants.primaryDark,
                            size: 24,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            l10n.movies,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: ThemeConstants.primaryDark.withOpacity(
                                0.1,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              '${wishlistMovieIds.length}',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: ThemeConstants.primaryDark,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    sliver: SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 0.55,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 16,
                          ),
                      delegate: SliverChildBuilderDelegate((context, index) {
                        final movieId = wishlistMovieIds[index];
                        final movie = _movieCache[movieId];
                        final isLoading = _movieLoadingStates[movieId] ?? true;

                        return _buildMovieCard(
                          context,
                          movieId,
                          movie,
                          isLoading,
                          isDark,
                          userId,
                        );
                      }, childCount: wishlistMovieIds.length),
                    ),
                  ),
                ],

                // TV Shows Section
                if (wishlistTvIds.isNotEmpty) ...[
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
                      child: Row(
                        children: [
                          Icon(
                            Icons.tv,
                            color: ThemeConstants.primaryDark,
                            size: 24,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            l10n.tvShows,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: ThemeConstants.primaryDark.withOpacity(
                                0.1,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              '${wishlistTvIds.length}',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: ThemeConstants.primaryDark,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    sliver: SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 0.55,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 16,
                          ),
                      delegate: SliverChildBuilderDelegate((context, index) {
                        final tvShowId = wishlistTvIds[index];
                        final tvShow = _tvShowCache[tvShowId];
                        final isLoading =
                            _tvShowLoadingStates[tvShowId] ?? true;

                        return _buildTvShowCard(
                          context,
                          tvShowId,
                          tvShow,
                          isLoading,
                          isDark,
                          userId,
                        );
                      }, childCount: wishlistTvIds.length),
                    ),
                  ),
                ],

                const SliverToBoxAdapter(child: SizedBox(height: 150)),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildMovieCard(
    BuildContext context,
    int movieId,
    MovieDetailsEntity? movie,
    bool isLoading,
    bool isDark,
    String userId,
  ) {
    if (isLoading) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isDark ? Colors.grey[850] : Colors.grey[200],
        ),
        child: const Center(
          child: SizedBox(
            width: 30,
            height: 30,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        ),
      );
    }

    if (movie == null) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isDark ? Colors.grey[850] : Colors.grey[200],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 40, color: Colors.grey[600]),
            const SizedBox(height: 8),
            Text(
              'Failed to load',
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.movieDetailsScreen,
          arguments: movieId,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isDark ? Colors.grey[850] : Colors.grey[200],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                    child: movie.posterPath != null
                        ? CachedNetworkImage(
                            imageUrl: TMDBImageHelper.getPoster(
                              movie.posterPath!,
                              PosterSize.w342,
                            ),
                            width: double.infinity,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Container(
                              color: isDark
                                  ? Colors.grey[800]
                                  : Colors.grey[300],
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                            errorWidget: (context, url, error) => Container(
                              color: isDark
                                  ? Colors.grey[800]
                                  : Colors.grey[300],
                              child: const Icon(
                                Icons.movie,
                                size: 60,
                                color: Colors.grey,
                              ),
                            ),
                          )
                        : Container(
                            color: isDark ? Colors.grey[800] : Colors.grey[300],
                            child: const Icon(
                              Icons.movie,
                              size: 60,
                              color: Colors.grey,
                            ),
                          ),
                  ),
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE21221),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.star, color: Colors.white, size: 12),
                          const SizedBox(width: 2),
                          Text(
                            movie.voteAverage.toStringAsFixed(1),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                        color: ThemeConstants.primaryDark.withOpacity(0.9),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(
                          minWidth: 22,
                          minHeight: 22,
                        ),
                        onPressed: () {
                          context.read<ProfileBloc>().add(
                            ProfileEvent.removeWishlistMovie(userId, movieId),
                          );
                        },
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    movie.releaseDate.isNotEmpty
                        ? movie.releaseDate.split('-')[0]
                        : 'N/A',
                    style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTvShowCard(
    BuildContext context,
    int tvShowId,
    TvShowDetailsEntity? tvShow,
    bool isLoading,
    bool isDark,
    String userId,
  ) {
    if (isLoading) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isDark ? Colors.grey[850] : Colors.grey[200],
        ),
        child: const Center(
          child: SizedBox(
            width: 30,
            height: 30,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        ),
      );
    }

    if (tvShow == null) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isDark ? Colors.grey[850] : Colors.grey[200],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 40, color: Colors.grey[600]),
            const SizedBox(height: 8),
            Text(
              'Failed to load',
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.tvShowDetailsScreen,
          arguments: tvShowId,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isDark ? Colors.grey[850] : Colors.grey[200],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                    child: tvShow.posterPath != null
                        ? CachedNetworkImage(
                            imageUrl: TMDBImageHelper.getPoster(
                              tvShow.posterPath!,
                              PosterSize.w342,
                            ),
                            width: double.infinity,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Container(
                              color: isDark
                                  ? Colors.grey[800]
                                  : Colors.grey[300],
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                            errorWidget: (context, url, error) => Container(
                              color: isDark
                                  ? Colors.grey[800]
                                  : Colors.grey[300],
                              child: const Icon(
                                Icons.tv,
                                size: 60,
                                color: Colors.grey,
                              ),
                            ),
                          )
                        : Container(
                            color: isDark ? Colors.grey[800] : Colors.grey[300],
                            child: const Icon(
                              Icons.tv,
                              size: 60,
                              color: Colors.grey,
                            ),
                          ),
                  ),
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE21221),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.star, color: Colors.white, size: 12),
                          const SizedBox(width: 2),
                          Text(
                            tvShow.voteAverage.toStringAsFixed(1),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                        color: ThemeConstants.primaryDark.withOpacity(0.9),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(
                          minWidth: 22,
                          minHeight: 22,
                        ),
                        onPressed: () {
                          context.read<ProfileBloc>().add(
                            ProfileEvent.removeWishlistTvShow(userId, tvShowId),
                          );
                        },
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tvShow.name,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    tvShow.firstAirDate.isNotEmpty
                        ? tvShow.firstAirDate.split('-')[0]
                        : 'N/A',
                    style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _movieCache.clear();
    _movieLoadingStates.clear();
    _tvShowCache.clear();
    _tvShowLoadingStates.clear();
    super.dispose();
  }
}
