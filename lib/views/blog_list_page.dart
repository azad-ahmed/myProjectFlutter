import 'package:flutter/material.dart';
import '../models/blog_post.dart';
import '../services/local_storage_service.dart';
import 'blog_edit_page.dart';

class BlogListPage extends StatefulWidget {
  @override
  _BlogListPageState createState() => _BlogListPageState();
}

class _BlogListPageState extends State<BlogListPage> {
  final LocalStorageService _storageService = LocalStorageService();

  void _deleteBlogPost(String id) {
    setState(() {
      _storageService.deleteBlogPost(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog-Beiträge'),
      ),
      body: ListView.builder(
        itemCount: _storageService.blogPosts.length,
        itemBuilder: (context, index) {
          final blogPost = _storageService.blogPosts[index];
          return Dismissible(
            key: Key(blogPost.id),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              _deleteBlogPost(blogPost.id);
            },
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Icon(Icons.delete, color: Colors.white),
              ),
            ),
            child: ListTile(
              title: Text(blogPost.title),
              subtitle: Text('Verfasst von ${blogPost.author}'),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => _deleteBlogPost(blogPost.id),
              ),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => BlogEditPage(blogPost: blogPost),
              )).then((_) => setState(() {})),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => BlogEditPage(blogPost: null),
        )).then((_) => setState(() {})),
        child: Icon(Icons.add),
        tooltip: 'Neuen Blog-Beitrag erstellen',
      ),
    );
  }
}
