import 'package:flutter/material.dart';
import '../services/local_storage_service.dart';
import 'blog_edit_page.dart';

class BlogListPage extends StatefulWidget {
  @override
  _BlogListPageState createState() => _BlogListPageState();
}

class _BlogListPageState extends State<BlogListPage> {
  final LocalStorageService _storageService = LocalStorageService();
  final Set<String> _likedPosts = Set<String>();

  void _deleteBlogPost(String id) {
    setState(() {
      _storageService.deleteBlogPost(id);
    });
  }

  void _toggleLike(String id) {
    setState(() {
      if (_likedPosts.contains(id)) {
        _likedPosts.remove(id);
      } else {
        _likedPosts.add(id);
      }
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
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(blogPost.title),
              subtitle: Text('Verfasst von ${blogPost.author} am ${blogPost.createdAt.toString()}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(
                      _likedPosts.contains(blogPost.id) ? Icons.favorite : Icons.favorite_border,
                      color: _likedPosts.contains(blogPost.id) ? Colors.red : null,
                    ),
                    onPressed: () => _toggleLike(blogPost.id),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _deleteBlogPost(blogPost.id),
                  ),
                ],
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
