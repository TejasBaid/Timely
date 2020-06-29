import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:timely/screens/signup.dart';
import 'package:timely/utilities/constants.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'home_tab.dart';
import 'signup.dart';
import 'project_tab.dart';


class HomeScreen extends StatefulWidget {
  static String id = "home_screen";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Widget buildBottomSheet(BuildContext context){
    return Container(
      color: Color(0xff696C74),
      height: MediaQuery.of(context).size.height *0.5,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40),
            topLeft: Radius.circular(40),
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height*0.03,),
            CustomHeader2(text:'Create a new project'),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          margin: EdgeInsets.only(left: 30),
          child: FloatingActionButton(
            onPressed: (){
              showModalBottomSheet(context: context, builder: buildBottomSheet);
            },
            backgroundColor: Colors.blueAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40)
            ),
            child:Icon(
              Icons.add,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ),
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
                      padding: EdgeInsets.only(top: 50,left: 30,right: 20 ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Icon(
                                Icons.menu,
                                color: Colors.black.withOpacity(0.7),
                              ),
                              GestureDetector(
                                onTap: (){
                                  _auth.signOut();
                                  Navigator.pushNamed(context, SignupPage.id);
                                },
                                child: Icon(
                                  Icons.exit_to_app,
                                  color: Colors.black.withOpacity(0.7),
                                ),
                              ),
                            ],
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
                            height: MediaQuery.of(context).size.height *0.02,
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
                        width: 320,
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
                  ProjectTab(),
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
class CustomHeader2 extends StatelessWidget {
  const CustomHeader2({
    Key key,
    this.text
  }) : super(key: key);
  final text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          width: 30,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10,left: 5),
          height: 10,
          width: 10,
          decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(60)),
        ),
      ],
    );
  }
}

