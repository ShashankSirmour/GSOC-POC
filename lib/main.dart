import 'package:flutter/material.dart';
import 'package:gsoc/pages/main/main.dart';
import 'package:gsoc/pages/search/search.dart';

void main() {
  runApp(GSOC());
}

class GSOC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white, fontFamily: 'robotoSlab'),
      routes: {
        '/': (BuildContext context) => MainPage(),
      },
      onGenerateRoute: (RouteSettings setting) {
        final List<String> pathElement = setting.name.split('/');

        if (pathElement[0] != '') {
          return null;
        }

        //------------------------routes---------------------------

        if (pathElement[1] == 'search') {
          return MaterialPageRoute(builder: (BuildContext context) {
            return SearchPage(searchText: pathElement[2].trim());
          });
        }

        // if (pathElement[1] == 'library') {
        //   return MaterialPageRoute(builder: (BuildContext context) {
        //     return LibraryScreen();
        //   });
        // }

        return null; //deffault
      },
    );
  }
}
