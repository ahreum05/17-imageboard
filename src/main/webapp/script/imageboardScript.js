function inputCheck() {
	var frm = document.form1;

	if (frm.imageId.value.trim() == "" || frm.imageId.value.trim() == "img_") {
		alert("상품코드를 입력해주세요.");
		frm.imageId.value = "img_";
		frm.imageId.focus();
		return false;
	}
	if (!frm.imageName.value.trim()) {
		alert("상품명을 입력해주세요.");
		frm.imageName.value = "";
		frm.imageName.focus();
		return false;
	}
	if (!frm.imagePrice.value.trim() || isNaN(frm.imagePrice.value.trim())) {
		alert("단가를 숫자로 입력해주세요.");
		frm.imagePrice.value = "";
		frm.imagePrice.focus();
		return false;
	}

	if (!frm.imageQty.value.trim() || isNaN(frm.imageQty.value.trim())) {
		alert("상품개수를 숫자로 입력해주세요.");
		frm.imageQty.value = "";
		frm.imageQty.focus();
		return false;
	}
	if (!frm.imageContent.value.trim()) {
		alert("내용을 입력해주세요.");
		frm.imageContent.value = "";
		frm.imageContent.focus();
		return false;
	}
	// 파일이 선택되지 않은 경우
	if (!frm.image1.value) {
		alert("파일을 선택해주세요.");
		frm.image1.focus();
		return false;
	}

	frm.submit();
}