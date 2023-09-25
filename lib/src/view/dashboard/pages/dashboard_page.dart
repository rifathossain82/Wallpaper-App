import 'package:flutter/material.dart';
import 'package:wallpaper_app/src/core/utils/app_constants.dart';
import 'package:wallpaper_app/src/core/utils/color.dart';
import 'package:wallpaper_app/src/view/home/pages/homepage.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> with SingleTickerProviderStateMixin{

  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(
      length: 3,
      initialIndex: 0,
      vsync: this,
    );
    super.initState();
  }

  List<Tab> tabs = const[
    Tab(child: Text('HOME')),
    Tab(child: Text('CATEGORIES')),
    Tab(child: Text('PREMIUM')),
  ];

  List<Widget> pages = [
    const Homepage(),
    Container(),
    Container(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, value){
          return [
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverSafeArea(
                top: false,
                sliver: SliverAppBar(
                  title: const Text(AppConstants.appName),
                  actions: [
                    IconButton(
                        onPressed: (){},
                        icon: const Icon(Icons.search)
                    ),
                  ],
                  bottom: TabBar(
                    controller: tabController,
                    indicatorColor: kWhite,
                    indicatorWeight: 3,
                    tabs: tabs,
                  ),
                  pinned: true,
                  floating: true,
                  snap: true,
                  forceElevated: true,
                ),
              ),
            )
          ];
        },
        body: TabBarView(
          controller: tabController,
          children: pages,
        ),
      ),
    );
  }

}