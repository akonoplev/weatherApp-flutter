import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:firstFlutterApp/Chopper/data/post_api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'SinglePostPage.dart';
import 'Model/built_post.dart';

class HomePage extends StatelessWidget {

  List<PostModel> postsModels = [];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Chopper Blog'),
      ),
      body: _buildBody(context),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final response = await Provider.of<PostApiService>(context)
              .postPost({'key': 'value'});
          print(response.body);
        },
      ),
    );
  }

  FutureBuilder<Response> _buildBody(BuildContext context) {
    return FutureBuilder<Response>(
      future: Provider.of<PostApiService>(context).getPosts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            print("error fau");
            return Center(child:
              Text(snapshot.error.toString(),
              textAlign: TextAlign.center,
              textScaleFactor: 1.3,),);
          }
          final List posts = json.decode(snapshot.data.bodyString);
          posts.forEach((element) {
            PostModel postModel = PostModel.fromJson(element);
            postsModels.add(postModel);
          });
          return _buildPosts(context, posts);
        } else {
          return Center(
            child: CircularProgressIndicator()
          );
        }
      },
    );
  }

  ListView _buildPosts(BuildContext context, List posts) {
    return ListView.builder(
      itemCount: posts.length,
      padding: EdgeInsets.all(8),
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          child: ListTile(
            title: Text(
              postsModels[index].title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
              subtitle: Text(postsModels[index].body),
              onTap: () => _navigateToPost(context, postsModels[index].id),
          ),
        );
      },
    );
  }

  void _navigateToPost(BuildContext context, int id) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SinglePostPage(id)
      )
    );
  }
}