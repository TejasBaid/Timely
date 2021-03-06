import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:timely/screens/signup.dart';
import 'package:timely/utilities/constants.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'home_tab.dart';
import 'signup.dart';
import 'project_tab.dart';
import 'project_sheet.dart';
import 'package:timely/global_variables.dart';

class HomeScreen extends StatefulWidget{
  static String id = "home_screen";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{
  FirebaseAuth _auth = FirebaseAuth.instance;
  TabController _tabController;
  int _tabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  void _toggleTab() {
    _tabIndex = _tabController.index + 1;
    _tabController.animateTo(_tabIndex);
  }
  void _toggleTabB() {
    _tabIndex = _tabController.index -1 ;
    _tabController.animateTo(_tabIndex);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          margin: EdgeInsets.only(left: 30),
          child: FloatingActionButton(
            onPressed: (){
              if(_tabController.index == 0){
                _toggleTab();
              }else if(_tabController.index == 2){
                _toggleTabB();
              }
              showModalBottomSheet(context: context,
                  builder: (context)=> AddProject()
              );

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
      body: NestedScrollView(
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

                        controller: _tabController,
                            labelColor: Colors.white,
                            unselectedLabelColor: Colors.grey,
                            indicatorSize: TabBarIndicatorSize.tab,
                            indicator: new BubbleTabIndicator(
                            indicatorHeight: 40.0,
                            indicatorColor: Colors.blueAccent,
                            tabBarIndicatorSize: TabBarIndicatorSize.tab,
                            ),
                            tabs: [
                            Text("Home",style: TextStyle(
                              fontWeight: FontWeight.w600
                            ),),
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
              child:  new TabBarView(
                controller: _tabController,
                  children: <Widget>[
                HomeTab(),
                ProjectTab(changeTab: _tabController,),
                Text("Hello World"),
              ])
          )

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

