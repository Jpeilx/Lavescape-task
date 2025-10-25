import 'package:flutter_bloc/flutter_bloc.dart';
part 'search_result_state.dart';

class SearchResultCubit extends Cubit<SearchResultStates> {
  static SearchResultCubit get(context) =>  BlocProvider.of(context);
  SearchResultCubit() : super(SearchResultInitial());
  bool showMapView = false ; 
  bool showLavescapeCardOnTheMap = false ;
  void showOrHideMapView(){
    if (showMapView){
      showMapView = false ;
    }
    else {
      showMapView = true ; 
    }
    emit(ShowOrHideMapViewState()) ;
  }
  void showOrHideLavescapeCardOnTheMap (){
    if (showLavescapeCardOnTheMap){
      showLavescapeCardOnTheMap = false ;
    }
    else {
      showLavescapeCardOnTheMap = true ; 
    }
    emit(ShowOrHideMapViewState()) ;
  }
}
