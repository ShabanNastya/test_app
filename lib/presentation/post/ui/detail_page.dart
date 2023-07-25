import 'package:flutter/material.dart';
import '../../../domain/models/post.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    Key? key,
    required this.currentPostIndex,
  }) : super(key: key);

  final Post currentPostIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          currentPostIndex.title,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                const Text("USERID:"),
                Text(currentPostIndex.userId.toString()),
              ],
            ),
            Row(
              children: <Widget>[
                const Text("ID:"),
                Text(currentPostIndex.id.toString()),
              ],
            ),
            Row(
              children: <Widget>[
                const Text("BODY:"),
                Expanded(child: Text(currentPostIndex.body)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
