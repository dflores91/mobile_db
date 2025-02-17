import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_coding_challenge/app/application/root/root_cubit.dart';
import 'package:mobile_coding_challenge/app/domain/movies/entities/movies_response.dart';
import 'package:mobile_coding_challenge/app/presentation/theme/colors.dart';
import 'package:mobile_coding_challenge/app/presentation/theme/dimens.dart';
import 'package:mobile_coding_challenge/app/presentation/theme/typography.dart';
import 'package:mobile_coding_challenge/app/presentation/utils/translation_extention.dart';
import 'package:mobile_coding_challenge/app/presentation/widgets/app_button.dart';
import 'package:mobile_coding_challenge/home/presentation/details/details_screen.dart';

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({super.key, required this.carouselImages});

  final List<String> carouselImages;

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    _pageController.addListener(_onPageChanged);
    _startAutoPlay();
  }

  @override
  void dispose() {
    _pageController.removeListener(_onPageChanged);
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged() {
    final newPage = _pageController.page?.round() ?? 0;
    if (newPage != _currentPage) {
      setState(() {
        _currentPage = newPage;
      });
    }
  }

  void _startAutoPlay() {
    Future.delayed(Duration(seconds: 5), () {
      if (_pageController.hasClients) {
        _currentPage = (_currentPage + 1) % widget.carouselImages.length;
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(seconds: 1),
          curve: Curves.easeInOut,
        );
        _startAutoPlay();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RootCubit, RootState>(
      builder: (context, state) {
        return Stack(
          children: [
            SizedBox(
              height: 500,
              child: PageView.builder(
                controller: _pageController,
                itemCount: widget.carouselImages.length,
                itemBuilder:
                    (context, index) => Image.network(
                      widget.carouselImages[index],
                      fit: BoxFit.cover,
                      width: double.infinity,
                      errorBuilder:
                          (context, error, stackTrace) =>
                              Text(error.toString()),
                    ),
              ),
            ),
            Positioned.fill(
              child: Container(
                alignment: Alignment.bottomCenter,
                height: 500,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.white],
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AppButton(
                      color: yellow,
                      child: Row(
                        children: [
                          context.read<RootCubit>().isFavoriteMovie(
                                state.movies[_currentPage] ?? MovieDetail(),
                              )
                              ? Icon(Icons.favorite_rounded, color: white)
                              : Icon(
                                Icons.favorite_border_rounded,
                                color: white,
                              ),
                          SizedBox(width: size8),
                          Text(
                            'home.tabbar.wishlist'.tr(context),
                            style: TypographyStyle.questrialSemiBold14.white,
                          ),
                        ],
                      ),
                      onPressed:
                          context.read<RootCubit>().isFavoriteMovie(
                                state.movies[_currentPage] ?? MovieDetail(),
                              )
                              ? () {
                                context.read<RootCubit>().removeFromWishlist(
                                  state.movies[_currentPage] ?? MovieDetail(),
                                );
                              }
                              : () {
                                context.read<RootCubit>().addToWishlist(
                                  state.movies[_currentPage] ?? MovieDetail(),
                                );
                              },
                    ),
                    AppButton(
                      color: black,
                      child: Text(
                        'home.start.details'.tr(context),
                        style: TypographyStyle.questrialSemiBold14.white,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => DetailsScreen(
                                  movie:
                                      state.movies[_currentPage] ??
                                      MovieDetail(),
                                ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
