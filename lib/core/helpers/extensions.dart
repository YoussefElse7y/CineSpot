import 'package:flutter/material.dart';

extension Navigation on BuildContext {

   Future<T?> pushNamed<T>(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed<T>(routeName, arguments: arguments);
  }
  
   Future<T?> pushReplacementNamed<T, TO>(String routeName, {TO? result, Object? arguments}) {
    return Navigator.of(this).pushReplacementNamed<T, TO>(routeName, result: result, arguments: arguments);
  }

  Future<T?> pushNamedAndRemoveUntil<T>(String routeName, bool Function(Route<dynamic>) predicate, {Object? arguments}) {
    return Navigator.of(this).pushNamedAndRemoveUntil<T>(routeName, predicate, arguments: arguments);
  }

  Future<T?> push<T>(Widget page) {
    return Navigator.of(this).push<T>(
      MaterialPageRoute(
        builder: (_) => page,
      ),
    );
  }
   
 

  Future<T?> pushReplacement<T, TO>(Widget page, {TO? result}) {
    return Navigator.of(this).pushReplacement<T, TO>(
      MaterialPageRoute(
        builder: (_) => page,
      ),
      result: result,
    );
  }

  void pop<T extends Object?>([T? result]) {
    Navigator.of(this).pop<T>(result);
  }
}