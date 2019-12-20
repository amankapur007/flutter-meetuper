import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meetuper/src/models/post.dart';
import 'package:flutter_meetuper/src/services/post_api_provider.dart';
import 'package:flutter_meetuper/widgets/bottom_navigation.dart';
import 'package:faker/faker.dart';


class PostScreen extends StatefulWidget {
  final String appTitle;

  PostScreen({String appTitle}) : appTitle = appTitle;

  @override
  PostScreenState createState() {
    return PostScreenState();
  }
}

class PostScreenState extends State<PostScreen> {
  List<Post> _posts = [];
  PostApiProvider _api = PostApiProvider();

  initState() {
    super.initState();
    _fetchPosts();
  }

  _fetchPosts() async {
    List<Post> posts = await _api.fetchPosts();
    setState(() {
      _posts = posts;
    });
  }

  _addPost(){
    final int id = faker.randomGenerator.integer(9999);
    final String title =  faker.food.dish();
    final String body =  faker.food.cuisine();
    final Post newPost = Post(title: title, body: body, id: id);

    setState(() {
      _posts.add(newPost);
    });
  }
  @override
  Widget build(BuildContext context) {
    return _PostList(posts:_posts, createPost:_addPost);
  }
}

class _PostList extends StatelessWidget {
  List<Post> _posts;
  Function() _createPost;

  _PostList({@required List<dynamic> posts, @required Function() createPost}) : 
  _posts = posts,
  _createPost = createPost;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
      itemCount: _posts.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: <Widget>[
            Divider(),
            ListTile(
              title: Text(_posts[index].title),
              subtitle: Text(_posts[index].body),
            ),
          ],
        );
      },
    ),
      bottomNavigationBar: BottomNavigation(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _createPost();
        },
        tooltip: "Add Post",
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("Posts"),
      ),
    );
    
  }
}
