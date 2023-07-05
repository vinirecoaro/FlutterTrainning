import 'dart:convert';

import 'package:trilhaapp/model/comment_model.dart';
import 'package:http/http.dart' as http;

class CommentRepository {
  Future<List<CommentModel>> returnComments(int postId) async {
    var response = await http.get(Uri.parse(
        "https://jsonplaceholder.typicode.com/posts/$postId/comments"));
    if (response.statusCode == 200) {
      var jsonComments = jsonDecode(response.body);
      return (jsonComments as List)
          .map((e) => CommentModel.fromJson(e))
          .toList();
    }
    return [];
  }
}
