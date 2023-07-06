import 'package:trilhaapp/model/comment_model.dart';
import 'package:trilhaapp/repositories/comments/comment_repository.dart';
import 'package:trilhaapp/repositories/jsonplaceholder_custom_dio.dart';

class CommentDioRepository implements CommentsRepository {
  @override
  Future<List<CommentModel>> returnComments(int postId) async {
    var jsonPlaceHolderDio = JsonPlaceHolderDio();
    var response = await jsonPlaceHolderDio.dio.get("/posts/$postId/comments");
    return (response.data as List)
        .map((e) => CommentModel.fromJson(e))
        .toList();
  }
}
