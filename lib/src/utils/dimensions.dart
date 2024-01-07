/// This is a Globalkey Of Type Navigator State, Which Provides Same Key to Entire Widget Tree

import 'package:flutter/widgets.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

/// The code snippet is defining an extension called `NumExt` on the `num` class. This extension adds
/// two methods `sh` and `sw` to any instance of `num`.
extension NumExt on num {
  /// The function "sh" calculates a value by multiplying a given number with the height of the current
  /// device screen.
  ///
  /// Args:
  ///   context (BuildContext): The context parameter is an object that provides access to various
  /// information about the current application's state, such as the theme, localization settings, and
  /// device size. It is typically passed down from the parent widget to its child widgets.
  double sh(BuildContext context) => this * MediaQuery.of(context).size.height;

  /// The function multiplies a given value with the width of the screen in Flutter.
  ///
  /// Args:
  ///   context (BuildContext): The context parameter is an object that provides access to various
  /// information about the current application's state, such as the theme, localization settings, and
  /// device size. It is typically passed down from the parent widget to its child widgets.
  double sw(BuildContext context) => this * MediaQuery.of(context).size.width;

  /// The function calculates the percentage of the screen height based on a given value and the current
  /// device's screen height.
  ///
  /// Args:
  ///   context (BuildContext): The `context` parameter is an object that provides access to various
  /// information about the current build context, such as the theme, localization, and media queries.
  /// It is typically passed down from the parent widget to its child widgets.
  double shPer(BuildContext context) =>
      this * MediaQuery.of(context).size.height / 100;

  /// The function calculates the width of a screen in percentage.
  ///
  /// Args:
  ///   context (BuildContext): The `context` parameter is an object that represents the current state
  /// and configuration of the Flutter application. It provides access to various resources and
  /// services, such as the theme, localization, and device information. In this case, it is used to
  /// access the `MediaQuery` object, which provides information about
  double swPer(BuildContext context) =>
      this * MediaQuery.of(context).size.width / 100;
}
