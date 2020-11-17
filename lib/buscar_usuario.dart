// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/painting.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// import 'dart:async';
//
// import 'package:colaborae/constants.dart';
// import 'package:colaborae/components/bottom_nav_bar.dart';
// import 'package:colaborae/components/tab_header.dart';
//
// import 'search_users.dart';
//
//
// class BuscarUsuario extends StatefulWidget {
//   @override
//   _BuscarUsuarioState createState() => _BuscarUsuarioState();
// }
//
// class _BuscarUsuarioState extends State<BuscarUsuario> {
//   final _debouncer = Debouncer(milliseconds: 1000);
//   static const double _cardsSpacing = 30.0;
//
//   SearchUsers search = SearchUsers();
//
//   @override
//   void initState() {
//     super.initState();
//     setState(() async {
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.fromLTRB(20, 25, 20, 0),
//           child: ListView(
//             children: [
//               // Título da aba
//               TabHeader(
//                 icon: Icons.arrow_back,
//                 title: 'Buscar usuário',
//                 haveButton: false,
//               ),
//               SizedBox(
//                 height: _cardsSpacing,
//               ),
//               // Barra de pesquisa e botão de adicionar serviço novo
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: lighterGray,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Row(
//                         children: [
//                           Container(
//                             margin: EdgeInsets.fromLTRB(15, 0, 12, 0),
//                             child: SvgPicture.asset(
//                               'images/svg/search.svg',
//                               color: gray,
//                             ),
//                           ),
//                           // Text Field
//                           Expanded(
//                             child: TextField(
//                               onChanged: (String str) {
//                                 if (str != '') {
//                                   _debouncer.run(() {
//                                     Navigator.push(context,
//                                         MaterialPageRoute(builder: (context) {
//                                           return SearchUsers(
//                                             userInput: str,
//                                           );
//                                         }));
//                                   });
//                                 }
//                               },
//                               style: TextStyle(color: lightGray),
//                               decoration: InputDecoration(
//                                 border: InputBorder.none,
//                                 hintText: 'Procurar um usuário',
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 15.0,
//                   ),
//                   // BOTÃO QUE LEVA PARA O CADASTRO DE UM NOVO SERVIÇO
//                   // Ink(
//                   //   decoration: ShapeDecoration(
//                   //     color: mainPurple,
//                   //     shape: RoundedRectangleBorder(
//                   //       borderRadius: BorderRadius.circular(10),
//                   //     ),
//                   //   ),
//                   //   child: IconButton(
//                   //     icon: Icon(
//                   //       Icons.add,
//                   //       size: 30,
//                   //     ),
//                   //     color: Colors.white,
//                   //     onPressed: () {
//                   //       Navigator.pushNamed(context, '/cadastro_servico');
//                   //       print('Adicionar novo serviço pressionado');
//                   //     },
//                   //   ),
//                   // ),
//                 ],
//               ),
//               // Categorias
//               SizedBox(
//                 height: _cardsSpacing,
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomNavBar(),
//     );
//   }
// }
//
// class Debouncer {
//   final int milliseconds;
//   VoidCallback action;
//   Timer _timer;
//
//   Debouncer({this.milliseconds});
//
//   run(VoidCallback action) {
//     if (_timer != null) {
//       _timer.cancel();
//     }
//
//     _timer = Timer(Duration(milliseconds: milliseconds), action);
//   }
// }