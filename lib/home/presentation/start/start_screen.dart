import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_coding_challenge/app/application/root/root_cubit.dart';
import 'package:mobile_coding_challenge/app/presentation/theme/dimens.dart';
import 'package:mobile_coding_challenge/app/presentation/utils/translation_extention.dart';
import 'package:mobile_coding_challenge/app/presentation/widgets/app_images_list.dart';
import 'package:mobile_coding_challenge/app/presentation/widgets/app_shimmer.dart';
import 'package:mobile_coding_challenge/home/presentation/start/widget/images_carousel.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RootCubit, RootState>(
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                state.carouselImages.isEmpty
                    ? AppShimmer(
                      child: Container(
                        width: double.infinity,
                        height: 500,
                        decoration: BoxDecoration(color: Colors.grey[300]),
                      ),
                    )
                    : ImageCarousel(carouselImages: state.carouselImages),
                SizedBox(height: size20),
                AppImagesList(
                  movies: state.movies,
                  urlImage: context.read<RootCubit>().urlImage,
                  title: 'home.start.discover'.tr(context),
                ),
                SizedBox(height: size20),
                AppImagesList(
                  movies: state.nowPlayMovies,
                  urlImage: context.read<RootCubit>().urlImage,
                  title: 'home.start.now_play'.tr(context),
                ),
                SizedBox(height: size20),
                AppImagesList(
                  movies: state.popularMovies,
                  urlImage: context.read<RootCubit>().urlImage,
                  title: 'home.start.popular'.tr(context),
                ),
                SizedBox(height: size20),
                AppImagesList(
                  movies: state.topRatedMovies,
                  urlImage: context.read<RootCubit>().urlImage,
                  title: 'home.start.top_rated'.tr(context),
                ),
                SizedBox(height: size20),
                AppImagesList(
                  movies: state.upcomingMovies,
                  urlImage: context.read<RootCubit>().urlImage,
                  title: 'home.start.upcoming'.tr(context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
