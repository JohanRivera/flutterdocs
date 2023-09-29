// Stateful nested navigation based on:
// https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNestedNavigation extends StatefulWidget {
  const ScaffoldWithNestedNavigation({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;

  @override
  State<ScaffoldWithNestedNavigation> createState() => _ScaffoldWithNestedNavigationState();
}

class _ScaffoldWithNestedNavigationState extends State<ScaffoldWithNestedNavigation> {
  void _goBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  // bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            NavigationRail(
              // extended: _isExpanded,
              backgroundColor: Colors.grey,
              onDestinationSelected: _goBranch,
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.person),
                  label: Text("Persona"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.catching_pokemon),
                  label: Text("Pokemon"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.airplanemode_active),
                  label: Text("Modo avion"),
                ),
              ],
              selectedIndex: widget.navigationShell.currentIndex,
            ),
            Expanded(
              child: widget.navigationShell,
            ),
          ],
        ),
      ),
    );
  }
}
