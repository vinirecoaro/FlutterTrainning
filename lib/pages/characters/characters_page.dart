import 'package:flutter/material.dart';
import 'package:trilhaapp/model/characters_model.dart';
import 'package:trilhaapp/repositories/marvel/marvel_repository.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({super.key});

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  late MarvelRepository marvelRepository;
  var characters = CharactersModel();

  @override
  void initState() {
    marvelRepository = MarvelRepository();
    super.initState();
    loadData();
  }

  loadData() async {
    characters = await marvelRepository.getCharacters();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: Container(
        child: ListView.builder(
            itemCount:
                (characters.data == null || characters.data!.results == null)
                    ? 0
                    : characters.data!.results!.length,
            itemBuilder: (_, int index) {
              var character = characters.data!.results![index];
              return Card(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      "${character.thumbnail!.path!}.${character.thumbnail!.extension!}",
                      width: 150,
                      height: 150,
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              character.name!,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            Text(character.description!),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    ));
  }
}
