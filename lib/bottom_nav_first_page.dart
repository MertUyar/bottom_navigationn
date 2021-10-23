import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'character_info.dart';

class CharacterList extends StatefulWidget {
  const CharacterList({Key? key}) : super(key: key);

  @override
  _CharacterListState createState() => _CharacterListState();
}

class _CharacterListState extends State<CharacterList> {
  late Future<RickyAndMortyResponse> futureAlbum;


  @override
  void initState() {
    super.initState();
    futureAlbum = fetchCharacterList();
  }

  Future<RickyAndMortyResponse> fetchCharacterList() async {
    final response =
    await http.get(Uri.parse('https://rickandmortyapi.com/api/character'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return RickyAndMortyResponse.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('fetch data'),
      ),
      body: SafeArea(
        child: FutureBuilder<RickyAndMortyResponse>(
          future: futureAlbum,
          builder: (context,snapshot) {
            if (snapshot.hasData) {
              List<Result>? results = snapshot.data?.results;
              return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: results?.length,
                itemBuilder: (BuildContext context, int index) {
                  Result result = results![index];
                  return DisplayCharacters(result);
                },
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  Padding DisplayCharacters(result) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 154,
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10))),
                child: Image.network(
                  result.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                decoration: const BoxDecoration(
                    color: Color(0xFF616161),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        result.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Container(
                            height: 7,
                            width: 7,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: result.status == 'Alive'
                                  ? Colors.green
                                  : Colors.red,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            '${result.status} - ${result.species}',
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 9),
                      const Text(
                        'Last known location:',
                        style: TextStyle(
                          color: Color(0xFFBDBDBD),
                          fontSize: 11,
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        result.location.name,
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'First seen in:',
                        style: TextStyle(
                          color: Color(0xFFBDBDBD),
                          fontSize: 11,
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        result.origin.name,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
