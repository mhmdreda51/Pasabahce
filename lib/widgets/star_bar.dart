import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class StarsBar extends StatelessWidget {
  const StarsBar({
    Key? key,
    required this.stars,
  }) : super(key: key);

  final double stars;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      minRating: 1,
      maxRating: 5.0,
      initialRating: stars,
      itemSize: 14.0,
      allowHalfRating: true,
      ignoreGestures: true,
      direction: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.yellow),
      onRatingUpdate: (rating) {},
    );
  }
}