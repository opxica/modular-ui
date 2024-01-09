import 'package:example/components/cards.dart';
import 'package:example/components/empty.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: components.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Map> components = [
    {
      'name': 'Button',
      'route': card(), // TODO: Updated button() to card()
    },
    {
      'name': 'Card',
      'route': card(),
    },
    {
      'name': 'Checkbox',
      'route': empty(),
    },
    {
      'name': 'Chip',
      'route': empty(),
    },
    {
      'name': 'Dialog',
      'route': empty(),
    },
    {
      'name': 'Drawer',
      'route': empty(),
    },
    {
      'name': 'Floating Action Button',
      'route': empty(),
    },
    {
      'name': 'List Tile',
      'route': empty(),
    },
    {
      'name': 'Radio',
      'route': empty(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Modular UI'),
        bottom: TabBar(
          isScrollable: true,
          controller: _tabController,
          tabs: components.map((e) => Tab(text: e['name'])).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: components
            .map((e) => Center(
                  child: e["route"],
                ))
            .toList(),
      ),
    );
  }
}
