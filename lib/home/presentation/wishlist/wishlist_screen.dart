import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_coding_challenge/app/application/root/root_cubit.dart';
import 'package:mobile_coding_challenge/app/presentation/theme/colors.dart';
import 'package:mobile_coding_challenge/app/presentation/theme/dimens.dart';
import 'package:mobile_coding_challenge/app/presentation/theme/typography.dart';
import 'package:mobile_coding_challenge/app/presentation/utils/translation_extention.dart';
import 'package:mobile_coding_challenge/app/presentation/widgets/app_list_tile_movies.dart';
import 'package:mobile_coding_challenge/home/presentation/details/details_screen.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RootCubit, RootState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: yellow,
            title: Text(
              'home.tabbar.wishlist'.tr(context),
              style: TypographyStyle.questrialSemiBold18.white,
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.delete_rounded, color: white),
                onPressed: () {
                  context.read<RootCubit>().clearWishlist();
                },
              ),
            ],
          ),

          body: SafeArea(
            child:
                state.wishlist.isEmpty
                    ? Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: size20),
                        child: Text(
                          'home.wishlist.empty_state'.tr(context),
                          style: TypographyStyle.questrialSemiBold18,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                    : ListView.builder(
                      itemCount: state.wishlist.length,
                      itemBuilder: (context, index) {
                        final movie = state.wishlist[index];
                        return AppListTileMovies(
                          onTap:
                              () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => DetailsScreen(movie: movie),
                                ),
                              ),
                          urlImage:
                              context.read<RootCubit>().urlImage +
                              (movie.posterPath ?? ''),
                          title: movie.title ?? '',
                          subtitle: movie.overview ?? '',
                        );
                      },
                    ),
          ),
        );
      },
    );
  }
}
