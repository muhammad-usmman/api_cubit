

import 'dart:convert';

import '../../model/album_fetch_model/album_fetch_model.dart';
import 'package:http/http.dart' as http;


class AlbumRepo {
  Future<List<AlbumModel>> fetchAlbumApi() async {
    String url = "https://jsonplaceholder.typicode.com/photos";
    final uri = Uri.parse(url);

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final result =json.map((e){
        return AlbumModel(albumId: e['albumId'], id: e['id'], title: e['title'], url: e['url'], thumbnailUrl: e['thumbnailUrl']);
      }).toList();
      return result;
    }else{
      throw "Something went wrong code ${response.statusCode}";
    }
  }
}

