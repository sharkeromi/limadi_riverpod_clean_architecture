import 'package:limadi_riverpod_clean_architecture/features/auth/domain/entities/user_entity.dart';

class UserModel{
  int? id;
  String? name;
  String? email;
  String? phone;
   UserModel({
     this.id,
     this.name,
     this.email,
     this.phone,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
    };
  }

  factory UserModel.fromEntity(UserEntity userEntity) {
    return UserModel(
      id: userEntity.id,
      name: userEntity.name,
      email: userEntity.email,
      phone: userEntity.phone,
    );
  }

  UserEntity toEntity() {
    return UserEntity(
      id: id, 
      name: name,
      email: email ,
      phone: phone,
    );
  }
}
