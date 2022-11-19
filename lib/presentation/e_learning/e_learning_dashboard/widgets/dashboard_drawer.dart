import 'package:academic_master/application/auth/auth_bloc.dart';
import 'package:academic_master/presentation/auth/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 16),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('Logout'),
          onTap: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => SignInPage()),
            );
            context.read<AuthBloc>().add(const AuthEvent.signOut());
          },
        ),
      ],
    );
  }
}
