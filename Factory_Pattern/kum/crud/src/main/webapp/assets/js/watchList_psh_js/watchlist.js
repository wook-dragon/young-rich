
//대상객체.addEventListener(이벤트명, 실행할이벤트리스너, 이벤트전파방식)
window.onload = function(){
	var imgDiv = document.getElementsByClassName("imgDiv");
	var coverDiv= document.getElementsByClassName("coverDiv");
	//console.log(coverDiv[0]);
	function clickTicket(event){
		//let width = this.getAttribute("width");
		//let height = this.getAttribute("heigth");
		//coverDiv.setAttribute("visibility" ,"visible");
		coverDiv[0].style.display = "block";
		console.log(event);
		console.log(coverDiv[0].getAttribute("display"));
		console.log(coverDiv[0].style.display);
		//다른 공간을 누르면(document) 다시 coverDiv.style.display = "none"; 추가 
		//와치리스트는 사용자가 파일올리기로 해서 첨부하는 방식임
		
	};
	
//	function findCoverClose(){
//	
//		for(var i = 0; i<coverDiv.length; i++){
//			if(coverDiv[i].style.display == "block"){
//				coverDiv[i].style.display = "none";
//				
//			}
//		}
//	}
	function findCoverClose(e){
		var target = e.target;
		console.log(target);
		var img = document.getElementsByClassName("img")[0];
		//console.log(img);
		if(target != img){
			for(var i = 0; i<coverDiv.length; i++){
				if(coverDiv[i].style.display == "block"){
					coverDiv[i].style.display = "none";
				}
			}
		}
	}
	
//	imgDiv[0].addEventListener('click', clickTicket);
//	document.addEventListener("click", findCoverClose);
	
	
};

