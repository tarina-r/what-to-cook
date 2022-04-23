import 'dart:convert';

import 'package:cook/model/recipe.model.dart';
import 'package:cook/screen/recipe_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RecipeListScreen extends StatefulWidget {
  const RecipeListScreen({Key? key}) : super(key: key);

  @override
  _RecipeListScreenState createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  Recipe _recipe = new Recipe();

  @override
  initState() {
    readJson();
    super.initState();
  }

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/sample.json');
    final data = await json.decode(response);
    setState(() {
      // items = data["items"];
      // _recipe = data;
      _recipe = Recipe.fromJson(data);
    });
  }

  navigate(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const RecipeListDetailsScreen()));
  }

  @override
  Widget build(BuildContext context) {
    List<Items> items = _recipe.items ?? [];

    return Scaffold(
      appBar: AppBar(title: const Text("Recipe List")),
      body: Container(
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
                            subtitle: Text(items[index].description),
                            onTap: () => navigate(context),
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
