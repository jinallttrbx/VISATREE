class ChatModel {
  List<SingleChatData>? data;
  bool? status;
  String? message;

  ChatModel({this.data, this.status, this.message});

  ChatModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <SingleChatData>[];
      json['data'].forEach((v) {
        data!.add(SingleChatData.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}

class SingleChatData {
  int? id;
  int? senderId;
  int? receiverId;
  String? messageType;
  String? type;
  int? status;
  String? message;
  String? createdAt;
  String? updatedAt;
  String? senderName;
  String? receiverName;

  SingleChatData(
      {this.id,
        this.senderId,
        this.receiverId,
        this.messageType,
        this.type,
        this.status,
        this.message,
        this.createdAt,
        this.updatedAt,
        this.senderName,
        this.receiverName});

  SingleChatData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    senderId = json['sender_id'];
    receiverId = json['receiver_id'];
    messageType = json['message_type'];
    type = json['type'];
    status = json['status'];
    message = json['message'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    senderName = json['sender_name'];
    receiverName = json['receiver_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sender_id'] = senderId;
    data['receiver_id'] = receiverId;
    data['message_type'] = messageType;
    data['type'] = type;
    data['status'] = status;
    data['message'] = message;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['sender_name'] = senderName;
    data['receiver_name'] = receiverName;
    return data;
  }
}
