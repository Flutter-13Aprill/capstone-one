import 'package:aleef/screens/ask_aleef_screen.dart';
import 'package:aleef/screens/paw_gallary_screen.dart';
import 'package:flutter/material.dart';

class CommunityScreen extends StatelessWidget {
  /// CommunityScreen provides a tabbed interface to switch between
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.group), text: 'Paw Gallary'),
              Tab(icon: Icon(Icons.live_help), text: 'Ask Aleef'),
            ],
          ),
        ),
        body: const TabBarView(
          // Each tab shows a different screen widget
          children: <Widget>[PawGallaryScreen(), AskAleefScreen()],
        ),
      ),
    );
  }
}
