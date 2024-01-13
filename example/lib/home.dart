import 'package:example/components/avatar.dart';
import 'package:example/components/breadcrumbs.dart';
import 'package:example/components/buttons.dart';
import 'package:example/components/cards.dart';
import 'package:example/components/checkbox.dart';
import 'package:example/components/footer.dart';
import 'package:example/components/listtile.dart';
import 'package:example/components/ratingbar.dart';
import 'package:example/components/switch.dart';
import 'package:example/components/tabs.dart';
import 'package:example/components/textfield.dart';
import 'package:flutter/material.dart';

import 'components/dialog.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Map> components = [];

  @override
  void initState() {
    super.initState();
    components = [
      {
        'name': 'Button',
        'route': button(),
      },
      {
        'name': 'Card',
        'route': card(),
      },
      {
        "name": "Tabs",
        "route": tabsComponent(),
      },
      {
        'name': 'Dialog',
        'route': dialog(context),
      },
      {
        'name': 'Checkbox',
        'route': checkbox(),
      },
      {
        'name': 'Breadcrumbs',
        'route': breadcrumbs(),
      },
      {
        'name': 'Avatar',
        'route': avatar(),
      },
      {
        'name': 'Switch',
        'route': switchComponent(),
      },
      {
        'name': 'Rating Bar',
        'route': ratingbar(),
      },
      {
        'name': 'List Tile',
        'route': listtile(),
      },
      {
        'name': 'Footer',
        'route': footer(),
      },
      {
        'name': 'textfield',
        'route': textfield(),
      },
    ];
    _tabController = TabController(length: components.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
