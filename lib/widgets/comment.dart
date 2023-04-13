import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget({
    Key? key,
    required this.review,
    required this.userName,
    required this.userAvatarUrl,
    required this.movieName,
    required this.movieImageUrl,
    required this.movieDate,
  }) : super(key: key);

  final String movieDate;
  final String movieImageUrl;
  final String movieName;
  final String review;
  final String userAvatarUrl;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 337.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(14.r),
          topRight: Radius.circular(7.r),
          bottomLeft: Radius.circular(7.r),
          bottomRight: Radius.circular(7.r),
        ),
        color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 14.r,
            backgroundImage: NetworkImage(userAvatarUrl),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.w, right: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 2.h,
                ),
                Wrap(
                  children: [
                    Text(
                      '$movieName ',
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      movieDate,
                      style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey),
                    ),
                  ],
                ),
                Wrap(
                  children: [
                    Text(
                      'Review by ',
                      style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                    Text(
                      userName,
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    Icon(
                      Icons.star_half_rounded,
                      color: Theme.of(context).colorScheme.primary,
                      size: 12.sp,
                    ),
                  ],
                ),
                SizedBox(
                  height: 6.h,
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 5.h),
                  width: 226.w,
                  child: ReadMoreText(
                    review,
                    trimLength: 120,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Show less',
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              ],
            ),
          ),
          const Spacer(),
          ClipRRect(
            borderRadius: BorderRadius.circular(7.r),
            child: Image.network(
              width: 57.w,
              height: 93.h,
              movieImageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
