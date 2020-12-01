import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sisumakerv2/src/bloc/home/home_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: MultiBlocProvider(providers: [
          BlocProvider<HomeMenuBloc>(
            create: (context) => HomeMenuBloc(),
          ),
          BlocProvider<HomeNewsBloc>(
            create: (context) => HomeNewsBloc(),
          ),
        ], child: _Home()),
      ),
    );
  }
}

class _Home extends StatefulWidget {
  @override
  __HomeState createState() => __HomeState();
}

class __HomeState extends State<_Home> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            matchTextDirection: true,
            image: NetworkImage(
                "https://image.freepik.com/free-vector/abstract-blue-polygonal-vector-background_1365-90.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            _WidgetMenu(),
            _WidgetNews(),
          ],
        ),
      ),
    );
  }
}

class _WidgetMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeMenuBloc, HomeState>(
      cubit: BlocProvider.of<HomeMenuBloc>(context)..add(FetchMenu()),
      builder: (context, state) {
        if (state is HomeLoading) {
          return GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(
              9,
              (int index) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey[400],
                  highlightColor: Colors.grey[350],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        maxRadius: 20.0,
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Container(
                        height: 10.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.0),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          );
        } else if (state is HomeLoaded) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            verticalDirection: VerticalDirection.down,
            children: [
              Container(
                margin: EdgeInsets.only(top: 20.0),
                child: Card(
                  child: ListTile(
                    // padding: const EdgeInsets.all(16.0),
                    leading: Image.network(
                      'http://sakila.tangerangselatankota.go.id/assets/images/favicon.png',
                    ),
                    title: Text(
                      "HY Admin",
                      style: TextStyle(
                          fontSize: 14.6, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('KOTA TANGERANG SELATAN',
                        style: TextStyle(
                            fontSize: 14.6, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 60.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.count(
                    crossAxisCount: 4,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: List.generate(
                      state.homeModel.menu.length,
                      (int i) {
                        final routemod = state.homeModel.menu[i].route;
                        return Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () => {
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                '/${routemod}',
                                (route) => false,
                              ),
                            },
                            child: Card(
                              child: Container(
                                child: Center(
                                  child: Image.asset(
                                    'lib/assets/icon/' +
                                        state.homeModel.menu[i].icon,
                                    filterQuality: FilterQuality.high,
                                    width: double.infinity,
                                    height: double.infinity,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}

class _WidgetNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PageController _pageController;
    ScrollController _scrollController;
    return BlocBuilder<HomeNewsBloc, HomeState>(
      cubit: BlocProvider.of<HomeNewsBloc>(context)..add(FetchNews()),
      builder: (context, state) {
        if (state is HomeLoaded) {
          return Container(
            height: MediaQuery.of(context).size.height / 3,
            margin: EdgeInsets.all(20.0),
            child: PageView(
              controller: _pageController,
              children: <Widget>[
                ListView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: _scrollController,
                  itemCount: 5,
                  itemBuilder: (context, int i) {
                    return Container(
                      width: MediaQuery.of(context).size.width / 1.10,
                      child: Card(
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {},
                            child: Column(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    topRight: Radius.circular(10.0),
                                  ),
                                  child: Image.asset(
                                    'lib/assets/icon/icon_2.png',
                                    filterQuality: FilterQuality.high,
                                    width: 160,
                                    height: 160,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.all(10.0),
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        'Ex title',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        'Ex : subtitle',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
