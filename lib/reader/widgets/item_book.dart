import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../page_index.dart';
import '../index.dart';

class ItemBook extends StatelessWidget {
  final Books book;
  final VoidCallback onPressed;

  ItemBook({Key key, @required this.book, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
          onTap: onPressed,
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
              child: Row(children: <Widget>[
                ImageLoadView('${book.cover}',
                    height: 99, width: 77, fit: BoxFit.cover),
                Gaps.hGap10,
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                      Text(book.title,
                          style: TextStyle(color: grey3Color, fontSize: 16)),
                      Gaps.vGap8,
                      Text(book.shortIntro,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: grey6Color, fontSize: 14)),
                      Gaps.vGap8,
                      Row(children: <Widget>[
                        Expanded(
                          child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Icon(FontAwesome.user,
                                    size: 13, color: Colors.grey),
                                Gaps.hGap5,
                                Text('${book?.author}',
                                    style: TextStyle(
                                        color: grey9Color, fontSize: 14))
                              ]),
                        ),
                        book.tags.length > 0
                            ? TagView(tag: book.tags[0])
                            : TagView(tag: '限免'),
                        book.tags.length > 1
                            ? Row(children: <Widget>[
                                Gaps.hGap5,
                                TagView(tag: book.tags[1])
                              ])
                            : SizedBox()
                      ])
                    ]))
              ]))),
    );
  }
}
