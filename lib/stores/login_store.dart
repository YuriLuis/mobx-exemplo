
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store{

  _LoginStore(){
    autorun(
        (_){
        }
    );
  }

  @observable
  bool loading = false;

  @observable
  String email = "";

  @observable
  String password = "";

  @observable
  bool passwordVisible = false;

  @observable
  bool loggedIn = false;

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  @action
  void togglePasswordVisibility() => passwordVisible = !passwordVisible;

  @action
  Future login() async{
    loading = true;

   await Future.delayed(Duration(seconds: 2));
    loading = false;
    loggedIn = true;

    email = '';
    password = '';
  }

  @computed
  bool get isEmailValid => email.contains("@") && email.contains(".com");

  @computed
  bool get isPasswordValid => password.length >= 6;


  @computed
  Function get loginPressed =>
      (isEmailValid && isPasswordValid && !loading) ? login : null;

  @action
  void logout(){
    loggedIn = false;
  }
}