import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GalleryApp(),
    );
  }
}

class GalleryApp extends StatefulWidget {
  @override
  _GalleryAppState createState() => _GalleryAppState();
}

class _GalleryAppState extends State<GalleryApp> {
  List img = [
    "https://images.unsplash.com/photo-1613169620329-6785c004d900?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80",
    "https://images.unsplash.com/photo-1613253307267-70b78f8d98d5?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",
    "https://images.unsplash.com/photo-1612800848123-7a44a346f206?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",
    "https://images.unsplash.com/photo-1613066633868-34d0c5ccefdf?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1396&q=80",
    "https://images.unsplash.com/photo-1613114016545-8352ff5b8d9c?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=700&q=80",
    "https://images.unsplash.com/photo-1612979857678-0ce10e5b3439?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80",
    "https://images.unsplash.com/photo-1612979857678-0ce10e5b3439?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80",
    "https://images.unsplash.com/photo-1612979857678-0ce10e5b3439?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80",
    "https://images.unsplash.com/photo-1612979857678-0ce10e5b3439?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Text(
                  "Gallery App",
                  style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold,color: Colors.indigo),
                ),
              ),
              SizedBox(height: 18),
              TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Colors.indigo),
                    hintText: "Search for an image",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0))),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 18.0),
                  child: StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    itemCount: img.length,
                    itemBuilder:(context,index){
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(img[index],fit:BoxFit.fill),
                        ),
                      );
                    },
                    staggeredTileBuilder: (index){
                      return new StaggeredTile.count(1, index.isEven ? 1.2:2);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
