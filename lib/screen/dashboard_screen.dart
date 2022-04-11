import 'package:cook/screen/recipe_list_screen.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  navigate(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const RecipeListScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard")),
      body: Container(
        child: OutlinedButton(
          onPressed: () => navigate(context),
          child: const Text("Search"),
        ),
      ),
    );
  }
}
