function shAllocated() {
       var e = document.getElementById("allocated");
       if(e.style.display == 'block')
          e.style.display = 'none';
       else
          e.style.display = 'block';
    }

function shUnallocated() {
       var e = document.getElementById("unallocated");
       if(e.style.display == 'block')
          e.style.display = 'none';
       else
          e.style.display = 'block';
    }

function displayMsg(failureMessage){
	if(failureMessage!=null){
		alert(failureMwessage);
	}
}