import 'package:flutter/material.dart';
import 'package:trilhaapp/model/comment_model.dart';
import 'package:trilhaapp/repositories/comments/comment_repository.dart';
import '../repositories/comments/impl/comment_dio_repository.dart';

class CommentsPage extends StatefulWidget {
  final int postId;
  const CommentsPage({super.key, required this.postId});

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  late CommentsRepository commentRepository;
  var comments = <CommentModel>[];

  @override
  void initState() {
    super.initState();
    commentRepository = CommentDioRepository();
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
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: comments.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: comments.length,
                itemBuilder: (_, int index) {
                  var comment = comments[index];
                  return Container(
                    child: Card(
                        child: Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                          const SizedBox(
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
