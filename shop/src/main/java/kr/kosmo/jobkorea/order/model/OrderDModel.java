package kr.kosmo.jobkorea.order.model;

public class OrderDModel {



	// 게시판 글 번호
	private int row_num;

	// 상품 명
	private String food_name;

	// 상품 종류
	private String food_type2;

	// 상품 가격
	private int sale_price;

	// 재고 수량
	private int stock_count;
	
	
	private String food_type;
	
	private String food_id;	
	

	public String getFood_id() {
		return food_id;
	}

	public void setFood_id(String food_id) {
		this.food_id = food_id;
	}

	public String getFood_type() {
		return food_type;
	}

	public void setFood_type(String food_type) {
		this.food_type = food_type;
	}

	public int getRow_num() {
		return row_num;
	}

	public void setRow_num(int row_num) {
		this.row_num = row_num;
	}

	public String getFood_name() {
		return food_name;
	}

	public void setFood_name(String food_name) {
		this.food_name = food_name;
	}

	public String getFood_type2() {
		return food_type2;
	}

	public void setFood_type2(String food_type2) {
		this.food_type2 = food_type2;
	}

	public int getSale_price() {
		return sale_price;
	}

	public void setSale_price(int sale_price) {
		this.sale_price = sale_price;
	}

	public int getStock_count() {
		return stock_count;
	}

	public void setStock_count(int stock_count) {
		this.stock_count = stock_count;
	}
}
