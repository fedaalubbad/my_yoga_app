
import '../dbHelper.dart';

class User {
	String email;
	String password;
	String image;
	double progress;
	double weight;
	double height;
	User(this.email, this.password,this.image,this.weight,this.height,this.progress);

	User.fromMap(Map map) {
		this.email = map[DBHelper.userNameColumnName];
		this.password = map[DBHelper.userPasswordColumnName];
		this.image = map[DBHelper.userImageColumnName];
		this.weight = map[DBHelper.userWeightColumnName];
		this.height = map[DBHelper.userHeightColumnName];
		this.progress = map[DBHelper.userProgressColumnName];
	}
	toJson() {
		return {
			DBHelper.userNameColumnName: this.email,
			DBHelper.userPasswordColumnName: this.password,
			DBHelper.userImageColumnName: this.image,
			DBHelper.userWeightColumnName: this.weight,
			DBHelper.userHeightColumnName: this.height,
			DBHelper.userProgressColumnName: this.progress
		};
	}
}
