import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget networkImageHandler({String? imageUrl}) {
  return CachedNetworkImage(
    imageUrl: imageUrl ?? 'https://via.placeholder.com/150',
    width: 130,
    height: 150,
    fit: BoxFit.cover,
    placeholder: (context, url) => Container(
      width: 130,
      height: 150,
      color: Colors.grey[300],
      child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
    ),
    errorWidget: (context, url, error) => Container(
      width: 130,
      height: 150,
      color: Colors.grey[300],
      child: const Icon(Icons.error, color: Colors.red),
    ),
  );
}
