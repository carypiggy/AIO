package com.mpri.aio.message;

public class ChatRoomRequest {
	private String name;
	private String chatValue;
	private String userId;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getChatValue() {
		return chatValue;
	}
	public void setChatValue(String chatValue) {
		this.chatValue = chatValue;
	}
	
}
