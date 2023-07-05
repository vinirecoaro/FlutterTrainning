import 'package:trilhaapp/model/post_model.dart';
import 'package:trilhaapp/repositories/posts/posts_repository.dart';
import 'package:dio/dio.dart';

class PostDioRepository implements PostsRepository {
  @override
  Future<List<PostModel>> getPosts() async {
    var dio = Dio();
    var response = await dio.get("https://jsonplaceholder.typicode.com/posts");
    if (response.statusCode == 200) {
      return (response.data as List).map((e) => PostModel.fromJson(e)).toList();
    }
    return [];
  }
}
