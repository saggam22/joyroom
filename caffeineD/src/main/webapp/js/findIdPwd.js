function getParameter(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

let job = getParameter('job');

// 아이디 찾기
if (job==='findid') {
	
	// 찾기 버튼
	let iFindBtn = document.querySelector("#iFindBtn");
	let iTel1 = document.querySelector("#iTel1");
	let iTel2 = document.querySelector("#iTel2");
	let iTel3 = document.querySelector("#iTel3");
	let iFindDiv = document.querySelector("#iFindDiv");
	let iResultDiv = document.querySelector("#iResultDiv");
	
	iFindBtn.addEventListener('click', function() {
		console.log('click');
		fetch(getPathRootJump()+'userIdCheck.do', {
				method: 'post',
				headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
				body: `job=iFind&tel1=${iTel1.value}&tel2=${iTel2.value}&tel3=${iTel3.value}`
		})
			.then(result => result.json())
			.then(result => {
				if (result.error == 'cannot find') {	
					alert('입력한 정보에 해당하는 회원을 찾을 수 없습니다.');
				} else if (result.error === 'null') {
					alert('휴대전화 번호를 모두 입력해주세요. ');
				} else if (result.error === 'string') {
					alert('숫자만 입력할 수 있습니다.');
				} else {
					iFindDiv.style.display = 'none';
					iResultDiv.innerHTML = `찾으시는 아이디는 ${result.findId }입니다.`;
				}
				iTel1.value = '';
				iTel2.value = '';
				iTel3.value = '';
			})
			.catch(error => console.log(error));
	});
	
// 비밀번호 찾기
} else if (job==='findpwd') {
	
	//아이디 입력 버튼
	let idBtn = document.querySelector("#idBtn");
	let bUserId = document.querySelector("#bUserId");
	let bTelDiv = document.querySelector("#bTelDiv");
	let bIdDiv = document.querySelector("#bIdDiv");
	
	idBtn.addEventListener('click', function() {
		fetch(getPathRootJump()+'userIdCheck.do', {
				method: 'post',
				headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
				body: `job=bFindId&user=${bUserId.value}`
		})
			.then(result => result.json())
			.then(result => {
				if (result.userCheck === 'true') {
					bIdDiv.style.display = 'none';
					bTelDiv.style.display = 'block';
					let findId = document.getElementById('findId');
					findId.innerHTML = `입력하신 아이디는 ${bUserId.value }입니다.`;
				} else if (result.error === 'null') {
					alert('아이디를 입력해주세요.');
				} else {
					alert('입력하신 아이디를 찾을 수 없습니다.');
				}
				bUserId.value = '';
				
			})
			.catch(error => console.log(error))
	});
	
	// 찾기 버튼
	let bFindBtn = document.querySelector("#bFindBtn");
	let bTel1 = document.querySelector("#bTel1");
	let bTel2 = document.querySelector("#bTel2");
	let bTel3 = document.querySelector("#bTel3");
	let bFindDiv = document.querySelector("#bFindDiv");
	let bResultDiv = document.querySelector("#bResultDiv");
	
	bFindBtn.addEventListener('click', function() {
		console.log('click');
		fetch(getPathRootJump()+'userIdCheck.do', {
				method: 'post',
				headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
				body: `job=bFind&user=${bUserId.value}&tel1=${bTel1.value}&tel2=${bTel2.value}&tel3=${bTel3.value}`
		})
			.then(result => result.json())
			.then(result => {
				if (result.error == 'cannot find') {	
					alert('입력한 정보에 해당하는 회원을 찾을 수 없습니다.');
				} else if (result.error == 'null') {
					alert('휴대전화 번호를 모두 입력해주세요. ');
				} else if (result.error == 'string') {
					alert('숫자만 입력할 수 있습니다.');
				}  else {
					console.log(result.findPwd);
					bFindDiv.style.display = 'none';
					bResultDiv.innerHTML = `찾으시는 비밀번호는 ${result.findPwd }입니다.`;
				}
				bTel1.value = '';
				bTel2.value = '';
				bTel3.value = '';
			})
			.catch(error => console.log(error));
	});
	
}


function getPathRootJump() {
	var pathName = window.location.pathname.substring(1);
	var webName = pathName == '' ? '' : pathName.substring(0, pathName.indexOf('/'));
	var path_root = window.location.protocol + '//' + window.location.host + '/' + webName + '/';
	return path_root;
}

