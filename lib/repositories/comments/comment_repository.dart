import 'package:trilhaapp/model/comment_model.dart';

abstract class CommentsRepository {
  Future<List<CommentModel>> returnComments(int postId);
}
