import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/books_screen.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Supabase.instance.client.auth.onAuthStateChange,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final session = snapshot.hasData ? snapshot.data!.session : null;
        if (session != null) {
          return const BooksScreen();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
