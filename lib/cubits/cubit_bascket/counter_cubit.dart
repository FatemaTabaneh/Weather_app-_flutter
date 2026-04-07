import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_state.dart';

class CounterCubit extends Cubit<counterTwoState>
{
  CounterCubit():super(counterA_state());

  int teamAPoints = 0;

  int teamBPoints = 0;

  void teamIncrement({required String team,required int number}){
    if(team=='A'){
    teamAPoints+=number;
    emit(counterA_state());
    }
    else{
      teamBPoints+=number;
      emit(counterB_state());
    }

  }
  void resetMethod(){
    teamAPoints=teamBPoints=0;
    emit(counterResetState());

  }

}