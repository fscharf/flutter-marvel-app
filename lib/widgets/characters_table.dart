import 'package:flutter/material.dart';
import 'package:marvel_portal/controllers/marvel.dart';
import 'package:marvel_portal/models/marvel.dart';

class CharactersTable extends StatefulWidget {
  const CharactersTable({super.key});

  @override
  State<CharactersTable> createState() => _CharactersTableState();
}

class _CharactersTableState extends State<CharactersTable> {
  MarvelController marvelController = MarvelController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      body: FutureBuilder(
        future: marvelController.fetchCharacters(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final characters = snapshot.data!;
            return SingleChildScrollView(
              child: DataTable(
                headingRowColor: MaterialStateColor.resolveWith(
                  (states) => theme.primaryColor,
                ),
                headingTextStyle: const TextStyle(color: Color(0xFFEEEEEE)),
                columnSpacing: 32,
                columns: _createColumns(),
                rows: _createRows(characters, theme),
              ),
            );
          }

          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          return Center(
            child: CircularProgressIndicator(color: theme.primaryColor),
          );
        },
      ),
    );
  }

  List<DataColumn> _createColumns() {
    List<String> titles = ['Nome', 'Séries', 'Eventos'];

    return titles
        .map<DataColumn>(
          (title) => DataColumn(
            label: Expanded(child: Text(title)),
          ),
        )
        .toList();
  }

  List<DataRow> _createRows(List<CharacterModel> characters, ThemeData theme) {
    return characters.map<DataRow>((character) {
      return DataRow(
        cells: [
          DataCell(Text(character.name)),
          DataCell(
            FutureBuilder(
              future: marvelController.fetchSeries(character.id),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final series = snapshot.data!;
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Column(
                      children: series.take(3).map<Widget>((serie) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Text(serie.title),
                        );
                      }).toList(),
                    ),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(
                    color: theme.primaryColor,
                  ),
                );
              },
            ),
          ),
          DataCell(
            FutureBuilder(
              future: marvelController.fetchEvents(character.id),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final events = snapshot.data!;
                  return Stack(
                    children: events.take(3).map<Widget>((event) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Text(event.title),
                      );
                    }).toList(),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(
                    color: theme.primaryColor,
                  ),
                );
              },
            ),
          )
        ],
      );
    }).toList();
  }
}
