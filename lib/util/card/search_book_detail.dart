import 'package:gsoc/util/color/hex_code.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class SearchBookDetailCard extends StatefulWidget {
  final String title;
  final String underKM;

  final String cost;

  const SearchBookDetailCard({Key key, this.title, this.underKM, this.cost})
      : super(key: key);

  @override
  _SearchBookDetailCardState createState() => _SearchBookDetailCardState();
}

class _SearchBookDetailCardState extends State<SearchBookDetailCard> {
  bool bookmarked = false;

  @override
  Widget build(BuildContext context) {
    String underKMText = "Under : " +
        (widget.underKM != null && widget.underKM.trim() != ''
            ? widget.underKM
            : "Unknown") +
        " KM";
    return Column(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              color: Colors.orange,
              icon: Icon(bookmarked ? Icons.bookmark : Icons.bookmark_border),
              onPressed: () {
                setState(() {
                  bookmarked = !bookmarked;
                });
              },
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            padding: EdgeInsets.only(top: 5, bottom: 5, left: 8, right: 5),
            decoration: BoxDecoration(
              color: HexColor("f8f8ff"),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  blurRadius: 2.0,
                  offset: Offset(1, 5),
                  color: Colors.black12,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: Container(
                    padding: EdgeInsets.only(left: 5),
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text("Cost: "+widget.cost + "\$"),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 4.0,
                              bottom: 2,
                            ),
                            child: AutoSizeText(
                              widget.title != null
                                  ? widget.title
                                  : "Need To Update Please Be Calm",
                              presetFontSizes: [20.0, 18.0, 16.0],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            underKMText,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
