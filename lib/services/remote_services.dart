import 'package:api_free/model/post.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<List<Post>?> getPosts() async {
    var client = http.Client();
    var Url = Uri.parse("https://jsonplaceholder.typicode.com/posts");

    var Response = await client.get(Url);
    if (Response.statusCode == 200) {
      var json = Response.body;
      return postFromJson(json);
    }
  }
}
