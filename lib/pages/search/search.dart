import 'package:gsoc/model/care.dart';
import "package:gsoc/util/color/hex_code.dart";
import 'package:gsoc/widget/individual/search/search.dart';

import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  final String searchText;
  const SearchPage({this.searchText});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  ScrollController _scrollController;

  List<Care> cares = [];
  bool lastPage;
  int page = 0;
  bool fetching;

  void fetch() {
    if (fetching == true) return;
    setState(() {
      fetching = true;
    });

    page++;
    initiateScraping('searchUrl', page).then((_) {
      setState(() {
        fetching = false;
      });
    });
  }

  @override
  void initState() {
    lastPage = false;

    // List<String> texts = widget.searchText.trim().split(" ");
    // for (int i = 0; i < texts.length; i++) {
    //   if (i != 0) req = req + "+";
    //   req = req + texts[i].trim();
    // }
    // req = "search.php?req=" + req;

    // searchUrl = endpintSearch[currentServer] + req + urlFilter;

    // fetching = false;
    // page = 0;

    fetch();
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        fetch();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor("F5F5F5"),
        ),
        body: Stack(
          children: <Widget>[
            ListView.builder(
              padding: EdgeInsets.only(top: 40, left: 20, right: 20),
              physics: BouncingScrollPhysics(),
              controller: _scrollController,
              itemCount: cares.length,
              itemBuilder: (BuildContext context, int index) {
                return BookPreviewCard(care: cares[index], index: index);
              },
            ),
            fetching == true && lastPage != true ? buildLoading() : Container()
          ],
        ));
  }

  Align buildLoading() {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RefreshProgressIndicator(
              backgroundColor: Colors.black,
            ),
            Text(
              "LOADING",
              style: TextStyle(
                  fontFamily: 'orbitron', fontWeight: FontWeight.w900),
            )
          ],
        ));
  }

//-------------------------------------------------libgen-----------------
  Future initiateScraping(String url, int page) async {
    Future.delayed(Duration(milliseconds: 5000));
    for (var i = 0; i < 20; i++) {
      setState(() {
        cares.add(Care(
          hospitalName: "Dummy Data",
          care: "XYZ Care And Treatment",
          cost: 20,
          underKM: 3,
        ));
      });
    }
  }
}
