StarAvg();

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

		let reviewImg = document.querySelector('#reviewImg');
		let uploadImg = document.querySelector('#uploadImg');
		let imgDelBtn = document.querySelector('#imgDelBtn');
			if (reviewImg) {
				reviewImg.setAttribute('id', 'firstImg');
				reviewImg.setAttribute('src', getPathRootJump() + `/img/emptyimg.jpg`);
				imgDelBtn.remove();
				uploadImg.value = '';
			}
			
		let topBtn = document.querySelector('#topBtn');
		topBtn.style.display = 'block';
	});
}


// 좋아요 버튼 이벤트
let likeBtns = document.querySelectorAll('.likeBtn');

for (let i = 0; i < likeBtns.length; i++) {
	likeBtns[i].addEventListener('click', likeCallBack);
}


// 평점 버튼 이벤트
let starBtns = document.querySelectorAll('.starBtn');

for (let i = 0; i < starBtns.length; i++) {
	starBtns[i].addEventListener('click', starCallBack);
}


// 사진 미리보기 수정, 삭제
var div_style = 'display:inline-block; position:relative; width:300px; height:300px; margin:5px;';
var img_style = 'width:100%; height:100%; object-fit:cover;';
var chk_style = 'width:25px; height:25px; position:absolute; font-size:15px;' +
	'right:0px; bottom:0px; z-index:999; background-color:rgba(0,0,0,0.5); color:white; border:none;';
var imgSection = document.querySelector('#imgSection');

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


// 업로드된 이미지 삭제 버튼
function makeX() {

	let reviewImg = document.querySelector('#reviewImg');
	var uploadImg = document.querySelector('#uploadImg'); 
	
	let btn = document.createElement('input');
	btn.setAttribute('type', 'button');
	btn.setAttribute('value', 'x');
	btn.setAttribute('id', 'uploadBtn');
	btn.setAttribute('style', chk_style); 

	btn.addEventListener('click', function(e) {
		
		reviewImg.setAttribute('id', 'firstImg');
		reviewImg.setAttribute('src', getPathRootJump() + `/img/emptyimg.jpg`);
		this.remove();
		uploadImg.value = '';

	})

	return btn;
}





// function
// 평균 평점 조회
function StarAvg() {
	let cafeNo = document.getElementsByName('cafeNo')[0].value;
	fetch('starAvg.do', {
			method: 'post',
			headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
			body: `cafeNo=${cafeNo}`
		})
			.then(result => result.json())
			.then(reviewInfo => {
				// 리뷰 평균
				let starAvg = document.querySelector('#star_avg');
				let text = document.createTextNode(reviewInfo.starAvg);
				starAvg.appendChild(text);
				
				// 평균으로 별 출력
				let starShow = document.querySelector('#star_show');
				if (Number(reviewInfo.starAvg) > 4) {
					text = document.createTextNode('★★★★★');
				} else if (Number(reviewInfo.starAvg) > 3) {
					text = document.createTextNode('★★★★☆');
				} else if (Number(reviewInfo.starAvg) > 2) {
					text = document.createTextNode('★★★☆☆');
				} else if (Number(reviewInfo.starAvg) > 1) {
					text = document.createTextNode('★★☆☆☆');
				} else {
					text = document.createTextNode('★☆☆☆☆');
				}
				starShow.appendChild(text);
				
				// 리뷰 
				let reviewCount = document.querySelector('#review_count');
				text = document.createTextNode('리뷰 ' + reviewInfo.reviewCount);
				reviewCount.appendChild(text);
				
				// 점수에 따른 평점 개수
				
				let trs = document.querySelectorAll('tr');
				
				// 반복문 돌리고 싶따...
				let td = document.createElement('td');
				text = document.createTextNode(reviewInfo.starCount_1);
				td.appendChild(text);
				trs[0].appendChild(td);
				td = document.createElement('td');
				text = document.createTextNode(reviewInfo.starCount_2);
				td.appendChild(text);
				trs[1].appendChild(td);
				td = document.createElement('td');
				text = document.createTextNode(reviewInfo.starCount_3);
				td.appendChild(text);
				trs[2].appendChild(td);
				td = document.createElement('td');
				text = document.createTextNode(reviewInfo.starCount_4);
				td.appendChild(text);
				trs[3].appendChild(td);
				td = document.createElement('td');
				text = document.createTextNode(reviewInfo.starCount_5);
				td.appendChild(text);
				trs[4].appendChild(td);
				
				let graphs = document.querySelectorAll('.star_count_show_color');
				reviewCount = Number(reviewInfo.reviewCount);
				let starCount_1 = Number(reviewInfo.starCount_1);
				let starCount_2 = Number(reviewInfo.starCount_2);
				let starCount_3 = Number(reviewInfo.starCount_3);
				let starCount_4 = Number(reviewInfo.starCount_4);
				let starCount_5 = Number(reviewInfo.starCount_5);
				console.log(graphs[0]);
				
				graphs[0].setAttribute('style', `width: ${120*(starCount_1/reviewCount)}px;`);
				graphs[1].setAttribute('style', `width: ${120*(starCount_2/reviewCount)}px;`);
				graphs[2].setAttribute('style', `width: ${120*(starCount_3/reviewCount)}px;`);
				graphs[3].setAttribute('style', `width: ${120*(starCount_4/reviewCount)}px;`);
				graphs[4].setAttribute('style', `width: ${120*(starCount_5/reviewCount)}px;`);
				
				
			})
			.catch(error => console.log(error));
}


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
				console.log(likeResult.likeCheck)
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

} // end of starCallBack()


// 절대 경로
function getPathRootJump() {
	var pathName = window.location.pathname.substring(1);
	var webName = pathName == '' ? '' : pathName.substring(0, pathName.indexOf('/'));
	var path_root = window.location.protocol + '//' + window.location.host + '/' + webName + '/';
	return path_root;
}