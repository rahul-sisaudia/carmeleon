// import 'dart:collection';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// class ColorLibraryModel extends ChangeNotifier {
//   final List<Container> _items = [
//     Container(
//       padding: EdgeInsets.all(10.0),
//       decoration: BoxDecoration(
//         border: Border.all(width: 2.0, color: Colors.black),
//         color: Colors.transparent,
//         // borderRadius: BorderRadiusGeometry,
//       ),
//       margin: EdgeInsets.fromLTRB(2.5, 0, 2.5, 0),
//       height: 60.0,
//       width: 25.0,
//       // color: Colors.transparent,
//     )
//   ];

//   UnmodifiableListView<Container> get colorCards =>
//       UnmodifiableListView(_items);

//   void add(Container item) {
//     _items.add(item);

//     notifyListeners();
//   }

//   void remove() {
//     _items.clear();
//     notifyListeners();
//   }
// }
