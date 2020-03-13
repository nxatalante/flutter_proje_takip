
class UserData {
  String userName;
  String password,passwordCorrection;
  String email;
  DateTime registerDate ;

  
  String get username {
    return userName;
  }

  set username(String username) {
    this.userName = username;
  }

  String get userEmail {
    return email;
  }

  set userEmail(String email) {
    this.email = email;
  }


String get userPassword {
    return password;
  }

  set userPassword(String password) {
    this.password = password;
  }


String get userPasswordCorrection {
    return passwordCorrection;
  }

  set userPasswordCorrection(String passwordCorrection) {
    this.passwordCorrection = passwordCorrection;
  }


DateTime get userRegisterDate {
    return registerDate;
  }

  set userRegisterDate(DateTime time) {
    this.registerDate = time;
  }

}


