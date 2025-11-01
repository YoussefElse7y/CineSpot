import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

 CachedNetworkImage displayImage({required String imageUrl , required BuildContext context, required bool isDark ,
 required double width , required double height ,required Icon errorIcon
}) {
  return CachedNetworkImage(
    key: ValueKey(imageUrl),
    imageUrl: imageUrl,
    fit: BoxFit.cover,
    width: width,
    height: height,
    // ADD SHIMMER
    placeholder: (context, url) => Shimmer.fromColors(
      baseColor:isDark
          ? const Color(0xFF1F1F1F)
          : const Color(0xFFE0E0E0),
      highlightColor:isDark
          ? const Color(0xFF4A4A4A)
          : const Color(0xFFF5F5F5),
      child: Container(
        width: width,
        height: height,
        color: Colors.white,
      ),
    ),
    errorWidget: (context, url, error) => Container(
      color: isDark ? Colors.grey[850] : Colors.grey[300],
      child: errorIcon,
    ),
  );
}
