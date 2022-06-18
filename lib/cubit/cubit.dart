import 'package:BookHub/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(initialState());

  static AppCubit get(context) => BlocProvider.of(context);

}