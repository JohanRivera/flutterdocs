import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String name;
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    name = "Sin Nombre";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home page"),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: ListView(
          controller: _controller,
          children: [
            Card(
              elevation: 20.0,
              child: ListTile(
                onTap: () => context.push("/listview"),
                leading: const Icon(
                  Icons.list,
                ),
                title: const Text(
                  "Vista de ListView",
                  textAlign: TextAlign.center,
                ),
                subtitle: const Text(
                  "Prueba listview normal",
                  textAlign: TextAlign.center,
                ),
                trailing: const Icon(Icons.arrow_forward),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var result = await context.push('/profile');
          if (result is String) {
            setState(() {
              name = result;
            });
          }
        },
        child: const Icon(
          Icons.person,
        ),
      ),
    );
  }
}
