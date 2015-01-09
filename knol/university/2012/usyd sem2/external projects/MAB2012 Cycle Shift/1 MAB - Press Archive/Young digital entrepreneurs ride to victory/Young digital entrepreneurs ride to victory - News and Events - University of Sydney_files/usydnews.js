
function subscribeModSelectToggle(toggleSwitch, labelID) {
	var form = toggleSwitch.form, z = 0;
	for(z=0; z<form.length;z++){
		if(form[z].type == 'checkbox' && form[z].name != 'checkall'){
			form[z].checked = toggleSwitch.checked;
	  	}
	}
	
	if (toggleSwitch.checked) {  
		document.getElementById(labelID).innerHTML = "<strong>Unselect all<strong>";
	} else {
		document.getElementById(labelID).innerHTML = "<strong>Select all<strong>";		
	}
}

function expandSummary(img) {
	var row = img.parentNode.parentNode;
	if (row.nextSibling.style.display == 'none') {
		row.nextSibling.style.display = '';
		img.src = '/news/img/minus.png';
	} else {
		row.nextSibling.style.display = 'none';
		img.src = '/news/img/plus.png';
	}
}

function expandAllSummaries(img) {
	var table = img.parentNode.parentNode.parentNode.parentNode;
	var tbodies = table.getElementsByTagName('tbody');
	if (img.nextSibling.nodeValue == ' Expand all') {
		img.nextSibling.nodeValue = ' Collapse all';
		img.src = '/news/img/minus.png';
		var display = '';
	} else {
		img.nextSibling.nodeValue = ' Expand all';
		img.src = '/news/img/plus.png';
		var display = 'none';
	}
	for (var i = 0; i < tbodies.length; i++) {
		if (tbodies[i].parentNode == table) {
			tbodies[i].childNodes[1].style.display = display;
			tbodies[i].firstChild.getElementsByTagName('IMG')[0].src = img.src;
		}
	}
}

function unhashEmail(a) {
	if (a.href && a.href.indexOf('mailto:') != -1 && hashkey && a.className == 'unhashme') {
		a.className = '';
		idkey = a.href.substr(7);
		key = hashkey;
		var xorkey = "";
		var idx = 0;
		while (xorkey.length < idkey.length) {
			if (idx > key.length) idx = 0;
			xorkey+= key.substr(idx, 1);
			idx++;
		}
		var hashed = idkey;
		var string = "";
		var count = 0;
		for (i=0; i < hashed.length; i+=2) {
			string+= String.fromCharCode(parseInt('0x'+hashed.substr(i,2)) ^ xorkey.charCodeAt((i/2)%xorkey.length));
		}
		a.href = 'mailto:'+string;
	}
}

function unhashEmailText(key) {
	var tags = document.getElementsByTagName('A');
	for (i=0; i < tags.length; i++) {
		var s = tags[i];
		if (s.className == 'unhashme') {
			hashval = s.innerHTML;
			var xorkey = "";
			var idx = 0;
			while (xorkey.length < hashval.length) {
				if (idx > key.length) idx = 0;
				xorkey+= key.substr(idx, 1);
				idx++;
			}
			var hashed = hashval;
			var string = "";
			var count = 0;
			for (o=0; o < hashed.length; o+=2) {
				string+= String.fromCharCode(parseInt('0x'+hashed.substr(o,2)) ^ xorkey.charCodeAt((o/2)%xorkey.length));
			}
			s.innerHTML = string;
		}
	}
}

var retrievedMonths = [];
function mygetdatefunc(day) {
	var mth = day.getFullYear()+''+(day.getMonth()+1);
	if (retrievedMonths.search(mth) == -1) {
		retrievedMonths[retrievedMonths.length] = mth;
		loadXMLDoc(xmldocurl+(xmldocurl.search(/\?/) == -1 ? '?' : '&')+'siteid='+siteid+'&year='+day.getFullYear()+'&month='+(day.getMonth()+1), updateCalendarLinks, this);
	}
	return this.originalGetDateFunc(day);
}

var req = null;
var reqObj = null;
function updateCalendarLinks() {
	if (req.readyState == 4) {
		if (req.status == 200) {
			var dates = req.responseXML.getElementsByTagName('date');
			for (var i = 0; i < dates.length; i++) {
				if (dates[i].firstChild) reqObj.setDateFunc(dates[i].firstChild.nodeValue, loadCal);
			}
			reqObj.refresh();
		}
	}
}

function loadXMLDoc(url, func, obj) {
	req = false;
	if (window.XMLHttpRequest) {
		try {
			req = new XMLHttpRequest();
		} catch (e) {
			req = false;
		}
	} else if (window.ActiveXObject) {
		try {
			req = new ActiveXObject('Msxml2.XMLHTTP');
		} catch(e) {
			try {
				req = new ActiveXObject('Microsoft.XMLHTTP');
			} catch(e) {
				req = false;
			}
		}
	}
	if (req) {
		reqObj = obj;
		req.onreadystatechange = func;
		req.open('GET', url, true);
		req.send('');
	}
}

function loadCal(day) {
	window.location = calDayURL+(calDayURL.search(/\?/) == -1 ? '?' : '&')+'year='+day.getFullYear()+'&month='+(day.getMonth()+1)+'&day='+day.getDate();
}
