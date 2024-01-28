import 'package:example/components/avatar.dart';
import 'package:example/components/breadcrumbs.dart';
import 'package:example/components/buttons.dart';
import 'package:example/components/cards.dart';
import 'package:example/components/carousels.dart';
import 'package:example/components/checkbox.dart';
import 'package:example/components/footer.dart';
import 'package:example/components/list_tile.dart';
import 'package:example/components/rating_bar.dart';
import 'package:example/components/slider.dart';
import 'package:example/components/switch.dart';
import 'package:example/components/tabs.dart';
import 'package:example/components/textfield.dart';
import 'package:flutter/material.dart';

import 'components/dialog.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
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
        'route': ratingBar(),
      },
      {
        'name': 'List Tile',
        'route': listTile(),
      },
      {
        'name': 'textfield',
        'route': textfield(),
      },
      {
        'name': 'carousel',
        'route': carousel(),
      },
      {
        'name': 'slider',
        'route': slider(),
      },
      {
        'name': 'Footer',
        'route': footer(),
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Modular UI'),
        bottom: TabBar(
          indicatorColor: Colors.black87,
          labelColor: Colors.black87,
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
