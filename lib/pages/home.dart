import 'package:flutter/material.dart';
import 'package:marvel_portal/widgets/characters_table.dart';
import 'package:marvel_portal/widgets/search.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          top: 32,
          bottom: 12,
          left: 30,
          right: 30,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'BUSCA MARVEL',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: theme.primaryColor,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'TESTE FRONT-END',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: theme.primaryColor,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const Expanded(
              child: Search(),
            ),
            const Expanded(flex: 6, child: CharactersTable())
          ],
        ),
      ),
    );
  }
}
