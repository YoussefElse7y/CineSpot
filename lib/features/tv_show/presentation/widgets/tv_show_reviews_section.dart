import 'package:cached_network_image/cached_network_image.dart';
import 'package:cine_spot/features/tv_show/presentation/bloc/tv_show_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class TvShowReviewsSection extends StatelessWidget {
  const TvShowReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return BlocBuilder<TvShowBloc, TvShowState>(
      buildWhen: (previous, current) =>
          previous.reviewsStatus != current.reviewsStatus,
      builder: (context, state) {
        if (state.reviewsStatus == TvShowReviewsStatus.loading) {
          return const SizedBox(
            height: 200,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (state.reviewsStatus == TvShowReviewsStatus.error) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Failed to load reviews',
              style: TextStyle(
                color: isDark ? Colors.grey[400] : Colors.grey[600],
              ),
            ),
          );
        }

        if (state.reviewsStatus == TvShowReviewsStatus.loaded &&
            state.tvShowReviews != null &&
            state.tvShowReviews!.results.isNotEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Reviews',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white : Colors.black,
                      ),
                    ),
                    Text(
                      '${state.tvShowReviews!.results.length} Reviews',
                      style: TextStyle(
                        fontSize: 14,
                        color: isDark ? Colors.grey[400] : Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: state.tvShowReviews!.results.length > 3 
                    ? 3 
                    : state.tvShowReviews!.results.length,
                separatorBuilder: (context, index) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final review = state.tvShowReviews!.results[index];
                  return _ReviewCard(
                    author: review.author,
                    avatarPath: review.authorDetails.avatarPath,
                    rating: review.authorDetails.rating,
                    content: review.content,
                    createdAt: review.createdAt,
                    isDark: isDark,
                  );
                },
              ),
              if (state.tvShowReviews!.results.length > 3)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: TextButton(
                    onPressed: () {
                      // TODO: Navigate to all reviews
                    },
                    child: const Text('See All Reviews'),
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

class _ReviewCard extends StatefulWidget {
  final String author;
  final String? avatarPath;
  final double? rating;
  final String content;
  final String createdAt;
  final bool isDark;

  const _ReviewCard({
    required this.author,
    required this.avatarPath,
    required this.rating,
    required this.content,
    required this.createdAt,
    required this.isDark,
  });

  @override
  State<_ReviewCard> createState() => _ReviewCardState();
}

class _ReviewCardState extends State<_ReviewCard> {
  bool _isExpanded = false;

  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      return DateFormat('MMM dd, yyyy').format(date);
    } catch (e) {
      return dateString;
    }
  }

  @override
  Widget build(BuildContext context) {
    final maxLines = _isExpanded ? null : 4;
    final showReadMore = widget.content.length > 200;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: widget.isDark ? Colors.grey[850] : Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Author Info
          Row(
            children: [
              // Avatar
              CircleAvatar(
                radius: 20,
                backgroundColor: widget.isDark ? Colors.grey[700] : Colors.grey[300],
                child: widget.avatarPath != null && 
                       widget.avatarPath!.isNotEmpty &&
                       !widget.avatarPath!.contains('gravatar')
                    ? ClipOval(
                        child: CachedNetworkImage(
                          imageUrl: widget.avatarPath!.startsWith('http')
                              ? widget.avatarPath!
                              : 'https://image.tmdb.org/t/p/w185${widget.avatarPath}',
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                          errorWidget: (context, url, error) => Icon(
                            Icons.person,
                            color: widget.isDark ? Colors.grey[400] : Colors.grey[600],
                          ),
                        ),
                      )
                    : Icon(
                        Icons.person,
                        color: widget.isDark ? Colors.grey[400] : Colors.grey[600],
                      ),
              ),
              const SizedBox(width: 12),

              // Author Name and Date
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.author,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: widget.isDark ? Colors.white : Colors.black,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      _formatDate(widget.createdAt),
                      style: TextStyle(
                        fontSize: 12,
                        color: widget.isDark ? Colors.grey[400] : Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),

              // Rating
              if (widget.rating != null)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE21221),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.white,
                        size: 14,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        widget.rating!.toStringAsFixed(1),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),

          const SizedBox(height: 12),

          // Review Content
          Text(
            widget.content,
            style: TextStyle(
              fontSize: 13,
              height: 1.5,
              color: widget.isDark ? Colors.grey[300] : Colors.grey[800],
            ),
            maxLines: maxLines,
            overflow: _isExpanded ? null : TextOverflow.ellipsis,
          ),

          // Read More/Less Button
          if (showReadMore)
            TextButton(
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: const Size(0, 32),
              ),
              child: Text(
                _isExpanded ? 'Read Less' : 'Read More',
                style: const TextStyle(
                  color: Color(0xFFE21221),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
        ],
      ),
    );
  }
}