import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:unskool/view/screen/screen_splash.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const ScreenSplash();
                },
              ),
              (route) => false,
            );
            await storage.delete(key: 'jwtToken');
            // var token = await storage.read(key: 'jwtToken');
            // log(int.parse(token.toString()));
            // ignore: use_build_context_synchronously
          },
          child: Text('Logout'),
        ),
      ),
    );
  }
}
