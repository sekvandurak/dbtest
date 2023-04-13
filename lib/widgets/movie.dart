import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// "https://upload.wikimedia.org/wikipedia/en/thumb/e/e1/Joker_%282019_film%29_poster.jpg/220px-Joker_%282019_film%29_poster.jpg"
class MovieWidget extends StatelessWidget {
  const MovieWidget({
    Key? key,
    required this.movieImageUrl,
    // required this.movieImdb,
  }) : super(key: key);
  final String movieImageUrl;
  //final int movieImdb;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Column(
          children: [
            Image.network(
              movieImageUrl,
              height: 100.h,
              width: 70.w,
            ),
          ],
        ),
      ),
    );
  }
}
