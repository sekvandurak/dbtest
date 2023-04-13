import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/comment.dart';
import '../widgets/movie.dart';
import '../widgets/info.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://cdn.pixabay.com/photo/2014/12/08/11/49/couple-560783__340.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SafeArea(
              child: Column(
                children: [
                  SizedBox(height: 80.h),
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        "https://media.licdn.com/dms/image/D4D03AQHvHYssIe5hpw/profile-displayphoto-shrink_800_800/0/1669726460288?e=1686182400&v=beta&t=5vwhoi1xm9C6XphUmIQ8oHXkZWSYLy5ZGwiUhzQQvZU"),
                  ),
                  SizedBox(height: 16.h),
                  const Text(
                    "Selim",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // followers and following in a row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Followers: 100",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                        ),
                      ),
                      SizedBox(width: 25.w),
                      Text(
                        "Following: 100",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InfoWidget(info: 'Total Films', number: 455),
                      InfoWidget(info: 'Film This Year', number: 33),
                      InfoWidget(info: 'Lists', number: 4),
                      InfoWidget(info: "Reviews", number: 30),
                    ],
                  ),
                  SizedBox(height: 16),
                  // add Selim's favorite movies as card in row
                  Column(
                    children: [
                      Text("Selim's Favorite Movies"),
                      Row(
                        children: [
                          const MovieWidget(
                              movieImageUrl:
                                  "https://upload.wikimedia.org/wikipedia/en/thumb/e/e1/Joker_%282019_film%29_poster.jpg/220px-Joker_%282019_film%29_poster.jpg"),
                          const MovieWidget(
                              movieImageUrl:
                                  "https://upload.wikimedia.org/wikipedia/en/thumb/e/e1/Joker_%282019_film%29_poster.jpg/220px-Joker_%282019_film%29_poster.jpg"),
                          const MovieWidget(
                              movieImageUrl:
                                  "https://upload.wikimedia.org/wikipedia/en/thumb/e/e1/Joker_%282019_film%29_poster.jpg/220px-Joker_%282019_film%29_poster.jpg"),
                        ],
                      ),
                    ],
                  ),
                  // add Selim's recent watched movies as card in row 5 ofthem in a row with imdb rating

                  Column(
                    children: [
                      Text("Selim's Recent Watched Movies"),
                      Row(
                        children: [
                          const MovieWidget(
                              movieImageUrl:
                                  "https://upload.wikimedia.org/wikipedia/en/thumb/e/e1/Joker_%282019_film%29_poster.jpg/220px-Joker_%282019_film%29_poster.jpg"),
                          const MovieWidget(
                              movieImageUrl:
                                  "https://upload.wikimedia.org/wikipedia/en/thumb/e/e1/Joker_%282019_film%29_poster.jpg/220px-Joker_%282019_film%29_poster.jpg"),
                          const MovieWidget(
                              movieImageUrl:
                                  "https://upload.wikimedia.org/wikipedia/en/thumb/e/e1/Joker_%282019_film%29_poster.jpg/220px-Joker_%282019_film%29_poster.jpg"),
                          const MovieWidget(
                              movieImageUrl:
                                  "https://upload.wikimedia.org/wikipedia/en/thumb/e/e1/Joker_%282019_film%29_poster.jpg/220px-Joker_%282019_film%29_poster.jpg"),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  // add Selim's recent comments in a listview about movies with imdb rating and his comment
                  SizedBox(height: 18.h),
                  const CommentWidget(
                      review: 'Deneme',
                      movieDate: '12.12.2021',
                      movieImageUrl:
                          'https://media.licdn.com/dms/image/D4D03AQHvHYssIe5hpw/profile-displayphoto-shrink_400_400/0/1669726460288?e=1685577600&v=beta&t=1OVtQrz8lvlUvwswCRMStQSHQ38nInrqJEeNYlcqyck',
                      movieName: 'Deneme',
                      userAvatarUrl:
                          'https://media.licdn.com/dms/image/D4D03AQHvHYssIe5hpw/profile-displayphoto-shrink_400_400/0/1669726460288?e=1685577600&v=beta&t=1OVtQrz8lvlUvwswCRMStQSHQ38nInrqJEeNYlcqyck',
                      userName: 'Selim Berat'),
                  SizedBox(height: 16.h),
                  const CommentWidget(
                      review: 'Deneme',
                      movieDate: '12.12.2021',
                      movieImageUrl:
                          'https://media.licdn.com/dms/image/D4D03AQHvHYssIe5hpw/profile-displayphoto-shrink_400_400/0/1669726460288?e=1685577600&v=beta&t=1OVtQrz8lvlUvwswCRMStQSHQ38nInrqJEeNYlcqyck',
                      movieName: 'Deneme',
                      userAvatarUrl:
                          'https://media.licdn.com/dms/image/D4D03AQHvHYssIe5hpw/profile-displayphoto-shrink_400_400/0/1669726460288?e=1685577600&v=beta&t=1OVtQrz8lvlUvwswCRMStQSHQ38nInrqJEeNYlcqyck',
                      userName: 'Selim Berat'),
                  SizedBox(height: 16.h),
                  const CommentWidget(
                      review: 'Deneme',
                      movieDate: '12.12.2021',
                      movieImageUrl:
                          'https://media.licdn.com/dms/image/D4D03AQHvHYssIe5hpw/profile-displayphoto-shrink_400_400/0/1669726460288?e=1685577600&v=beta&t=1OVtQrz8lvlUvwswCRMStQSHQ38nInrqJEeNYlcqyck',
                      movieName: 'Deneme',
                      userAvatarUrl:
                          'https://media.licdn.com/dms/image/D4D03AQHvHYssIe5hpw/profile-displayphoto-shrink_400_400/0/1669726460288?e=1685577600&v=beta&t=1OVtQrz8lvlUvwswCRMStQSHQ38nInrqJEeNYlcqyck',
                      userName: 'Selim Berat'),
                  SizedBox(height: 16.h),
                  const CommentWidget(
                      review: 'Deneme',
                      movieDate: '12.12.2021',
                      movieImageUrl:
                          'https://media.licdn.com/dms/image/D4D03AQHvHYssIe5hpw/profile-displayphoto-shrink_400_400/0/1669726460288?e=1685577600&v=beta&t=1OVtQrz8lvlUvwswCRMStQSHQ38nInrqJEeNYlcqyck',
                      movieName: 'Deneme',
                      userAvatarUrl:
                          'https://media.licdn.com/dms/image/D4D03AQHvHYssIe5hpw/profile-displayphoto-shrink_400_400/0/1669726460288?e=1685577600&v=beta&t=1OVtQrz8lvlUvwswCRMStQSHQ38nInrqJEeNYlcqyck',
                      userName: 'Selim Berat'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
