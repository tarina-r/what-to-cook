import 'dart:convert';

import 'package:cook/model/recipe.model.dart';
import 'package:cook/screen/empty_list.dart';
import 'package:cook/screen/recipe_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<String> ingredients = ["Banana","Basil Leaves", "Black Pepper","Bread","Brown Sugar","Butter","Chicken Breast","Cream Cheese","Cream of Chicken Soup","Egg","Lemon Juice","Mayonnaise","Mustard Paste","Oil","Onions","Salt", "Tomato","White Chocolate"  ];
  List<bool> ingredients1 = [false,false, false, false, false, false,false,false, false,false, false, false, false,false, false, false, false, false];
  bool timeDilation = false;
  List<Items> items = [];
  List<Items> filteredItems = [];

  @override
  initState() {
    readJson();
    super.initState();
  }

  // navigate(BuildContext context) {
  //   Navigator.push(context, MaterialPageRoute(builder: (context) => const RecipeListScreen()));
  // }

  filter(BuildContext context) {
    filteredItems = [];

    for (int i = 0; i < ingredients1.length; i++) {
      if (ingredients1[i]) {
        for (Items item in items) {
          if (item.ingredients.where((ing) => ingredients[i] == ing.title).isNotEmpty && !filteredItems.contains(item)) {
            filteredItems.add(item);
          }
        }
      }
    }
    // print(filteredItems);
    // filteredItems.forEach((element) {
      //print(element.name);

    // });
    if (filteredItems.isEmpty)
      {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const EmptyList()));
      }
    else
    {Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeListScreen(items: filteredItems)));
    }
  }

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/sample.json');
    final data = await json.decode(response);
    Recipe recipe = Recipe.fromJson(data);
    setState(() => items = recipe.items ?? []);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Choose Your Ingredients!!!!")),

      body: SingleChildScrollView(
        // child:Container(
        // constraints: const BoxConstraints.expand(),
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage("assets/images/white-background.jpg"),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: Column(

          children: [
            Column(
              children: ingredients.map((item) {
                int index = ingredients.indexOf(item);

                return CheckboxListTile(
                  title: Text(item),
                  value: ingredients1[index],
                  onChanged: (bool? value) {
                    setState(() {
                      ingredients1[index] = value ?? false;
                    });
                  },
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => filter(context),
                  child: const Text("Search"),
                ),
              ),
            ),
          ],
        ),
      )

    );
  }
}
