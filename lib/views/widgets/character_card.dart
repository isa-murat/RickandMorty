import 'package:flutter/material.dart';
import 'package:rickandmorty/app/locater.dart';
import 'package:rickandmorty/models/characters_model.dart';
import 'package:rickandmorty/services/preferences_service.dart';

class CharacterCard extends StatefulWidget {
  final CharacterModel characterModel;
  bool isFavorited;

  CharacterCard({
    super.key,
    required this.characterModel,
    this.isFavorited = false,
  });

  @override
  State<CharacterCard> createState() => _CharacterCardState();
}

class _CharacterCardState extends State<CharacterCard> {
  void favorited() {
    if (widget.isFavorited) {
      locator<PreferencesService>().removeCharacter(widget.characterModel.id);
      widget.isFavorited = false;
    } else {
      locator<PreferencesService>().saveCharecter(widget.characterModel.id);
      widget.isFavorited = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(6)),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(
                    widget.characterModel.image,
                    height: 100,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 6,
                    horizontal: 17,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.characterModel.name,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      _infoWidget(
                          type: 'Köken',
                          value: widget.characterModel.origin.name),
                      const SizedBox(
                        height: 4,
                      ),
                      _infoWidget(
                          type: 'Durum',
                          value:
                              '${widget.characterModel.status} - ${widget.characterModel.species}'),
                    ],
                  ),
                )
              ],
            ),
          ),
          IconButton(
            onPressed: favorited,
            icon: Icon(
                widget.isFavorited ? Icons.bookmark : Icons.bookmark_border),
          )
        ],
      ),
    );
  }

  Column _infoWidget({required String type, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          type,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w300,
          ),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
