import 'package:cine_spot/core/helpers/geners.dart';
import 'package:cine_spot/core/network/api_constants.dart';
import 'package:cine_spot/features/home/domain/entities/movie_entity.dart';
import 'package:cine_spot/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    String language = Localizations.localeOf(context).languageCode;
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        state.maybeWhen(
          initial: () {
            context.read<HomeBloc>().add(HomeEvent.getTopTenMovies(language));
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            // App Bar with Logo and Icons
            SliverAppBar(
              floating: true,
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              elevation: 0,
              title: Text(
                'CineSpot',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFE21221),
                ),
              ),
              actions: [
                IconButton(icon: const Icon(Icons.search), onPressed: () {}),
                IconButton(
                  icon: const Icon(Icons.notifications_outlined),
                  onPressed: () {},
                ),
              ],
            ),
            // Main Content
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Featured Movie/Show Banner
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () {
                          return const SizedBox();
                        },
                        topMoviesLoading: () {
                          return const SizedBox(
                            height: 500,
                            child: Center(child: CircularProgressIndicator()),
                          );
                        },
                        topMoviesLoaded: (movie) {
                          MovieEntity randomMovie = getRandomElement(
                            movie.results,
                          );
                          return _buildFeaturedBanner(
                            context,
                            isDark,
                            '${ApiConstants.baseImageUrl}${randomMovie.posterPath}',
                            randomMovie.title,
                            randomMovie.overview,
                            randomMovie.genreIds,
                          );
                        },
                      );
                    },
                  ),

                  const SizedBox(height: 24),

                  // Top 10 Movies This Week
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        topMoviesLoading: () {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                        topMoviesLoaded: (movies) {
                          return _buildMovieSection(
                            context,
                            'Top Movies This Week',
                            movies.results
                                .map(
                                  (movie) => _MovieItem(
                                    movie.title,
                                    movie.voteAverage,
                                    '${ApiConstants.baseImageUrl}${movie.posterPath}',
                                  ),
                                  //i want to remove
                                )
                                .toList(),
                          );
                        },
                        orElse: () {
                          return Center(
                            child: SizedBox(
                              height: 200,
                              child: Text('No movies found'),
                            ),
                          );
                        },
                      );
                    },
                  ),

                  const SizedBox(height: 24),

                  // New Releases
                  _buildMovieSection(context, 'Now Playing', [
                    _MovieItem('Inside Out 2', 9.5, ''),
                    _MovieItem('The Marvels', 9.8, ''),
                    _MovieItem('Black Adam', 9.7, ''),
                    _MovieItem('Thor', 9.4, ''),
                  ]),

                  const SizedBox(height: 24),

                  // Trending Now
                  _buildMovieSection(context, 'Trending Now', [
                    _MovieItem('Dune', 9.3, ''),
                    _MovieItem('Oppenheimer', 9.6, ''),
                    _MovieItem('Barbie', 9.1, ''),
                    _MovieItem('Mission Impossible', 9.2, ''),
                  ]),

                  const SizedBox(height: 100),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeaturedBanner(
    BuildContext context,
    bool isDark,
    String imageUrl,
    String title,
    String description,
    List<int> genres,
  ) {
    return Container(
      height: 500,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            isDark ? const Color(0xFF181A20) : Colors.white,
          ],
        ),
      ),
      child: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              color: isDark ? Colors.grey[850] : Colors.grey[300],
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Gradient Overlay

          // Content
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [Shadow(color: Colors.black, blurRadius: 10)],
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[300],
                      shadows: const [
                        Shadow(color: Colors.black, blurRadius: 10),
                      ],
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(padding: const EdgeInsets.only(top: 8.0)),
                Wrap(
                  spacing: 8, // horizontal space
                  runSpacing: 8, // vertical space
                  children: getGenreNames(genres).map((genre) {
                    return Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.white),
                      ),
                      child: Text(
                        genre,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          shadows: [
                            Shadow(
                              color: Colors.black,
                              offset: Offset(0, 1),
                              blurRadius: 2,
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Play Button
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.play_arrow),
                      label: const Text('Play'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE21221),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),

                    // My List Button
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                      label: const Text('My List'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: const BorderSide(color: Colors.white),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMovieSection(
    BuildContext context,
    String title,
    List<_MovieItem> movies,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'See all',
                  style: TextStyle(color: Color(0xFFE21221), fontSize: 14),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 240,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: _buildMovieCard(context, movie),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildMovieCard(BuildContext context, _MovieItem movie) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: isDark ? Colors.grey[850] : Colors.grey[200],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Movie Poster
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: Container(
                  height: 200,
                  width: 160,
                  color: isDark ? Colors.grey[800] : Colors.grey[300],
                  child: Image.network(
                    movie.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.movie, size: 60, color: Colors.grey),
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                  ),
                ),
              ),
              // Rating Badge
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE21221),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    movie.rating.toStringAsFixed(1),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Movie Title
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              movie.title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class _MovieItem {
  final String title;
  final double rating;
  final String imageUrl;

  _MovieItem(this.title, this.rating, this.imageUrl);
}
