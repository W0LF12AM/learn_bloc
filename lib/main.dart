import 'package:flutter/material.dart';
import 'package:notez_appz/core/presentation/pages/auth/login_page.dart';
import 'package:notez_appz/core/presentation/pages/note/note_list_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
      url: 'https://qazmfafmlbzsyvhdskdp.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFhem1mYWZtbGJ6c3l2aGRza2RwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDY0MzQwODgsImV4cCI6MjA2MjAxMDA4OH0.CN6GlxMIx1Rg6btns253VuOjsv_xr8cAVMlRN2DYwgI');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final session = Supabase.instance.client.auth.currentSession;

    return MaterialApp(
      title: 'Note App',
      debugShowCheckedModeBanner: false,
      home: session != null ? const NoteListPage() : const LoginPage(),
    );
  }
}
