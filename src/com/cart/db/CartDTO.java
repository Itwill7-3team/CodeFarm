package com.cart.db;

import com.basket.db.BasketDTO;
import com.lecture.db.LectureDTO;
import com.wishlist.db.WishlistDTO;

public class CartDTO {
	private WishlistDTO wishdata;
	private LectureDTO lecturedata;
	private BasketDTO basketdata;
	public WishlistDTO getWishdata() {
		return wishdata;
	}
	public void setWishdata(WishlistDTO wishdata) {
		this.wishdata = wishdata;
	}
	public LectureDTO getLecturedata() {
		return lecturedata;
	}
	public void setLecturedata(LectureDTO lecturedata) {
		this.lecturedata = lecturedata;
	}
	public BasketDTO getBasketdata() {
		return basketdata;
	}
	public void setBasketdata(BasketDTO basketdata) {
		this.basketdata = basketdata;
	}
	@Override
	public String toString() {
		return "Carts [wishdata=" + wishdata + ", lecturedata=" + lecturedata + ", basketdata=" + basketdata + "]";
	}
	
	
	
}
