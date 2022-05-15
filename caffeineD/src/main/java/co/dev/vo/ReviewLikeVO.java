package co.dev.vo;

public class ReviewLikeVO extends ReviewVO {
	private String user;
	private String likeCheck;

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getLikeCheck() {
		return likeCheck;
	}

	public void setLikeCheck(String likeCheck) {
		this.likeCheck = likeCheck;
	}

}
