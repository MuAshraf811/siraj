part of 'internet_connection_checker_cubit.dart';

@immutable
sealed class InternetConnectionCheckerState {}

final class InternetConnectionCheckerInitial
    extends InternetConnectionCheckerState {}

final class NoInternetConnectionState extends InternetConnectionCheckerState {}

final class InternetConnectionState extends InternetConnectionCheckerState {}
