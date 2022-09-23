function fn_addCart(idx) {
  //idx 값에는 product_idx가 담김. 장바구니 버튼 위치 line 096

  let cart_product_number = 1; // 담을 물건 숫자

  $.ajax({
    type: "post",
    url: "${MaruContextPath}/cart/add_process?product_idx=" + idx + "&cart_product_number=" + cart_product_number,
    data: {
      product_idx: idx,
      cart_product_number: cart_product_number,
    },
    success: function () {
      alert("성공");
    },
    error: function () {
      alert("실패");
    },
  });
}
