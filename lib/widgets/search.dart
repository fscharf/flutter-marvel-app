import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nome do Personagem',
              style: TextStyle(
                color: theme.primaryColor,
                fontSize: 16,
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'e.g. Tony Stark',
                contentPadding: EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 8,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
