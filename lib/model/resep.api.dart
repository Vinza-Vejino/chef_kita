import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_chef_kita/model/resep.dart';

class ResepApi {
// var req = unirest("GET", "https://yummly2.p.rapidapi.com/feeds/List");

// req.query({
  // "start": "0",
  // "limit": "18",
  // "tag": "list.recipe.popular"
// });

// req.headers({
  // "x-rapidapi-key": "f4d59d37bbmsheb5fe9f3e900140p118060jsnf45a0e6e46f1",
  // "x-rapidapi-host": "yummly2.p.rapidapi.com",
  // "useQueryString": true
// });

  static Future<List<Resep>> getResep() async {
    var uri = Uri.https('tasty.p.rapidapi.com', '/recipes/list',
        {"from": '0', "size": '20', "tags": 'under_30_minutes'});

    final response = await http.get(uri, headers: {
      "x-rapidapi-key": "62d82144c9mshf18c05b3b9a4797p148fdajsndb532394d4d3",
      "x-rapidapi-host": "tasty.p.rapidapi.com",
      "useQueryString": "true"
    });

    var data = jsonDecode(response.body);
    List _temp = [];

    // Periksa apakah 'results' ada dan bisa diiterasi
    if (data['results'] != null && data['results'] is Iterable) {
      for (var i in data['results']) {
        _temp.add(i);
      }
    } else {
      print('results is null or not an Iterable');
    }

    return Resep.resepFromSnapshot(_temp);
  }
}
