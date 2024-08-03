import 'package:final_project_beginner/model/anime_list.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final AnimeList anime;

  const DetailPage({ required this.anime, super.key });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(anime.title),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16, right: 16, bottom: 16
          ),
          child:
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 275,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: SizedBox(
                          width: 175,
                          height: 250,
                          child: Image.network(
                              anime.imageUrl,
                          fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 15),
                            Text(
                              anime.title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                              ),
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Episodes: ${anime.episode}"
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Status: ${anime.status}"
                            ),
                            const SizedBox(height: 10),
                            Text(
                                "Genre: ${anime.genres}"
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Synopsis:\n${anime.synopsis}",
                    textAlign: TextAlign.justify,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: const SaveAnime(),
    );
  }
}

class SaveAnime extends StatefulWidget {
  const SaveAnime({ super.key });

  @override
  _SaveAnimeState createState() => _SaveAnimeState();
}

class _SaveAnimeState extends State<SaveAnime>{
  var isSaved = false;

  @override
  Widget build(BuildContext context){
    return FloatingActionButton(
      child: Icon(
          isSaved ? Icons.bookmark : Icons.bookmark_border_outlined
      ),
      onPressed: () {
        setState(() {
          isSaved = !isSaved;
        });
      });
  }
}