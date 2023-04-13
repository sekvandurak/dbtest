import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// "https://upload.wikimedia.org/wikipedia/en/thumb/e/e1/Joker_%282019_film%29_poster.jpg/220px-Joker_%282019_film%29_poster.jpg"
class InfoWidget extends StatelessWidget {
  const InfoWidget({
    Key? key,
    required this.info,
    required this.number,
  }) : super(key: key);
  final String info;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number.toString(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24.h,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          info,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 10.h,
          ),
        ),
      ],
    );
  }
}
