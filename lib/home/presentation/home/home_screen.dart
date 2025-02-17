import 'package:flutter/material.dart';
import 'package:mobile_coding_challenge/app/presentation/theme/colors.dart';
import 'package:mobile_coding_challenge/app/presentation/utils/translation_extention.dart';
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
    return Scaffold(
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
    );
  }
}
