import 'package:mobx/mobx.dart';

part 'navigate_state.g.dart';

class NavigateState = _NavigateState with _$NavigateState;

abstract class _NavigateState with Store {
  @observable
  int page = 0;
}
