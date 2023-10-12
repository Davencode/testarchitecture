import 'package:flutter/material.dart';
import 'package:testarchitecture/utils/constants.dart';

class ProfileScreen extends StatelessWidget {

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.profile),
      ),
      body: Center(
        child: Text('Questa è la pagina del profilo.'),
      ),
    );
  }
}