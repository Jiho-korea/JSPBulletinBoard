package jspBulletinBoard.vo;

public class BoardRequest {
	private int pageNumber;
	private String title;

	public BoardRequest(int pageNumber, String title) {
		super();
		this.pageNumber = pageNumber;
		this.title = title;
	}

	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

}
