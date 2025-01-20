import 'package:flutter/material.dart';

class TabBarTile extends StatelessWidget {
  const TabBarTile({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBar(
      textScaler: TextScaler.linear(1.1),
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey,
      indicatorColor: Colors.black,
      indicatorSize: TabBarIndicatorSize.label,
      tabs: [
        Tab(text: 'Descrição', height: 30),
        Tab(text: 'Categoria', height: 30),
        Tab(text: 'Dimensões', height: 30),
      ],
    );
  }
}
