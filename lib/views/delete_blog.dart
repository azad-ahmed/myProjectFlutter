import 'package:flutter/material.dart';
import 'package:my_project_flutter/models/blog_post.dart';


class DeleteBlog extends StatelessWidget {
  final BlogPost blogPost; // Der zu löschende Blog-Beitrag

  DeleteBlog({Key? key, required this.blogPost}) : super(key: key);

  void deleteBlogPost(BuildContext context) {

    Navigator.pop(context); // Schließt das aktuelle Fenster nach dem Löschen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog-Beitrag löschen'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Sind Sie sicher, dass Sie den Blog-Beitrag "${blogPost.title}" löschen möchten?',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => deleteBlogPost(context),
              child: Text('Beitrag löschen'),
              style: ElevatedButton.styleFrom(
                primary: Colors.red, // Setzt die Farbe des Buttons auf Rot
              ),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Abbrechen'),
            ),
          ],
        ),
      ),
    );
  }
}
