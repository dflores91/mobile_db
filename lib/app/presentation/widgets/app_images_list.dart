import 'package:flutter/material.dart';
import 'package:mobile_coding_challenge/app/domain/movies/entities/movies_response.dart';
import 'package:mobile_coding_challenge/app/presentation/theme/dimens.dart';
import 'package:mobile_coding_challenge/app/presentation/theme/typography.dart';
import 'package:mobile_coding_challenge/home/presentation/details/details_screen.dart';

class AppImagesList extends StatelessWidget {
  const AppImagesList({
    required this.movies,
    required this.urlImage,
    required this.title,
    super.key,
  });

  final List<MovieDetail?> movies;
  final String urlImage;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size20),
          child: Text(
            title,
            style: TypographyStyle.questrialSemiBold16.black,
            textAlign: TextAlign.left,
          ),
        ),
        SizedBox(height: size10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size20),
          child: SizedBox(
            height: 150,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return Stack(
                  children: [
                    GestureDetector(
                      onTap:
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsScreen(movie: movie),
                            ),
                          ),
                      child: Container(
                        width: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(size12),
                          child: Image.network(
                            urlImage + (movie!.posterPath ?? ''),
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) => SizedBox(width: 10),
            ),
          ),
        ),
      ],
    );
  }
}
