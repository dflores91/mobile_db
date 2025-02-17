import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_coding_challenge/app/application/root/root_cubit.dart';
import 'package:mobile_coding_challenge/app/presentation/theme/colors.dart';
import 'package:mobile_coding_challenge/app/presentation/theme/dimens.dart';
import 'package:mobile_coding_challenge/app/presentation/theme/typography.dart';
import 'package:mobile_coding_challenge/app/presentation/utils/translation_extention.dart';
import 'package:mobile_coding_challenge/app/presentation/widgets/app_button.dart';
import 'package:mobile_coding_challenge/home/presentation/search/search_screen.dart';
import 'package:mobile_coding_challenge/home/presentation/start/start_screen.dart';
import 'package:mobile_coding_challenge/home/presentation/wishlist/wishlist_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RootCubit, RootState>(
      listenWhen:
          (previous, current) =>
              previous.showErrorMessage != current.showErrorMessage,
      listener: (context, state) {
        if (state.showErrorMessage) {
          _showErrorMessage(context, state.errorMessage);
        }
      },
      child: Scaffold(
        bottomNavigationBar: TabBar(
          padding: EdgeInsets.symmetric(vertical: 20),
          indicatorColor: Colors.transparent,
          labelColor: yellow,
          controller: _tabController,
          tabs: [
            Tab(
              icon: Icon(Icons.home_rounded),
              text: 'home.tabbar.home'.tr(context),
            ),
            Tab(
              icon: Icon(Icons.search_rounded),
              text: 'home.tabbar.search'.tr(context),
            ),
            Tab(
              icon: Icon(Icons.bookmark_rounded),
              text: 'home.tabbar.wishlist'.tr(context),
            ),
          ],
        ),
        body: TabBarView(
          controller: _tabController,
          physics: NeverScrollableScrollPhysics(),
          children: [StartScreen(), SearchScreen(), WishlistScreen()],
        ),
      ),
    );
  }

  void _showErrorMessage(BuildContext context, String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (context) => AlertDialog(
            title: Text(
              'errors.title'.tr(context),
              style: TypographyStyle.questrialSemiBold16,
            ),
            content: Text(message, style: TypographyStyle.questrialRegular14),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppButton(
                    minumumSize: Size(80, 45),
                    color: black,
                    child: Text(
                      'home.tabbar.logout'.tr(context),
                      style: TypographyStyle.questrialSemiBold14.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      if (Platform.isAndroid) {
                        SystemChannels.platform.invokeMethod(
                          'SystemNavigator.pop',
                        );
                      } else if (Platform.isIOS) {
                        exit(0);
                      }
                    },
                  ),
                  SizedBox(width: size16),
                  AppButton(
                    minumumSize: Size(80, 45),
                    color: yellow,
                    child: Text(
                      'home.tabbar.retry'.tr(context),
                      style: TypographyStyle.questrialSemiBold14.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      context.read<RootCubit>()
                        ..clearErrorMessage()
                        ..retry();
                    },
                  ),
                ],
              ),
            ],
          ),
    );
  }
}
