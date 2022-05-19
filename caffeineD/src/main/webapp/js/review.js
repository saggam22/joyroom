

if (document.getElementsByName('loginUser')[0].value != '') {
	likeCheck();

	// 등록 팝업
	let target = document.querySelector('#btn_open');
	let btnPopClose = document.querySelector('#btn_close');
	let targetID;

	// 팝업 열기

	target.addEventListener('click', function() {
		targetID = this.getAttribute('href');
		document.querySelector(targetID).style.display = 'block';
	});

	// 팝업 닫기

	btnPopClose.addEventListener('click', function() {

		this.parentNode.parentNode.style.display = 'none';

		let starBtns = document.querySelectorAll('.starBtn');
		for (let i = 0; i < 5; i++) {
			let starImg = starBtns[i].childNodes[1];
			starImg.setAttribute('src', getPathRootJump() + '/img/eptstar.svg.png');
		}
		document.querySelector('#starVal').value = '';

		document.querySelector('#reviewInsert textarea').value = '';

		let reviewImgDiv = document.querySelector('#reviewImgDiv');
		if (reviewImgDiv) {
			reviewImgDiv.remove();
			uploadImg.value = '';

		}
	});
}

// 좋아요
let likeBtns = document.querySelectorAll('.likeBtn');

for (let i = 0; i < likeBtns.length; i++) {
	likeBtns[i].addEventListener('click', likeCallBack);
}

// 평점
let starBtns = document.querySelectorAll('.starBtn');

for (let i = 0; i < starBtns.length; i++) {
	starBtns[i].addEventListener('click', starCallBack);
}


// 사진 미리보기 수정, 삭제
var div_style = 'display:inline-block; position:relative; width:300px; height:300px; margin:5px;';
var img_style = 'position:absolute; width:100%; height:100%; object-fit:cover;';
var chk_style = 'width:25px; height:25px; position:absolute; font-size:15px;' +
	'right:0px; bottom:0px; z-index:999; background-color:rgba(0,0,0,0.5); color:white; border:none;';

var imgSection = document.querySelector('#imgSection');	// 이미지가 보여지는 섹션 div	
var uploadImg = document.querySelector('#uploadImg'); // file로 넘어오는 이미지

// 이미지 미리보기
uploadImg.addEventListener('change', (changeEvent) => {

	const reader = new FileReader();
	reader.addEventListener('load', function(readerEvent) {

		var reviewImgDiv = document.querySelector('#reviewImgDiv');	// 이미지와 삭제 버튼을 감싸는 div	

		if (reviewImgDiv) {
			reviewImgDiv.remove();
		}

		let div = document.createElement('div');
		div.setAttribute('style', div_style);
		div.setAttribute('id', 'reviewImgDiv')

		let img = document.createElement('img');
		img.setAttribute('style', img_style);
		img.setAttribute('id', 'reviewImg')
		img.setAttribute('src', readerEvent.target.result);

		imgSection.appendChild(div);	//<div id="imgSection"><div></div></div>
		div.appendChild(img)			//<div id="imgSection"><div><img></div></div>
		div.appendChild(makeX());		//<div id="imgSection"><div><img><btn></btn></div></div>

	});

	const img = changeEvent.target.files[0];
	reader.readAsDataURL(img);

})

// 이미지 삭제 버튼
function makeX() {

	var btn = document.createElement('input');
	btn.setAttribute('type', 'button');
	btn.setAttribute('value', 'x');
	btn.setAttribute('id', 'uploadBtn');
	btn.setAttribute('style', chk_style); // <div><img><input type="button"></div>

	btn.addEventListener('click', function(e) {
		e.target.parentNode.remove();
		uploadImg.value = '';

	})

	return btn;
}


// function
// 좋아요 정보 조회
function likeCheck() {

	let reviews = document.querySelectorAll('.review');

	for (let i = 0; i < reviews.length; i++) {
		fetch('likeCheck.do', {
			method: 'post',
			headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
			body: `reviewNo=${reviews[i].id}`
		})
			.then(result => result.json())
			.then(likeResult => {

				let likeBtn = document.getElementById(`likeBtn_${reviews[i].id}`);
				let likeHeart = document.getElementById(`heart_${reviews[i].id}`);

				if (likeResult.likeCheck === 'true') {
					likeBtn.setAttribute('name', 'like');
					likeHeart.setAttribute('src', getPathRootJump() + '/img/heart.svg.png');
				} else {
					likeBtn.setAttribute('name', 'unlike');
					likeHeart.setAttribute('src', getPathRootJump() + '/img/eptheart.svg.png');
				}

			})
			.catch(error => console.log(error));
	}


} //end of DOMLoadedCallBack()

// 좋아요 버튼 콜백
function likeCallBack() {

	// 버튼을 누르면 해당 리뷰의 전체 좋아요 수 +1
	// 현재 유저의 좋아요 정보 추가 -> 다시 들어왔을 때 좋아요가 미리 선택되어 있는 기능 구현하기 위함.

	let reviewNo = this.id.substr(8);
	let likeBtn = document.getElementById(`likeBtn_${reviewNo}`);
	let likeHeart = document.getElementById(`heart_${reviewNo}`);
	let likeCount = document.getElementById(`likeCount_${reviewNo}`);

	if (this.name === 'unlike') {

		likeBtn.setAttribute('name', 'like');
		likeHeart.setAttribute('src', getPathRootJump() + '/img/heart.svg.png');

		fetch('reviewLike.do', {
			method: 'post',
			headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
			body: `job=like&reviewNo=${reviewNo}`
		})
			.then(() => {
				likeCount.innerHTML = String(Number(likeCount.innerHTML) + 1);
			})
			.catch(error => console.log(error));

		// 한번 더 누르면 전체 좋아요수 -1 / 현재 유저의 좋아요 정보 삭제
	} else if (this.name === 'like') {

		likeBtn.setAttribute('name', 'unlike');
		likeHeart.setAttribute('src', getPathRootJump() + '/img/eptheart.svg.png')

		let reviewNo = this.id.substr(8);

		fetch('reviewLike.do', {
			method: 'post',
			headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
			body: `job=unlike&reviewNo=${reviewNo}`
		})
			.then(() => {
				likeCount.innerHTML = String(Number(likeCount.innerHTML) - 1);
			})
			.catch(error => console.log(error));
	} else if (this.name === 'nonUser') {
		alert('로그인이 필요합니다.')
	}


} //end of likeCallBack()

// 평점 콜백
function starCallBack() {
	let starBtns = document.querySelectorAll('.starBtn');

	for (let i = 0; i < 5; i++) {
		let starImg = starBtns[i].childNodes[1];
		starImg.setAttribute('src', getPathRootJump() + '/img/eptstar.svg.png');
	}

	for (let i = 0; i < Number(this.name); i++) {

		let starImg = starBtns[i].childNodes[1];
		starImg.setAttribute('src', getPathRootJump() + '/img/star.svg.png');
	}

	this.parentNode.childNodes[1].value = this.name;

}

// 절대 경로
function getPathRootJump() {
	var pathName = window.location.pathname.substring(1);
	var webName = pathName == '' ? '' : pathName.substring(0, pathName.indexOf('/'));
	var path_root = window.location.protocol + '//' + window.location.host + '/' + webName + '/';
	return path_root;
}