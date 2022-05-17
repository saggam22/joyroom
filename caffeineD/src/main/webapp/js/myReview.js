//document.addEventListener('DOMContentLoaded', DOMLoadedCallBack);
likeCheck();

// 좋아요 버튼
let likeBtns = document.querySelectorAll('.likeBtn');

for (let i = 0; i < likeBtns.length; i++) {
	likeBtns[i].addEventListener('click', likeCallBack);
}

// 삭제 팝업
let delBtns = document.querySelectorAll('.delBtn');
for (let i = 0; i < delBtns.length; i++) {
	delBtns[i].addEventListener('click', function() {
		console.log('click')
		let result = confirm('정말로 삭제하시겠습니까?');
		if (result) {
			console.log("yes")
			fetch('reviewDelete.do', {
				method: 'post',
				headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
				body: `job=like&reviewNo=${this.name.substr(7)}`
			})
				.then(result => result.json())
				.then(result => {
					alert(`${result.message}`);
					location.reload();
				})
				.catch(error => console.log(error));
		}
	});
}

// 평점
let starBtns = document.querySelectorAll('.starBtn');

for (let i = 0; i < starBtns.length; i++) {
	starBtns[i].addEventListener('click', starCallBack);
}

// 사진 미리보기
const reader = new FileReader();
reader.onload = (readerEvent) => {
	document.querySelector('#reviewImg').setAttribute("src", readerEvent.target.result);
};

document.querySelector('#uploadImg').addEventListener('change', (changeEvent) => {
	const imgFile = changeEvent.target.files[0];
	reader.readAsDataURL(imgFile);
})

// 수정 팝업
let target = document.querySelectorAll('.btn_open');
let btnPopClose = document.querySelectorAll('.pop_wrap .btn_close');
let targetID;

	// 팝업 열기
for (let i = 0; i < target.length; i++) {
	target[i].addEventListener('click', openPopCallBack);
}
	// 팝업 닫기
for (let i = 0; i < target.length; i++) {
	btnPopClose[i].addEventListener('click', closePopCallBack);
}



function likeCheck() {

	// 좋아요 체크 조회
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


} //end of likeCheck()


//좋아요 버튼 콜백
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

} //end of starCallBack()


// 팝업 열기 콜백
function openPopCallBack() {

	targetID = this.getAttribute('href');
	let popDiv = document.querySelector(targetID);
	popDiv.style.display = 'block';

	fetch('reviewSelect.do', {
		method: 'post',
		headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
		body: `reviewNo=${this.parentNode.id}`
	})
		.then(result => result.json())
		.then(review => {

			// 이미지	불러오기
			let imgSection = document.getElementById('imgSection');
			let img = document.createElement('img');
			img.setAttribute('id', 'reviewImg');
			img.setAttribute('width', '300px');

			if (review.img != null) {
				img.setAttribute('src', getPathRootJump() + `/upload/${review.img}`);
			}

			imgSection.appendChild(img);

			// 평점 불러오기
			let starBtns = document.querySelectorAll('.starBtn');
			for (let i = 0; i < Number(review.star); i++) {
				let starImg = starBtns[i].childNodes[1];
				starImg.setAttribute('src', getPathRootJump() + '/img/star.svg.png');
			}
			document.querySelector('#updateStar .starVal').value = review.star;

			// 리뷰 내용, 리뷰 넘버 불러오기
			let content = review.content;

			document.querySelector('#reviewUpdate textarea').value = content;
			document.querySelector('#reviewNo').value = review.no;

		})
		.catch(error => console.log(error));

}

// 팝업 닫기 콜백
function closePopCallBack() {

	this.parentNode.parentNode.style.display = 'none';

	let starBtns = document.querySelectorAll('.starBtn');
	for (let i = 0; i < 5; i++) {
		let starImg = starBtns[i].childNodes[1];
		starImg.setAttribute('src', getPathRootJump() + '/img/eptstar.svg.png');
	}

	document.querySelector('#reviewUpdate textarea').value = '';

	let reviewImg = document.querySelector('#reviewImg');
	if (reviewImg.src != null) {
		reviewImg.src = '';
	}

}

// 절대 경로
function getPathRootJump() {
	var pathName = window.location.pathname.substring(1);
	var webName = pathName == '' ? '' : pathName.substring(0, pathName.indexOf('/'));
	var path_root = window.location.protocol + '//' + window.location.host + '/' + webName + '/';
	return path_root;
}