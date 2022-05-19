package co.dev.vo;

public class PageVO {
	
	//시작 블럭번호
	private int startPage;
	private int endPage;
	// 현재 페이지 번호
	private int pageNum = 1;
	// 화면에 표시할 데이터 수
	private int amount = 10;
	// 화면에 표시할 블럭 수
	private int block = 10;
	// 전체 게시글 수
	private int total;
	// 이전버튼, 다음버튼 활성화 여부
	private boolean prev;
	private boolean next;

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

	public int getBlock() {
		return block;
	}

	public void setBlock(int block) {
		this.block = block;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
		paging();
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

	
	private void paging() {
		
		block = (int)Math.ceil(total / (double)amount);
		endPage = ((int) Math.ceil(pageNum / (double) block)) * block;
		System.out.println("마지막페이지 : " + endPage);

		startPage = endPage - (block - 1);
		System.out.println("시작페이지 : " + startPage);
		
		int totalPage = (int)Math.ceil(total/(double)amount);
		
		if(totalPage<endPage){
            endPage = totalPage;
            next = false;
        }else{
            next = true;
        }
        prev = (startPage==1)?false:true; //page가 11이상에만 나온다.
        System.out.println("마지막페이지 : " + endPage);
        System.out.println("전체페이지 : " + totalPage);
	}
}
