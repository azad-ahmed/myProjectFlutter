import 'package:flutter/material.dart';

import '../models/blog_post.dart';
import '../services/local_storage_service.dart';

class BlogEditPage extends StatefulWidget {
  final BlogPost blogPost;

  BlogEditPage({required this.blogPost});

  @override
  _BlogEditPageState createState() => _BlogEditPageState();
}

class _BlogEditPageState extends State<BlogEditPage> {
  final _formKey = GlobalKey<FormState>();
  late String _title;
  late String _content;
  late String _author;
  @override
  void initState() {
    super.initState();
    _title = widget.blogPost.title;
    _content = widget.blogPost.content;
    _author = widget.blogPost.author;
  }

  void _saveBlogPost() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final blogPost = BlogPost(
        id: widget.blogPost.id.isEmpty ? DateTime.now().toString() : widget.blogPost.id,
        title: _title,
        content: _content,
        author: _author,
        createdAt: widget.blogPost.createdAt,
      );

      if (widget.blogPost.id.isEmpty) {
        LocalStorageService().addBlogPost(blogPost);
      } else {
        LocalStorageService().updateBlogPost(blogPost.id, blogPost);
      }

      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.blogPost.id.isEmpty ? 'Neuen Blogpost erstellen' : 'Blogpost bearbeiten'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _title,
                decoration: InputDecoration(labelText: 'Titel'),
                onSaved: (value) => _title = value!,
                validator: (value) => value!.isEmpty ? 'Bitte einen Titel eingeben' : null,
              ),
              TextFormField(
                initialValue: _content,
                decoration: InputDecoration(labelText: 'Inhalt'),
                onSaved: (value) => _content = value!,
                validator: (value) => value!.isEmpty ? 'Bitte Inhalt eingeben' : null,
              ),
              TextFormField(
                initialValue: _author,
                decoration: InputDecoration(labelText: 'Autor'),
                onSaved: (value) => _author = value!,
                validator: (value) => value!.isEmpty ? 'Bitte einen Autor eingeben' : null,
              ),
              ElevatedButton(
                onPressed: _saveBlogPost,
                child: Text('Speichern'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
