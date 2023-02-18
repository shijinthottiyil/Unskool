import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:unskool/view/screen/screen_splash.dart';

class ScreenAccount extends StatelessWidget {
  const ScreenAccount({super.key});

  @override
  Widget build(BuildContext context) {
    const FlutterSecureStorage storage = FlutterSecureStorage();
    return Scaffold(
      appBar: AppBar(
        title: Text("Account!"),
      ),
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
