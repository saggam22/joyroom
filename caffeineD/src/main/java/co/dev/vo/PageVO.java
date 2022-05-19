package co.dev.vo;

public class PageVO {
	
	private int startPage;
	private int endPage;
	//이전버튼, 다음버튼 활성화 여부
	private boolean prev;
	private boolean next;
	//현재 페이지 번호
	private int pageNum;
	//화면에 표시할 데이터 수
	private int amount = 10;
	//전체 게시글 수
	private int total;
	
	public PageVO(int pageNum, int amount, int total) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.total = total;
		
		this.endPage = (int)Math.ceil(this.pageNum * 0.1) * 10;
		this.startPage = this.endPage - 10 + 1;
		
		int block = (int)Math.ceil(this.total/(double)this.amount);
		
		if(this.endPage > block) {
			this.endPage = block;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < block;
		
		System.out.println("시작페이지:" + this.startPage + ", 끝페이지:" + this.endPage);
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}
	
	
	
}
