import 'package:limadi_riverpod_clean_architecture/features/auth/domain/entities/user_entity.dart';

class User{
  int? id;
  String? name;
  String? email;
  String? phone;
   User({
     this.id,
     this.name,
     this.email,
     this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
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

 
}

class UserModel {
    int? id;
    String? image;
    String? userName;
    String? referralCode;
    String? firstName;
    String? lastName;
    String? email;
    dynamic phone;
    String? gender;
    DateTime? dob;
    List<dynamic> profession;
    List<String> interest;
    String? bio;
    List<String> languages;
    String? status;
    dynamic blockTill;
    dynamic otp;
    dynamic refId;
    String? relation;
    String? relationWithName;
    int? relationWithId;
    DateTime? relationSince;
    String? cover;
    dynamic badge;
    dynamic socialProvider;
    String? referralUrl;
    String? fullName;
    String? profilePicture;
    String? coverPhoto;
    String? currentBadge;
    int? friendStatus;
    int? followStatus;
    dynamic familyRelationStatus;
    int? mutualFriend;
    int? starBalance;

    UserModel({
        required this.id,
        required this.image,
        required this.userName,
        required this.referralCode,
        required this.firstName,
        required this.lastName,
        required this.email,
        required this.phone,
        required this.gender,
        required this.dob,
        required this.profession,
        required this.interest,
        required this.bio,
        required this.languages,
        required this.status,
        required this.blockTill,
        required this.otp,
        required this.refId,
        required this.relation,
        required this.relationWithName,
        required this.relationWithId,
        required this.relationSince,
        required this.cover,
        required this.badge,
        required this.socialProvider,
        required this.referralUrl,
        required this.fullName,
        required this.profilePicture,
        required this.coverPhoto,
        required this.currentBadge,
        required this.friendStatus,
        required this.followStatus,
        required this.familyRelationStatus,
        required this.mutualFriend,
        this.starBalance,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        image: json["image"],
        userName: json["user_name"],
        referralCode: json["referral_code"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        phone: json["phone"],
        gender: json["gender"],
        dob: DateTime.parse(json["dob"]),
        profession: List<dynamic>.from(json["profession"].map((x) => x)),
        interest: List<String>.from(json["interest"].map((x) => x)),
        bio: json["bio"],
        languages: List<String>.from(json["languages"].map((x) => x)),
        status: json["status"],
        blockTill: json["block_till"],
        otp: json["otp"],
        refId: json["ref_id"],
        relation: json["relation"],
        relationWithName: json["relation_with_name"],
        relationWithId: json["relation_with_id"],
        relationSince: json["relation_since"]==null? null:DateTime.parse(json["relation_since"]),
        cover: json["cover"],
        badge: json["badge"],
        socialProvider: json["social_provider"],
        referralUrl: json["referral_url"],
        fullName: json["full_name"],
        profilePicture: json["profile_picture"],
        coverPhoto: json["cover_photo"],
        currentBadge: json["current_badge"],
        friendStatus: json["friend_status"],
        followStatus: json["follow_status"],
        familyRelationStatus: json["family_relation_status"],
        mutualFriend: json["mutual_friend"],
        starBalance: json["star_balance"],
    );

     factory UserModel.fromEntity(UserEntity userEntity) {
    return UserModel(
        id: userEntity.id,
        image: userEntity.image,
        userName: userEntity.userName,
        referralCode: userEntity.referralCode,
        firstName: userEntity.firstName,
        lastName: userEntity.lastName,
        email: userEntity.email,
        phone: userEntity.phone,
        gender: userEntity.gender,
        dob: userEntity.dob,
        profession: userEntity.profession,
        interest: userEntity.interest,
        bio: userEntity.bio,
        languages: userEntity.languages,
        status: userEntity.status,
        blockTill: userEntity.blockTill,
        otp: userEntity.otp,
        refId: userEntity.refId,
        relation: userEntity.relation,
        relationWithName: userEntity.relationWithName,
        relationWithId: userEntity.relationWithId,
        relationSince: userEntity.relationSince,
        cover: userEntity.cover,
        badge: userEntity.badge,
        socialProvider: userEntity.socialProvider,
        referralUrl: userEntity.referralCode,
        fullName: userEntity.fullName,
        profilePicture: userEntity.profilePicture,
        coverPhoto: userEntity.coverPhoto,
        currentBadge: userEntity.currentBadge,
        friendStatus: userEntity.friendStatus,
        followStatus: userEntity.followStatus,
        familyRelationStatus: userEntity.familyRelationStatus,
        mutualFriend: userEntity.mutualFriend,
        starBalance: userEntity.starBalance,
    );
  }

  UserEntity toEntity() {
    return UserEntity(
      id: id,
        image: image,
        userName: userName,
        referralCode: referralCode,
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phone,
        gender: gender,
        dob: dob,
        profession: profession,
        interest: interest,
        bio: bio,
        languages: languages,
        status: status,
        blockTill: blockTill,
        otp: otp,
        refId: refId,
        relation: relation,
        relationWithName: relationWithName,
        relationWithId: relationWithId,
        relationSince: relationSince,
        cover: cover,
        badge: badge,
        socialProvider: socialProvider,
        referralUrl: referralCode,
        fullName: fullName,
        profilePicture: profilePicture,
        coverPhoto: coverPhoto,
        currentBadge: currentBadge,
        friendStatus: friendStatus,
        followStatus: followStatus,
        familyRelationStatus: familyRelationStatus,
        mutualFriend: mutualFriend,
        starBalance: starBalance,
    );
  }
}
