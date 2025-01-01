import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBar(
      tabs: <Widget>[
        Tab(
          text: 'Top Rated',
        ),
        Tab(
          text: 'Now Playing',
        ),
        Tab(
          text: 'Upcoming',
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(48.0);
}
