import 'package:flutter/material.dart';
import 'package:project_chef_kita/model/resep.api.dart';
import 'package:project_chef_kita/model/resep.dart';
import 'package:project_chef_kita/views/detail_resep.dart';
import 'package:project_chef_kita/views/widget/resep_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Resep> _resep;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getResep();
  }

  Future<void> getResep() async {
    _resep = await ResepApi.getResep();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(FontAwesomeIcons.utensils),
              SizedBox(width: 10),
              Text('Chef Kita')
            ],
          ),
        ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _resep.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: ResepCard(
                        title: _resep[index].name,
                        cooktime: _resep[index].totalTime,
                        rating: _resep[index].rating.toString(),
                        thumbnailUrl: _resep[index].images,
                        videoUrl: _resep[index].videoUrl),
                    onTap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailResep(
                              name: _resep[index].name,
                              totalTime: _resep[index].totalTime,
                              rating: _resep[index].rating.toString(),
                              images: _resep[index].images,
                              description: _resep[index].description,
                              videoUrl: _resep[index].videoUrl,
                              instructions: _resep[index].instructions,
                              sections: _resep[index].sections,
                            ),
                          ))
                    },
                  );
                },
              ));
  }
}
