import 'package:flutter/foundation.dart';


@immutable
class ChatNewModel {

  const ChatNewModel({
    required this.id,
    required this.posisi,
    required this.chat,
    required this.createdDate,
    required this.type,
    required this.status,
  });

  final int id;
  final String posisi;
  final String chat;
  final String createdDate;
  final String type;
  final String status;

  factory ChatNewModel.fromJson(Map<String,dynamic> json) => ChatNewModel(
    id: json['id'] as int,
    posisi: json['posisi'].toString(),
    chat: json['chat'].toString(),
    createdDate: json['createdDate'].toString(),
    type: json['type'].toString(),
    status: json['status'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'id': id,
    'posisi': posisi,
    'chat': chat,
    'createdDate': createdDate,
    'type': type,
    'status': status
  };

  ChatNewModel clone() => ChatNewModel(
    id: id,
    posisi: posisi,
    chat: chat,
    createdDate: createdDate,
    type: type,
    status: status
  );


  ChatNewModel copyWith({
    int? id,
    String? posisi,
    String? chat,
    String? createdDate,
    String? type,
    String? status
  }) => ChatNewModel(
    id: id ?? this.id,
    posisi: posisi ?? this.posisi,
    chat: chat ?? this.chat,
    createdDate: createdDate ?? this.createdDate,
    type: type ?? this.type,
    status: status ?? this.status,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ChatNewModel && id == other.id && posisi == other.posisi && chat == other.chat && createdDate == other.createdDate && type == other.type && status == other.status;

  @override
  int get hashCode => id.hashCode ^ posisi.hashCode ^ chat.hashCode ^ createdDate.hashCode ^ type.hashCode ^ status.hashCode;
}
