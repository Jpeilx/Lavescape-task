part of 'search_result_cubit.dart';

sealed class SearchResultStates {}

final class SearchResultInitial extends SearchResultStates {}
final class ShowOrHideMapViewState extends SearchResultStates {}

