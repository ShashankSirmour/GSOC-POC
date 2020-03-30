import 'package:gsoc/model/care.dart';
import 'package:gsoc/pages/care/care.dart';
//import 'package:gsoc/pages/book/book.dart';
import 'package:gsoc/util/card/search_book_detail.dart';
import 'package:flutter/material.dart';

class BookPreviewCard extends StatelessWidget {
  final Care care;
  final int index;
  const BookPreviewCard({Key key, this.care, @required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return CarePage(care: care, heroTag: index.toString());
            },
          ),
        );
      },
      child: getBookPreviewCard(context),
    );
  }

  Widget getBookPreviewCard(BuildContext context) {
    return Container(
      height: 220,
      child: Container(
        padding: EdgeInsets.all(5),
        child: SearchBookDetailCard(
          title: care.care,
          underKM: care.underKM.toString(),
          cost: care.cost.toString(),
        ),
      ),
    );
  }
}
