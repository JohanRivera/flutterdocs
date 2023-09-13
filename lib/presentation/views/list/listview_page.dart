import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: ListView.separated(
          itemCount: ["Hola", "Adios", "Pero"].length,
          separatorBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 20.0,
                width: 30.0,
                color: Colors.red,
              ),
            );
          },
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 20.0,
                width: 30.0,
                color: Colors.blue,
                child: Text(["Hola", "Adios", "Pero"][index]),
              ),
            );
          },
        ),
      ),
    );
  }
}
