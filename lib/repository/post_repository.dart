import 'dart:async';
import 'dart:convert';
import 'dart:io';


import 'package:bloc_learning/model/post_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart'  as http;
class PostRepository {

  Future<List<PostModel>> fetchPost()async{

      try {

        final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users')).timeout( const Duration(seconds: 10 ));
        final body = json.decode(response.body) as List;
        if (kDebugMode) {
          print(response.statusCode.toString());
          print(body);
        }

        if(response.statusCode == 200){
          return  body.map((dynamic json) {
            final map = json as Map<String, dynamic>;
            return  PostModel(
         name: map['name'] as String,
              id: map['id'] as int,
              username: map['username'] as String,
              email: map['email'] as String,
            );
          }).toList();

        }

      } on SocketException {
        await Future.delayed(const Duration(milliseconds: 1800));
        throw Exception('No Internet Connection');
      } on TimeoutException {
        throw Exception('');
      }

      throw Exception('error fetching data');
  }
}