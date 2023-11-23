class Message{
  String role;
  String content;

  Message(this.role, this.content);

  Map<String, dynamic> toJson() => {
    "role": role,
    "content": content
  };
}