import 'package:flutter/material.dart';
import 'package:my_project_flutter/models/blog_post.dart';

class BlogDetails extends StatelessWidget {
  final BlogPost blogPost;

  BlogDetails({Key? key, required this.blogPost}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(blogPost.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                blogPost.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Verfasst von ${blogPost.author} am ${blogPost.time.toString()}',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 16),
              Text(
                blogPost.content,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              Text(
                'Likes: ${blogPost.likes}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              // Kommentare anzeigen
              Text(
                'Kommentare:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              for (var comment in blogPost.comments)
                ListTile(
                  title: Text(comment),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
