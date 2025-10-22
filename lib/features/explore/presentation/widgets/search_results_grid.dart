
import 'package:cine_spot/features/explore/presentation/widgets/not_found_state.dart';
import 'package:cine_spot/features/explore/presentation/widgets/result_card.dart';
import 'package:flutter/material.dart';

class SearchResultsGrid extends StatelessWidget {
  final List<dynamic> results;
  final ScrollController scrollController;
  final bool isLoadingMore;

  const SearchResultsGrid({
    super.key,
    required this.results,
    required this.scrollController,
    required this.isLoadingMore,
  });

  @override
  Widget build(BuildContext context) {
    if (results.isEmpty) {
      return const NotFoundState();
    }

    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            controller: scrollController,
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
              return ResultCard(result: result);
            },
          ),
        ),
        if (isLoadingMore)
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: CircularProgressIndicator(color: Color(0xFFE21221)),
          ),
      ],
    );
  }
}
