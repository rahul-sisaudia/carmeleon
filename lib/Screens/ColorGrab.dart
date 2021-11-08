// import 'dart:io';

// import 'package:carmeleon/models/ColorLibraryModel.dart';
// import 'package:flutter/material.dart';
// import 'package:cyclop/cyclop.dart';
// import 'package:flutter/rendering.dart';
// import 'package:provider/provider.dart';

// /**
//  * ToDo: Update to a serviceLocator package with Get_it 
//  */
// class ColorGrabScreen extends StatefulWidget {
//   final String? imgPath;
//   const ColorGrabScreen({Key? key, this.imgPath}) : super(key: key);

//   @override
//   _ColorGrabScreenState createState() => _ColorGrabScreenState();
// }

// class _ColorGrabScreenState extends State<ColorGrabScreen> {
//   Color appbarColor = Colors.blueAccent;
//   Set<Color> swatches = Colors.primaries.map((e) => Color(e.value)).toSet();
//   // List<Container> items = [
//   //   Container(
//   //     // padding: EdgeInsets.all(10.0),
//   //     margin: EdgeInsets.fromLTRB(2.5, 0, 2.5, 0),
//   //     height: 60.0,
//   //     width: 25.0,
//   //     color: Colors.red,
//   //   )
//   // ];

//   // Container _getContainer(int index) {
//   //   return items[index];
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Create Color Library'),
//         backgroundColor: appbarColor,
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 12),
//             child: Center(
//               //Tip: ColorButton is a widget by cyclops
//               child: EyedropperButton(
//                 icon: Icons.colorize,
//                 onColor: (value) => setState(() {
//                   var colorCard = context.read<ColorLibraryModel>();
//                   colorCard.add(
//                     Container(
//                       // decoration: BoxDecoration(
//                       //   border: Border.all(width: 2.0, color: Colors.white),
//                       //   // color: value,
//                       //   // borderRadius: BorderRadiusGeometry,
//                       // ),
//                       padding: EdgeInsets.all(10.0),
//                       margin: EdgeInsets.fromLTRB(2.5, 0, 2.5, 0),
//                       height: 60.0,
//                       width: 25.0,
//                       color: value,
//                     ),
//                   );
//                   // items.add(Container(
//                   //   // padding: EdgeInsets.all(10.0),
//                   //   margin: EdgeInsets.fromLTRB(2.5, 0, 2.5, 0),
//                   //   height: 60.0,
//                   //   width: 25.0,
//                   //   color: value,
//                   // ));
//                 }),
//               ),
//             ),
//           )
//         ],
//       ),
//       body: Stack(children: [
//         Align(
//           alignment: Alignment.center,
//           child: Container(
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//             child: Center(
//               child: Image.file(
//                 File(widget.imgPath!),
//                 fit: BoxFit.fill,
//               ),
//             ),
//           ),
//         ),
//         Align(
//           alignment: Alignment.bottomCenter,
//           child: Container(
//             margin: EdgeInsets.symmetric(vertical: 20.0),
//             height: 50.0,
//             child: ColorLibraryList(),
//             // child: Text('Test'),
//           ),
//         ),
//       ]),
//     );
//   }
// }

// class ColorLibraryList extends StatelessWidget {
//   const ColorLibraryList({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var colorLibrary = context.watch<ColorLibraryModel>();

//     return Container(
//       width: 120.0,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: colorLibrary.colorCards.length,
//         itemBuilder: (context, index) {
//           return Align(
//             child: colorLibrary.colorCards[index],
//           );
//         },
//       ),
//     );
//   }
// }
