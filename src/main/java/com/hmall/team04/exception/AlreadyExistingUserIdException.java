package com.hmall.team04.exception;

public class AlreadyExistingUserIdException extends RuntimeException{

	private static final long serialVersionUID = 1L;

	public AlreadyExistingUserIdException(String message) {
		super(message);
	}
}
