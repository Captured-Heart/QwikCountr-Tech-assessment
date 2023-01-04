import 'package:flutter/material.dart';

//pushNamed
void pushNamed(BuildContext context, String routeName, {Object? args}) =>
    Navigator.pushNamed(context, routeName, arguments: args);

//push
Future<T?> push<T>(BuildContext context, Widget child) =>
    Navigator.of(context).push<T>(MaterialPageRoute(builder: (_) => child));

//push_replacement
void pushReplacement(BuildContext context, Widget child) =>
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => child));
//push_replacement_named
void pushReplaceNamed(BuildContext context, String routeName, {Object? args}) =>
    Navigator.pushReplacementNamed(context, routeName);
//pop until main
void popToMain(BuildContext context) =>
    Navigator.of(context).popUntil((route) => route.isFirst);

//.ofContext POP
void pop(BuildContext context) => Navigator.of(context).pop();
//.oFContext with rootNavigator POP
void popRootNavigatorTrue(BuildContext context) =>
    Navigator.of(context, rootNavigator: true).pop();

//.ofContext PUSH with root navigator == true
void pushReplacementOnRootNav(BuildContext context, Widget child) =>
    Navigator.of(context, rootNavigator: true)
        .pushReplacement(MaterialPageRoute(builder: (context) => child));
