import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:racing/src/constants/appColors.dart';
import 'package:racing/src/provider/user.dart';
import 'package:racing/src/ui/cleanPage.dart';
import 'package:racing/src/ui/homePage.dart';
import 'package:racing/src/ui/quizStart.dart';
import 'package:racing/src/widgets/base/appBar.dart';
import 'package:racing/src/widgets/base/sideDrawer.dart';

class BaseScreen extends StatefulWidget {
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  Color _playIconColor = AppColors.white;
  bool _scrollTab = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(_activeTabIndex);
  }

  void _activeTabIndex() {
    setState(() {
      _tabController.index == 2
          ? _playIconColor = AppColors.black
          : _playIconColor = AppColors.white;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<UserService>(context);
    if (_user.getCurrentUser() == null) {
      _user.login();
      return CleanPageScreen();
    }

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: DefaultTabController(
          length: 5,
          child: Scaffold(
            appBar: buildDefaultAppBar(context),
            drawer: buildSideDrawer(context),
            body: TabBarView(
              physics:
                  _scrollTab ? ScrollPhysics() : NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: <Widget>[
                HomePage(),
                HomePage(),
                QuizStartScreen(),
                HomePage(),
                HomePage(),
              ],
            ),
            bottomNavigationBar: _buildTabBar(),
          ),
        ),
        floatingActionButton: _playButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  Widget _playButton() {
    return SizedBox(
      height: 90.0,
      width: 90.0,
      child: FloatingActionButton(
        onPressed: () {
          _tabController.animateTo(2);
        },
        backgroundColor: AppColors.transparent,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            FlareActor(
              'assets/flare/play.flr',
              alignment: Alignment.center,
              animation: 'stand_by',
            ),
            Image(
              image: AssetImage('assets/images/control.png'),
              height: 32.0,
              color: _playIconColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      controller: _tabController,
      tabs: <Widget>[
        Tab(
          icon: Icon(
            Icons.home,
          ),
        ),
        Tab(
          icon: Icon(
            Icons.mail,
          ),
        ),
        Tab(
          child: Container(),
        ),
        Tab(
          icon: Icon(
            Icons.search,
          ),
        ),
        Tab(
          icon: Icon(
            Icons.settings,
          ),
        ),
      ],
    );
  }
}
