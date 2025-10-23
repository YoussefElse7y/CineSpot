// ignore_for_file: deprecated_member_use

import 'package:cine_spot/core/theme/theme_constants.dart';
import 'package:cine_spot/features/home/presentation/screens/home_screen.dart';
import 'package:cine_spot/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsScreen extends StatefulWidget {
  final List<MovieItem> movies;
  final String pageTitle;

  const DetailsScreen({
    super.key,
    required this.movies,
    required this.pageTitle,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<MovieItem> _filteredMovies = [];

  @override
  void initState() {
    super.initState();
    _filteredMovies = widget.movies;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterMovies(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredMovies = widget.movies;
      } else {
        _filteredMovies = widget.movies
            .where(
              (movie) =>
                  movie.title.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    String userId = FirebaseAuth.instance.currentUser!.uid;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF181A20) : Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header with back button and title
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_back,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      widget.pageTitle,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white : Colors.black,
                      ),
                    ),
                  ),

                  // Search icon in header
                ],
              ),
            ),

            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: _searchController,
                onChanged: _filterMovies,
                style: TextStyle(color: isDark ? Colors.white : Colors.black),
                decoration: InputDecoration(
                  hintText: 'Search movies...',
                  hintStyle: TextStyle(
                    color: isDark ? Colors.grey[500] : Colors.grey[600],
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: isDark ? Colors.grey[500] : Colors.grey[600],
                  ),
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                          onPressed: () {
                            _searchController.clear();
                            _filterMovies('');
                          },
                          icon: Icon(
                            Icons.clear,
                            color: isDark ? Colors.grey[500] : Colors.grey[600],
                          ),
                        )
                      : null,
                  filled: true,
                  fillColor: isDark
                      ? const Color(0xFF1F222B)
                      : const Color(0xFFFAFAFA),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Color(0xFFE21221),
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Movies List
            Expanded(
              child: _filteredMovies.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search_off,
                            size: 64,
                            color: isDark ? Colors.grey[700] : Colors.grey[400],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'No movies found',
                            style: TextStyle(
                              fontSize: 18,
                              color: isDark
                                  ? Colors.grey[500]
                                  : Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: _filteredMovies.length,
                      itemBuilder: (context, index) {
                        final movie = _filteredMovies[index];
                        return _buildMovieCard(
                          context,
                          userId,
                          movie,
                          index + 1,
                          isDark,
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMovieCard(
    BuildContext context,
    String userId,
    MovieItem movie,
    int rank,
    bool isDark,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1F222B) : const Color(0xFFFAFAFA),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          // Navigate to movie details
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Rank Badge
              // Container(
              //   width: 30,
              //   height: 30,
              //   decoration: BoxDecoration(
              //     color: const Color(0xFFE21221),
              //     borderRadius: BorderRadius.circular(8),
              //   ),
              //   child: Center(
              //     child: Text(
              //       '$rank',
              //       style: const TextStyle(
              //         color: Colors.white,
              //         fontSize: 20,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //   ),
              // ),

              // const SizedBox(width: 12),

              // Movie Poster
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: 80,
                  height: 120,
                  color: isDark ? Colors.grey[800] : Colors.grey[300],
                  child: Image.network(
                    movie.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.movie, size: 40, color: Colors.grey),
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                              : null,
                          strokeWidth: 2,
                          color: const Color(0xFFE21221),
                        ),
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(width: 12),

              // Movie Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white : Colors.black,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 18),
                        const SizedBox(width: 4),
                        Text(
                          movie.rating.toStringAsFixed(1),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: isDark ? Colors.white : Colors.black,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE21221).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            movie.releaseDate.split('-')[0],
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFFE21221),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      movie.description,
                      style: TextStyle(
                        fontSize: 12,
                        color: isDark ? Colors.grey[400] : Colors.grey[600],
                        height: 1.4,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),

              // Bookmark Icon
              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  bool isFavorite = false;
                  bool isExist = false;
                  if (state is Loaded) {
                    if (movie.type == "movie") {
                      isFavorite =
                          state.profile.favoriteMoviesIds?.contains(movie.id) ??
                          false;
                      isExist =
                          state.profile.wishlistMoviesIds?.contains(movie.id) ??
                          false;
                    } else {
                      isFavorite =
                          state.profile.favoriteTvIds?.contains(movie.id) ??
                          false;
                      isExist =
                          state.profile.wishlistTvIds?.contains(movie.id) ??
                          false;
                    }
                  }
                  return Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          if (isFavorite) {
                            if (movie.type == "movie") {
                              context.read<ProfileBloc>().add(
                                ProfileEvent.removeFavoriteMovie(
                                  userId,
                                  movie.id,
                                ),
                              );
                            } else {
                              context.read<ProfileBloc>().add(
                                ProfileEvent.removeFavoriteTvShow(
                                  userId,
                                  movie.id,
                                ),
                              );
                            }
                          } else {
                            if (movie.type == "movie") {
                              context.read<ProfileBloc>().add(
                                ProfileEvent.addFavoriteMovie(userId, movie.id),
                              );
                            } else {
                              context.read<ProfileBloc>().add(
                                ProfileEvent.addFavoriteTvShow(
                                  userId,
                                  movie.id,
                                ),
                              );
                            }
                          }
                        },
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite
                              ? ThemeConstants.primaryLight
                              : isDark
                              ? Colors.grey[400]
                              : Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 30),

                      IconButton(
                        onPressed: () {
                          if (isExist) {
                            if (movie.type == "movie") {
                              context.read<ProfileBloc>().add(
                                ProfileEvent.removeWishlistMovie(
                                  userId,
                                  movie.id,
                                ),
                              );
                            } else {
                              context.read<ProfileBloc>().add(
                                ProfileEvent.removeWishlistTvShow(
                                  userId,
                                  movie.id,
                                ),
                              );
                            }
                          } else {
                            if (movie.type == "movie") {
                              context.read<ProfileBloc>().add(
                                ProfileEvent.addWishlistMovie(userId, movie.id),
                              );
                            } else {
                              context.read<ProfileBloc>().add(
                                ProfileEvent.addWishlistTvShow(
                                  userId,
                                  movie.id,
                                ),
                              );
                            }
                          }
                        },
                        icon: Icon(
                          isExist ? Icons.bookmark : Icons.bookmark_border,
                          color: isExist
                              ? ThemeConstants.primaryDark
                              : isDark
                              ? Colors.grey[400]
                              : Colors.grey[600],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
