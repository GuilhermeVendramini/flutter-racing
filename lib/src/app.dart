import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:racing/src/provider/user.dart';
import 'package:racing/src/ui/basePages.dart';

import 'constants/appTheme.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserService>(builder: (_) => UserService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TUDOSOBREPEÇAS RACING',
        theme: themeData,
        home: BaseScreen(),
      ),
    );
  }
}
