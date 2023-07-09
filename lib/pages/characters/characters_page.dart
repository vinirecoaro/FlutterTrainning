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
  int offset = 0;
  var loading = false;

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      var positionToPaging = _scrollController.position.maxScrollExtent * 0.7;
      if (_scrollController.position.pixels > positionToPaging) {
        loadData();
      }
      print(_scrollController.position.pixels);
      print(_scrollController.position.maxScrollExtent);
    });
    marvelRepository = MarvelRepository();
    super.initState();
    loadData();
  }

  loadData() async {
    if (loading) return;
    if (characters.data == null || characters.data!.results == null) {
      characters = await marvelRepository.getCharacters(offset);
    } else {
      loading = true;
      setState(() {});
      offset = offset + characters.data!.count!;
      var tempList = await marvelRepository.getCharacters(offset);
      characters.data!.results!.addAll(tempList.data!.results!);
      loading = false;
    }

    setState(() {});
  }

  int returnTotalAmount() {
    try {
      return characters.data!.total!;
    } catch (e) {
      return 0;
    }
  }

  int returnCurrentAmount() {
    try {
      return offset + characters.data!.count!;
    } catch (e) {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title:
            Text("Heróis: ${returnCurrentAmount()} / ${returnTotalAmount()}"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                controller: _scrollController,
                itemCount: (characters.data == null ||
                        characters.data!.results == null)
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
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
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
          !loading
              ? ElevatedButton(
                  onPressed: () {
                    loadData();
                  },
                  child: Text("Carregar mais itens"))
              : CircularProgressIndicator()
        ],
      ),
    ));
  }
}
