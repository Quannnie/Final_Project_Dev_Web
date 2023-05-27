// Nút home
document.addEventListener("DOMContentLoaded", function() {
  // Lấy tham chiếu đến nút chuyển hướng
  var redirectButton = document.getElementById("home-btn");
  // Gán sự kiện click cho nút chuyển hướng
  redirectButton.addEventListener("click", function() {
  // Chuyển hướng sang trang khác
  window.location.href = 'index.php';
  });
  });
  // Nút quay lại đầu trang
  $(document).ready(function() {
  $(window).scroll(function() {
  if ($(this).scrollTop() > 100) {
  $('#btnScrollToTop').removeClass('d-none');
  } else {
  $('#btnScrollToTop').addClass('d-none');
  }
  });
  $('#btnScrollToTop').click(function() {
  $('html, body').animate({ scrollTop: 0 }, 'slow');
  return false;
  });
  });
  // Điều chỉnh số lượng sản phẩm trong chi tiết sản phẩm
  document.getElementById("increase-quantity").addEventListener("click", function() {
  var input = document.querySelector("input[type='number']");
  input.stepUp();
  });
  document.getElementById("decrease-quantity").addEventListener("click", function() {
  var input = document.querySelector("input[type='number']");
  input.stepDown();
  });
  // Xóa các giá trị lọc và tải lại trang khi người dùng nhấn nút Hủy lọc
  function resetFilters() {
  // Tải lại trang hoặc gửi yêu cầu AJAX để truy vấn lại toàn bộ sản phẩm
  window.location.href = "index.php?act=danhmuc";
  }


  //Nút Search
  document.getElementById("search-link").addEventListener("click", function(event) {
    event.preventDefault(); // Ngăn chặn việc chuyển trang mặc định của thẻ <a>
    
    var keyword = document.getElementById("search-input").value;
    var searchURL = "index.php?act=ketquatimkiem&keyword=" + encodeURIComponent(keyword);
    
    window.location.href = searchURL; // Chuyển hướng trang đến URL tìm kiếm
});