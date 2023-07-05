import 'package:flutter/material.dart';
import 'package:trilhaapp/model/comment_model.dart';

import '../repositories/comment_http_repository.dart';

class CommentsPage extends StatefulWidget {
  final int postId;
  const CommentsPage({super.key, required this.postId});

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  var commentRepository = CommentHttpRepository();
  var comments = <CommentModel>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    comments = await commentRepository.returnComments(widget.postId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Comentários do Post ${widget.postId}"),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: comments.length == 0
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: comments.length,
                itemBuilder: (_, int index) {
                  var comment = comments[index];
                  return Container(
                    child: Card(
                        child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(comment.name.substring(0, 6)),
                              Text(comment.email),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(comment.body),
                        ],
                      ),
                    )),
                  );
                },
              ),
      ),
    ));
  }
}
