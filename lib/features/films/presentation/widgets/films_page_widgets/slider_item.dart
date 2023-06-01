import 'package:beamer/beamer.dart';
import 'package:cine_me/core/constants/font_styling.dart';
import 'package:cine_me/features/films/data/models/film_model.dart';
import 'package:cine_me/features/films/presentation/widgets/films_page_widgets/custom_red_button.dart';
import 'package:flutter/material.dart';

class MySliderItem extends StatelessWidget {
  final FilmModel filmModel;
  final String detailsPath;
  const MySliderItem({
    Key? key,
    required this.filmModel,
    required this.detailsPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(filmModel.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20.0),
        Text(
          filmModel.name,
          style: notoSansDisplayBoldSmall,
        ),
        const SizedBox(height: 20.0),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
          child: CustomButton(
            onPressed: () {
              Beamer.of(context)
                  .beamToNamed('$detailsPath?filmName=${filmModel.name}');
            },
            text: 'Деталі',
          ),
        ),
        const SizedBox(height: 10.0),
      ],
    );
  }
}