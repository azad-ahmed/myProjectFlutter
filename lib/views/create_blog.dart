import 'package:flutter/material.dart';
import 'package:my_project_flutter/models/blog_post.dart';

class CreateBlog extends StatefulWidget {
  @override
  _CreateBlogState createState() => _CreateBlogState();
}

class _CreateBlogState extends State<CreateBlog> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String content = '';
  String author = '';

  void submitBlogPost() {
    if (_formKey.currentState!.validate()) {

      print('Blog-Post erstellt: $title, $content, $author');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Neuen Blog-Beitrag erstellen'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
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
                onPressed: submitBlogPost,
                child: Text('Beitrag erstellen'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
