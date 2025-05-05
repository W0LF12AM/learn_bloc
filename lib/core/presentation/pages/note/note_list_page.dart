import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NoteListPage extends StatelessWidget {
  const NoteListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Supabase.instance.client.auth.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
        actions: [
          IconButton(
              onPressed: () async {
                await Supabase.instance.client.auth.signOut();
                Navigator.pushReplacementNamed(context, '/');
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Text('Halo, ${user?.email ?? "User"}'),
      ),
    );
  }
}
