void main() {
  // code for view part
  UserRemoteDataSource urd = UserRemoteDataSource();
  TestImpl test = TestImpl(urd);
  TestClass tc = TestClass(test);
  

  GetUserList userList = GetUserList(test);
  List<UserEntity> users = userList.call();
  print("Total number of users are ${users.length}");
  for(int i =0; i< users.length; i++){
    print("User no ${users[i].id}'s name is ${users[i].name}");
  }

  UserEntity user = tc.call(users[0]);
  print("${user.name}'s email ID is ${user.email}");
}

// Entity
class UserEntity {
  int? id;
  String? name;
  String? email;

  UserEntity({
    this.id,
    this.name,
    this.email,
  });
}

// Use case Domain
class TestClass {
  final Test test;

  TestClass(this.test);

  UserEntity call(UserEntity user) {
    return test.testMethod(user);
  }
}

class GetUserList{
  final Test test;

  GetUserList(this.test);

  List<UserEntity> call(){
    return test.getUserList();
  }
}

// Domain Rep
abstract class Test {
  UserEntity testMethod(UserEntity user);
  List<UserEntity> getUserList();
}

// Model
class UserModel {
  int? id;
  String? name;
  String? email;
  UserModel({
    this.id,
    this.name,
    this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }

  factory UserModel.fromEntity(UserEntity userEntity) {
    return UserModel(
      id: userEntity.id,
      name: userEntity.name,
      email: userEntity.email,
    );
  }

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      name: name,
      email: email,
    );
  }
}

// Data Rep
class TestImpl implements Test {
  final UserRemoteDataSource urd;

  TestImpl(this.urd);
  @override
  UserEntity testMethod(id) {
    UserModel user = urd.signInUser(id);
    return user.toEntity();
  }
  
  @override
  List<UserEntity> getUserList(){
    List<UserModel> userModelList = urd.getUserList();
    List<UserEntity> userEntityList = userModelList.map((model) => model.toEntity()).toList();
    return userEntityList;
  }
}

// Data Source
class UserRemoteDataSource {
  UserModel signInUser(UserEntity userData) {
    ApiData apiData = ApiData.fromJson(response);
    List<UserModel> userList = [];
    UserModel user = UserModel(id:0, name: "Undefined", email: "notFound");
    userList.addAll(apiData.data);
    for(int i= 0; i < userList.length; i++){
      if(userData.id == userList[i].id){
         user =userList[i];
      }
    }
    return user;
  }

  List<UserModel> getUserList(){
    ApiData apiData = ApiData.fromJson(response);
    List<UserModel> userList = [];
     userList.addAll(apiData.data);
     return userList;
  }
}

class ApiData {
    List<UserModel> data;

    ApiData({
        required this.data,
    });

    factory ApiData.fromJson(Map<String, dynamic> json) => ApiData(
        data: List<UserModel>.from(json["data"].map((x) => UserModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}


var response = {
  "data": [
    {"id": 1, "name": "Omi", "email": "omi@gmail.com"},
    {"id": 2, "name": "John", "email": "john@gmail.com"},
    {"id": 3, "name": "Clair", "email": "clair@gmail.com"},
    {"id": 4, "name": "Clark", "email": "clark@gmail.com"},
  ]
};
