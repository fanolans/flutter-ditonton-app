import 'package:about/about_page.dart';
import 'package:core/presentation/pages/search_page.dart';
import 'package:core/presentation/pages/watchlist_page.dart';
import 'package:core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:movies/presentation/pages/home_movie_page.dart';
import 'package:tv_series/presentation/pages/home_tvseries_page.dart';

class HomePage extends StatefulWidget {
  static const ROUTE_NAME = '/homePage';
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomeMoviePageState createState() => _HomeMoviePageState();
}

class _HomeMoviePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              const UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/circle-g.png'),
                ),
                accountName: Text('Ditonton'),
                accountEmail: Text('ditonton@dicoding.com'),
              ),
              ListTile(
                leading: const Icon(Icons.save_alt),
                title: const Text('My Watchlist'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, WatchlistPage.ROUTE_NAME);
                },
              ),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, AboutPage.ROUTE_NAME);
                },
                leading: const Icon(Icons.info_outline),
                title: const Text('About'),
              ),
            ],
          ),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                title: const Text('Ditonton'),
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, SearchPage.ROUTE_NAME);
                    },
                    icon: const Icon(Icons.search),
                  )
                ],
                pinned: true,
                floating: true,
                bottom: TabBar(
                  indicatorColor: kMikadoYellow,
                  tabs: [
                    _buildTabBarItem('Movies', Icons.movie),
                    _buildTabBarItem('TV Series', Icons.tv),
                  ],
                ),
              ),
            ];
          },
          body: const TabBarView(
            children: <Widget>[
              HomeMoviePage(),
              HomeTvSeriesPage(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabBarItem(String title, IconData iconData) => Padding(
        padding: const EdgeInsets.only(top: 4.0, bottom: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(iconData),
            const SizedBox(
              width: 12.0,
            ),
            Text(title),
          ],
        ),
      );
}
