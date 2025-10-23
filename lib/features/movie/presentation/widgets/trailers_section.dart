import 'package:cine_spot/features/movie/presentation/bloc/movie_bloc.dart';
import 'package:cine_spot/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailersSection extends StatelessWidget {
  const TrailersSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return BlocBuilder<MovieBloc, MovieState>(
      buildWhen: (previous, current) =>
          previous.videosStatus != current.videosStatus,
      builder: (context, state) {
        if (state.videosStatus == MovieVideosStatus.loading) {
          return const SizedBox(
            height: 200,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (state.videosStatus == MovieVideosStatus.error) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Failed to load trailers',
              style: TextStyle(
                color: isDark ? Colors.grey[400] : Colors.grey[600],
              ),
            ),
          );
        }

        if (state.videosStatus == MovieVideosStatus.loaded &&
            state.videos != null &&
            state.videos!.results.isNotEmpty) {
          // Filter for trailers and teasers
          final trailers = state.videos!.results;

          if (trailers.isEmpty) return const SizedBox.shrink();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Videos',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 190,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: trailers.length,
                  itemBuilder: (context, index) {
                    final video = trailers[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: _TrailerCard(
                        videoKey: video.key,
                        title: video.name,
                        type: video.type,
                        isDark: isDark,
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}

class _TrailerCard extends StatelessWidget {
  final String videoKey;
  final String title;
  final String type;
  final bool isDark;

  const _TrailerCard({
    required this.videoKey,
    required this.title,
    required this.type,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final language = AppLocalizations.of(context)!.locale_language;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                VideoPlayerScreen(videoKey: videoKey, title: title ,language: language,),
          ),
        );
      },
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isDark ? Colors.grey[850] : Colors.grey[200],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnail
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: Image.network(
                    'https://img.youtube.com/vi/$videoKey/hqdefault.jpg',
                    height: 140,
                    width: 300,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 140,
                        width: 300,
                        color: isDark ? Colors.grey[800] : Colors.grey[300],
                        child: const Icon(
                          Icons.movie,
                          size: 40,
                          color: Colors.grey,
                        ),
                      );
                    },
                  ),
                ),
                // Play Button Overlay
                Positioned.fill(
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),
                ),
                // Type Badge
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE21221),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      type,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Title
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: isDark ? Colors.white : Colors.black,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  final String videoKey;
  final String title;
  final String language;

  const VideoPlayerScreen({
    super.key,
    required this.videoKey,
    required this.title,
    required this.language,
  });

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoKey,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        enableCaption: true,
        captionLanguage: widget.language,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.title, style: const TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: const Color(0xFFE21221),
          progressColors: const ProgressBarColors(
            playedColor: Color(0xFFE21221),
            handleColor: Color(0xFFE21221),
          ),
        ),
      ),
    );
  }
}
