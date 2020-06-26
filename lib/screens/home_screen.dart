import 'package:flutter/material.dart';
import 'package:timely/utilities/constants.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'home_tab.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  elevation: 0,
                  backgroundColor: Colors.white,
                  expandedHeight: 250.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(

                    background: Container(
                      padding: EdgeInsets.only(top: 50,left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.menu,
                            color: Colors.black.withOpacity(0.7),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height *0.04,
                          ),
                          Text(
                            "Hi Tejas!",
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontWeight: FontWeight.w600
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height *0.01,
                          ),
                          Text(
                            "Good Morning",
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                            ),
                          ),

                          SizedBox(
                            height: MediaQuery.of(context).size.height *0.01,
                          ),
                          Text(
                            "26 June 2020",
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ],
                      ),
                    ),
                      centerTitle: true,
                      ),
                  bottom: PreferredSize(
                    preferredSize: Size(30,30),
                      child: Container(
                        height: 50,
                        width: 350,
                        margin: EdgeInsets.only(bottom: 10),
                        child: TabBar(
                              labelColor: Colors.white,
                              unselectedLabelColor: Colors.grey,
                              indicatorSize: TabBarIndicatorSize.tab,
                              indicator: new BubbleTabIndicator(
                              indicatorHeight: 40.0,
                              indicatorColor: Colors.blueAccent,
                              tabBarIndicatorSize: TabBarIndicatorSize.tab,
                              ),
                              tabs: [
                              Text("Home"),
                              Tab(text: "Projects"),
                              Tab(text: "Insights",)
                              ],

                              ),
                      ),
                      ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      )
                    ),
                ),


              ];
            },
            body: new Container(
                padding: new EdgeInsets.all(10.0),
                child:  new TabBarView(children: <Widget>[
                  HomeTab(),
                  Text("Hello World"),
                  Text("Hello World"),

                ])
            )

        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      color: Colors.white,
      child:_tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

