function checkImageType(fileName){//해당파일이 이미지인 경ㅇ를 체크하는 함수
	
	var pattern = /jpg|gif|png|jpeg/i;
	
	return fileName.match(pattern);

}

function getFileInfo(fullName){ //파라미터로 서버에서 전송된 파일의 이름을 사용.
		
	var fileName,imgsrc, getLink; //fileName변수는 경로나 UUID가 제외된 파일의 이름, imgsrc는 화면상에서 보여주는 썸네일이나 파일이미지경로, getLink는 화면에서 언본파일을 볼 수 있는 링크
	
	var fileLink;
	
	if(checkImageType(fullName)){
		imgsrc = "/displayFile?fileName="+fullName;
		fileLink = fullName.substr(14);
		
		var front = fullName.substr(0,12); // /2015/07/01/ 
		var end = fullName.substr(14);
		
		getLink = "/displayFile?fileName="+front + end;
		
	}else{
		imgsrc ="/resources/dist/img/file_icon.jpg";
		fileLink = fullName.substr(12);
		getLink = "/displayFile?fileName="+fullName;
	}
	fileName = fileLink.substr(fileLink.indexOf("_")+1);
	
	return  {fileName:fileName, imgsrc:imgsrc, getLink:getLink, fullName:fullName};
	
}



