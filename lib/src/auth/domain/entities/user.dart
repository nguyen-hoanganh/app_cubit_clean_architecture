import 'package:equatable/equatable.dart';

class LocalUser extends Equatable {
  const LocalUser({
    required this.uid,
    required this.email,
    this.profilePic,
    this.bio,
    required this.points,
    required this.fullName,
    required this.groupId,
    required this.enrolledCourseIds,
    required this.following,
    required this.follower,
  });

  const LocalUser.empty()
      : this(
          uid: '',
          email: '',
          points: '',
          fullName: '',
          profilePic: '',
          bio: '',
          groupId: const [],
          enrolledCourseIds: const [],
          follower: const [],
          following: const [],
        );

  final String uid;
  final String email;
  final String? profilePic;
  final String? bio;
  final String points;
  final String fullName;
  final List<String> groupId;
  final List<String> enrolledCourseIds;
  final List<String> following;
  final List<String> follower;

  @override
  List<Object?> get props => [uid, email];

  @override
  String toString() {
    return 'LocalUser{uid: $uid, email: $email, bio: '
        '$bio, points: $points, fullName: $fullName}';
  }
}
