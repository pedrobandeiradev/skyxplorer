import 'package:flutter/material.dart';

import '../consts/assets_path_consts.dart';

class DefaultError extends StatelessWidget {
  const DefaultError({
    Key? key,
    this.error,
  }) : super(key: key);

  final String? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.asset(
              AssetsPath.error,
            ),
            Text(
              error ?? 'Erro durante a operacao',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
