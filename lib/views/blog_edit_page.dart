import 'package:flutter/material.dart';
import '../models/blog_post.dart';
import '../services/local_storage_service.dart';

class BlogEditPage extends StatefulWidget {
  final BlogPost? blogPost;

  const BlogEditPage({Key? key, this.blogPost}) : super(key: key);

  @override
  _BlogEditPageState createState() => _BlogEditPageState();
}

class _BlogEditPageState extends State<BlogEditPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _contentController;
  late TextEditingController _authorController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.blogPost?.title ?? '');
    _contentController = TextEditingController(text: widget.blogPost?.content ?? '');
    _authorController = TextEditingController(text: widget.blogPost?.author ?? '');
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    _authorController.dispose();
    super.dispose();
  }

  void _saveBlogPost() {
    if (_formKey.currentState!.validate()) {
      final blogPost = BlogPost(
        id: widget.blogPost?.id ?? DateTime.now().toString(),
        title: _titleController.text,
        content: _contentController.text,
        author: _authorController.text,
        createdAt: widget.blogPost?.createdAt ?? DateTime.now(),
      );

      if (widget.blogPost == null) {
        LocalStorageService().addBlogPost(blogPost);
      } else {
        LocalStorageService().updateBlogPost(blogPost);
      }

      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.blogPost == null ? 'Neuen Blogpost erstellen' : 'Blogpost bearbeiten'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Titel'),
                validator: (value) => value!.isEmpty ? 'Bitte einen Titel eingeben' : null,
              ),
              TextFormField(
                controller: _contentController,
                decoration: InputDecoration(labelText: 'Inhalt'),
                maxLines: null, // Erlaubt unbegrenzte Zeilen
                keyboardType: TextInputType.multiline, // Zeigt die "Enter"-Taste auf der Tastatur für Zeilenumbrüche
                validator: (value) => value!.isEmpty ? 'Bitte Inhalt eingeben' : null,
              ),
              TextFormField(
                controller: _authorController,
                decoration: InputDecoration(labelText: 'Autor'),
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
