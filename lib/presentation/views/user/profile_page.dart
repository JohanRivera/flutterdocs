import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:go_router/go_router.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop("Johan Rivera"),
        ),
      ),
      floatingActionButton: Link(
        uri: Uri.parse("https://github.com/chunhtai"),
        builder: (context, followLink) => FloatingActionButton(
          onPressed: followLink,
          child: const Icon(
            Icons.language,
          ),
        ),
        target: LinkTarget.blank,
      ),
    );
  }
}
