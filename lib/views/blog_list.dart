import 'package:flutter/material.dart';
import 'package:my_project_flutter/models/blog_post.dart'; // Stellen Sie sicher, dass Sie den korrekten Pfad angeben

class BlogList extends StatefulWidget {
  @override
  _BlogListState createState() => _BlogListState();
}

class _BlogListState extends State<BlogList> {
  List<BlogPost> blogPosts = []; // Diese Liste sollte mit echten Daten gefüllt werden

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog-Beiträge'),
      ),
      body: ListView.builder(
        itemCount: blogPosts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(blogPosts[index].title),
            subtitle: Text('Verfasst von ${blogPosts[index].author}'),
            onTap: () {
            },
          );
        },
      ),
    );
  }
}
