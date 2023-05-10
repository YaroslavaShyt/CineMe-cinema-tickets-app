import 'package:cine_me/features/films/data/models/film_model.dart';
import 'package:cine_me/features/films/data/models/is_payment_success_model.dart';
import 'package:cine_me/features/films/data/models/is_ticket_booked.dart';
import 'package:dartz/dartz.dart';
import 'package:cine_me/features/authentification/domain/entities/app_error_entity.dart';
import 'package:cine_me/features/films/data/models/film_session_model.dart';

abstract class FilmsRepository{
  Future<Either<AppError, List<FilmModel>>> getTodayFilms ({String search = ''});
  Future<Either<AppError, List<FilmSessionModel>>> getFilmSessions({String filmId='', String sessionId=''});
  Future<Either<AppError, IsTicketBooked>> getIsTicketBooked(int sessionId, List<int> seats);
  Future<Either<AppError, IsPaymentSuccess>>
  getIsPaymentSuccess(int sessionId, List<int> seats, String email, String cvv, String cardNumber, String expirationDat );
}