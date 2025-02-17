import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_coding_challenge/app/application/root/root_cubit.dart';
import 'package:mobile_coding_challenge/app/domain/movies/entities/movies_response.dart';
import 'package:mobile_coding_challenge/app/presentation/theme/dimens.dart';
import 'package:mobile_coding_challenge/app/presentation/theme/typography.dart';
import 'package:mobile_coding_challenge/app/presentation/utils/translation_extention.dart';
import 'package:mobile_coding_challenge/app/presentation/widgets/app_list_tile_movies.dart';
import 'package:mobile_coding_challenge/home/presentation/details/details_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      context.read<RootCubit>().searchMoviesNextPage(_searchController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RootCubit, RootState>(
      builder: (context, state) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size20),
            child: Scaffold(
              appBar: PreferredSize(
                preferredSize: Size(double.infinity, 100),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'home.search.search_hint'.tr(context),
                    hintStyle: TypographyStyle.questrialRegular18,
                    prefixIcon: Icon(Icons.search_rounded),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.close_rounded),
                      onPressed: () {
                        _searchController.clear();
                        context.read<RootCubit>().clearSearch();
                      },
                    ),
                  ),
                  onChanged:
                      (value) => context.read<RootCubit>().searchMovies(value),
                ),
              ),
              body:
                  state.searchMovies.isNotEmpty
                      ? Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              controller: _scrollController,
                              itemCount: state.searchMovies.length,
                              itemBuilder: (context, index) {
                                final movie = state.searchMovies[index];
                                return AppListTileMovies(
                                  onTap:
                                      () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (context) => DetailsScreen(
                                                movie: movie ?? MovieDetail(),
                                              ),
                                        ),
                                      ),
                                  urlImage:
                                      context.read<RootCubit>().urlImage +
                                      (movie?.posterPath ?? ''),

                                  title: movie?.title ?? '',
                                  subtitle: movie?.overview ?? '',
                                );
                              },
                            ),
                          ),
                        ],
                      )
                      : Center(
                        child: Text(
                          'home.search.empty_state'.tr(context),
                          style: TypographyStyle.questrialSemiBold18,
                        ),
                      ),
            ),
          ),
        );
      },
    );
  }
}
