import 'package:flutter/material.dart';
import 'package:grofast/core/core.dart';

import '../../../../dependency_setup.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ZoomTapAnimation(
          onTap: () {
            print(localSource.expiresIn);
          },
          child: const FlutterLogo(size: 100),
        ),
      ),
    );
  }
}
