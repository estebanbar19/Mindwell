import 'dart:core';

class Message {

  String role;
  String content;


  Message(this.role, this.content);

  String getRole() {
    return role;
  }

  void setRole(String role) {
    this.role = role;
  }

  String getContent() {
    return content;
  }

  void setContent(String content) {
    this.content = content;
  }

  factory Message.fromJson(Map<String, dynamic> json){
    return Message(json["role"] as String, json["content"] as String);
  }

}