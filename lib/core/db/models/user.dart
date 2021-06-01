
import 'dart:io';

import '../dbHelper.dart';

class User {
	String name;
	String email;
	String password;
	String image;
	double progress;
	double weight;
	double height;
	User(this.name,this.email, this.password,{this.image,this.weight=0.0,this.height=0.0,this.progress=0.0});
	User.fromMap(Map map) {
		this.name = map[DBHelper.userNameColumnName];
		this.email = map[DBHelper.userEmailColumnName];
		this.password = map[DBHelper.userPasswordColumnName];
		this.image = map[DBHelper.userImageColumnName];
		this.weight = map[DBHelper.userWeightColumnName];
		this.height = map[DBHelper.userHeightColumnName];
		this.progress = map[DBHelper.userProgressColumnName];
	         }
	toJson() {
		return {
			DBHelper.userNameColumnName: this.name,
			DBHelper.userEmailColumnName: this.email,
			DBHelper.userPasswordColumnName: this.password,
			DBHelper.userImageColumnName: this.image,
			DBHelper.userWeightColumnName: this.weight,
			DBHelper.userHeightColumnName: this.height,
			DBHelper.userProgressColumnName: this.progress
		};
	}
}
