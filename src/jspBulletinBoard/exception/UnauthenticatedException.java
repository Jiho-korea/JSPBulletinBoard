package jspBulletinBoard.exception;

// 권한 없을 때 
public class UnauthenticatedException extends RuntimeException {
	public UnauthenticatedException(String message) {
		super(message);
	}

}
