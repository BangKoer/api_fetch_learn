import 'package:api_free/model/post.dart';
import 'package:api_free/services/remote_services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post>? posts;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getDatas();
  }

  getDatas() async {
    posts = await RemoteService().getPosts();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post's"),
        centerTitle: true,
      ),
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
          itemCount: posts?.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: ListTile(
                tileColor: Colors.blueAccent[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
                title: Text(
                  posts![index].title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                subtitle: Text(
                  maxLines: 2,
                  posts![index].body ?? "",
                ),
                leading: Container(
                  width: 30,
                  height: 30,
                  color: Colors.blue[900],
                ),
              ),
            );
          },
        ),
        replacement: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
