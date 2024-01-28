// This is a GlobalKey Of Type Navigator State, Which Provides Same Key to Entire Widget Tree

import 'package:flutter/widgets.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


///  This acts as Global Function To Get Screen Width 
double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

/// This acts as Global Function to Get Screen Height
double getScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}