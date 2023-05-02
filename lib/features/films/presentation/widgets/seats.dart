import 'package:cine_me/core/constants/colors.dart';
import 'package:cine_me/features/films/data/models/film_session_model.dart';
import 'package:cine_me/features/films/presentation/widgets/dialog.dart';
import 'package:flutter/material.dart';

class Seats extends StatelessWidget {
  final List<FilmSessionModel> seats;
  final Function(int) onSeatPressed;
  const Seats({Key? key, required this.seats, required this.onSeatPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          for (var k = 0; k < seats.length; k++)
            for (var i = 0; i < seats[k].room['rows'].length; i++)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var j = 0; j < seats[k].room['rows'][i]['seats'].length; j++)
                    if(seats[k].room['rows'][i]['seats'][j]['isAvailable'])
                       SeatActiveButton(
                         text: '${seats[k].room['rows'][i]['index']}${seats[k].room['rows'][i]['seats'][j]['index']}',
                         onSeatPressed: onSeatPressed,
                         seatId: seats[k].room['rows'][i]['seats'][j]['id'],
                       )
                    else
                      SeatInactiveButton(text: '${seats[k].room['rows'][i]['index']}${seats[k].room['rows'][i]['seats'][j]['index']}')
                ],
              ),
        ]);
  }
}

class SeatActiveButton extends StatefulWidget {
  final String text;
  bool isActive = true;
  final int seatId;
  final Function(int) onSeatPressed;
  SeatActiveButton({Key? key, required this.text, required this.onSeatPressed, required this.seatId}) : super(key: key);

  @override
  State<SeatActiveButton> createState() => _SeatActiveButtonState();
}

class _SeatActiveButtonState extends State<SeatActiveButton> {
  late Color buttonColor;

  @override
  void initState() {
    super.initState();
    widget.isActive ? buttonColor = green : buttonColor = red;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(30, 40),
          backgroundColor: buttonColor
        ),
        onPressed: (){
          setState(() {
            widget.isActive = !widget.isActive;
            widget.isActive ? buttonColor = green : buttonColor = red;
            widget.onSeatPressed(widget.seatId);
          });
        },
        child: Text(widget.text));
  }
}

class SeatInactiveButton extends StatelessWidget {
  final String text;
  const SeatInactiveButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
        minimumSize: const Size(30, 40),
    backgroundColor: red
    ), onPressed: () {},
    child: Text(text),);
  }
}