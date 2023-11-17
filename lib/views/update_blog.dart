import 'package:flutter/material.dart';
import 'package:my_project_flutter/models/blog_post.dart';

class UpdateBlog extends StatefulWidget {
  final BlogPost blogPost; // Der zu aktualisierende Blog-Beitrag

  UpdateBlog({Key? key, required this.blogPost}) : super(key: key);

  @override
  _UpdateBlogState createState() => _UpdateBlogState();
}

class _UpdateBlogState extends State<UpdateBlog> {
  final _formKey = GlobalKey<FormState>();
  late String title;
  late String content;
  late String author;

  @override
  void initState() {
    super.initState();
    title = widget.blogPost.title;
    content = widget.blogPost.content;
    author = widget.blogPost.author;
  }

  void updateBlogPost() {
    if (_formKey.currentState!.validate()) {
      print('Blog-Post aktualisiert: $title, $content, $author');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog-Beitrag aktualisieren'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: title,
                decoration: InputDecoration(labelText: 'Titel'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Bitte geben Sie einen Titel ein';
                  }
                  return null;
                },
                onSaved: (value) => title = value!,
              ),
              TextFormField(
                initialValue: content,
                decoration: InputDecoration(labelText: 'Inhalt'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Bitte geben Sie Inhalt ein';
                  }
                  return null;
                },
                onSaved: (value) => content = value!,
              ),
              TextFormField(
                initialValue: author,
                decoration: InputDecoration(labelText: 'Autor'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Bitte geben Sie einen Autor ein';
                  }
                  return null;
                },
                onSaved: (value) => author = value!,
              ),
              ElevatedButton(
                onPressed: updateBlogPost,
                child: Text('Beitrag aktualisieren'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
