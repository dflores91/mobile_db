import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mobile_coding_challenge/app/application/root/root_cubit.dart';
import 'package:mobile_coding_challenge/app/domain/movies/entities/movies_response.dart';
import 'package:mobile_coding_challenge/app/presentation/theme/colors.dart';
import 'package:mobile_coding_challenge/app/presentation/theme/dimens.dart';
import 'package:mobile_coding_challenge/app/presentation/theme/typography.dart';
import 'package:mobile_coding_challenge/app/presentation/utils/translation_extention.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({required this.movie, super.key});

  final MovieDetail movie;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool isFavorite = false;
  @override
  void initState() {
    super.initState();
    isFavorite = context.read<RootCubit>().isFavoriteMovie(widget.movie);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RootCubit, RootState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: yellow,
            title: Text(
              widget.movie.title ?? 'home.start.details'.tr(context),
              style: TypographyStyle.questrialSemiBold18.white,
            ),
            iconTheme: IconThemeData(color: white),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size20),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(size40),
                    child: Image.network(
                      '${context.read<RootCubit>().urlImage}${widget.movie.posterPath}',
                      fit: BoxFit.cover,
                      height: 300,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(size20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.movie.title ?? '',
                            style: TypographyStyle.questrialSemiBold18.black,
                          ),
                          IconButton(
                            onPressed:
                                !isFavorite
                                    ? () {
                                      context.read<RootCubit>().addToWishlist(
                                        widget.movie,
                                      );
                                      setState(() {
                                        isFavorite = true;
                                      });
                                    }
                                    : () {
                                      context
                                          .read<RootCubit>()
                                          .removeFromWishlist(widget.movie);
                                      setState(() {
                                        isFavorite = false;
                                      });
                                    },
                            icon: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Colors.yellow[700],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size20),
                      Wrap(
                        runSpacing: size5,
                        verticalDirection: VerticalDirection.down,
                        children:
                            state.genres.map((genre) {
                              return widget.movie.genreIds?.contains(
                                        genre?.id,
                                      ) ??
                                      false
                                  ? Container(
                                    margin: EdgeInsets.only(right: size5),
                                    decoration: BoxDecoration(
                                      color: yellow,
                                      borderRadius: BorderRadius.circular(
                                        size10,
                                      ),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: size10,
                                      vertical: size5,
                                    ),
                                    child: Text(
                                      genre?.name ?? '',
                                      style:
                                          TypographyStyle
                                              .questrialSemiBold14
                                              .white,
                                    ),
                                  )
                                  : SizedBox.shrink();
                            }).toList(),
                      ),
                      SizedBox(height: size20),
                      widget.movie.overview != null &&
                              widget.movie.overview != ''
                          ? Text(
                            widget.movie.overview ??
                                'home.details.no_info'.tr(context),
                            style: TypographyStyle.questrialRegular14.black,
                          )
                          : Text(
                            'home.details.no_info'.tr(context),
                            style: TypographyStyle.questrialRegular14.black,
                          ),
                      SizedBox(height: size20),
                      Text(
                        'home.details.release_date'.tr(
                          context,
                          translationParams: {
                            'date': parseDate(
                              widget.movie.releaseDate ?? DateTime.now(),
                            ),
                          },
                        ),
                        style: TypographyStyle.questrialSemiBold14.black,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String parseDate(DateTime? date) {
    final format = DateFormat('dd/MM/yyyy');
    return format.format(date ?? DateTime.now());
  }
}
