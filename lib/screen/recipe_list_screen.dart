import 'dart:convert';

import 'package:cook/model/recipe.model.dart';
import 'package:cook/screen/recipe_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RecipeListScreen extends StatefulWidget {
  final List<Items> items;

  const RecipeListScreen({Key? key, required this.items}) : super(key: key);

  @override
  _RecipeListScreenState createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  Recipe _recipe = Recipe();

  @override
  initState() {
    readJson();
    super.initState();
  }

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/sample.json');
    final data = await json.decode(response);
    setState(() {
      _recipe = Recipe.fromJson(data);
    });
  }

  navigate(BuildContext context, Items items) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeListDetailsScreen(items: items)));
  }

  @override
  Widget build(BuildContext context) {
    List<Items> items = widget.items;

    return Scaffold(
      appBar: AppBar(title: const Text("Recipe List")),
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/foodiesfeed.com_oranges-with-ice.jpg"), fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            //ElevatedButton(
            //onPressed: () => navigate(context),
            //child: const Text("Details"),
            //),
            //ElevatedButton(onPressed: readJson, child: const Text('Load Data')),
            items.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.all(10),
                          child: ListTile(
                            leading: Text(items[index].id),
                            title: Text(items[index].name),
                            //subtitle: Text(items[index].description),
                            onTap: () => navigate(context, items[index]),
                          ),
                        );
                      },
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
