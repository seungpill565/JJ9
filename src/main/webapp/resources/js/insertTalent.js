const select_main_cate = document.getElementById('select-cate-main');
const select_sub_cate = document.getElementById('select-cate-sub');

const xhttp1 = new XMLHttpRequest();

xhttp1.addEventListener('readystatechange', (e) => {
	const readyState = e.target.readyState;
	const responseText = e.target.responseText;
	
	if (readyState == 4) {
		
		console.log(responseText);
		const categories = JSON.parse(responseText);
		
		// select_sub_cate 내부의 첫번째 옵션을 제외하고 모두 지움.
		select_sub_cate.options.length = 1;
		
		// select_sub_cate 를 메인카테고리에 따라 채워준다.
		for (i = 0; i < categories.length; ++i) {
				
			const subCateOption = document.createElement('option');
			
			subCateOption.innerText = `${categories[i].cate_sub}`;
			
			subCateOption.value = `${categories[i].cate_sub}`;
			
			select_sub_cate.appendChild(subCateOption);
		};
	
	}
});

// 메인카테 select를 변경했을시 이벤트 발동
select_main_cate.addEventListener('change', (e) => {
	console.log('value :', e.target.value);
	xhttp1.open('GET', '/jj9/insertTalent/' + e.target.value);
	xhttp1.send();
});

