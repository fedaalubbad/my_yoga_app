
import '../dbHelper.dart';

class User {
	String email;
	String password;
	User(this.email, this.password);
	User.fromMap(Map map) {
		this.email = map[DBHelper.userNameColumnName];
		this.password = map[DBHelper.userPasswordColumnName];
	}
	toJson() {
		return {
			DBHelper.userNameColumnName: this.email,
			DBHelper.userPasswordColumnName: this.password
		};
	}
}
